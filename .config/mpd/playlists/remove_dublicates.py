import argparse
import asyncio
import shutil
import typing as tp
from concurrent.futures import ProcessPoolExecutor
from functools import partial
from pathlib import Path


class DublicationRemoverNamespace(argparse.Namespace):
    filepath: Path
    backup: bool
    num_workers: int


BACKUP_EXT = ".bak"


def parse_args() -> DublicationRemoverNamespace:
    parser = argparse.ArgumentParser()

    parser.add_argument("filepath", type=Path, help="Path to target playlist/s")
    parser.add_argument("-n", "--num-workers", type=int, help="Num of cpu processes")
    parser.add_argument(
        "-b", "--backup", action="store_true", help="Create backup file"
    )

    return parser.parse_args(namespace=DublicationRemoverNamespace())


def remove_dublicates[_T](objs: tp.Iterable[_T]) -> list[_T]:
    deduplicated = list(set(objs))
    deduplicated.sort(key=lambda x: str(x).casefold())

    return deduplicated


def process_playlist(filepath: Path, *, do_backup: bool = False) -> None:
    with open(filepath, "r") as playlist:
        lines = playlist.readlines()

    if do_backup:
        shutil.copy(filepath, filepath.parent / (filepath.name + BACKUP_EXT))

    wo_dublicates = remove_dublicates(lines)

    with open(filepath, "w") as playlist:
        playlist.writelines(wo_dublicates)


async def process_many(
    filepaths: tp.Iterable[Path], num_workers: int, *, do_backup: bool = False
) -> None:
    loop = asyncio.get_running_loop()
    with ProcessPoolExecutor(num_workers) as pool:
        tasks = []
        for playlist in filepaths:
            tasks.append(
                loop.run_in_executor(
                    pool, partial(process_playlist, playlist, do_backup=do_backup)
                )
            )

        counter = 0
        for task in asyncio.as_completed(tasks):
            await task
            counter += 1
            print(f"Process {counter} of {len(tasks)}", end="\r")


async def main() -> int:
    args = parse_args()

    if args.filepath.is_dir():
        await process_many(
            args.filepath.glob("*.m3u"), args.num_workers, do_backup=args.backup
        )
    else:
        process_playlist(args.filepath, do_backup=args.backup)

    return 0


if __name__ == "__main__":
    raise SystemExit(asyncio.run(main()))
