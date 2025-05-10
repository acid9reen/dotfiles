#!/usr/bin/env python3

import gi
import os
import json
import re

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk

Gtk.init()


def resolve_icon_path(iconName: str) -> str:
    iconTheme = Gtk.IconTheme.get_default()
    iconName = (
        iconName
        if not iconName.startswith("org.")
        else " ".join(iconName.split(".")[1:3])
    )

    if "firefox" in iconName.lower():
        iconName = "firefox"
    elif "code" in iconName.lower():
        iconName = "vscode"

    candidates = [
        iconName,
        iconName.lower(),
        iconName.lower().replace(" ", "-"),
        iconName.lower().replace(" ", "_"),
        iconName.lower().replace("_", "-"),
    ]
    for name in candidates:
        for size in [32, 48, 64, 128]:
            iconFile = iconTheme.lookup_icon(name, size, 0)
            print(name)
            if iconFile:
                return iconFile.get_filename()
    return "/home/ruslan/.icons/Gruvbox-Plus-Dark/apps/32/help.svg"


def map_window(w: dict) -> str:
    initial_class: str = w["initialClass"].capitalize()
    if initial_class.lower().startswith("org."):
        initial_class = " ".join(initial_class.split(".")[1:3])

    if initial_class.lower().startswith("com."):
        initial_class = " ".join(initial_class.split(".")[2:])

    initial_class = initial_class.replace("-", " ")
    initial_class = initial_class.replace("_", " ")
    initial_class = " ".join(map(str.capitalize, initial_class.split(" ")))

    return "img:%s:text:%s" % (
        resolve_icon_path(w["class"]),
        "%s: %s (%s)" % (initial_class, w["title"], w["address"]),
    )


def main() -> None:
    windows = json.loads(os.popen("hyprctl -j clients").read())
    filtered_windows = list(filter(lambda w: w["workspace"]["id"] != -1, windows))
    mapped_windows = list(map(map_window, filtered_windows))

    selected_window = os.popen(
        'echo "%s" | wofi -S dmenu' % ("\n".join(mapped_windows))
    ).read()

    if selected_window:
        match = re.search(r"\((\w+)\)$", selected_window)
        addr = match.group(1).split("_")[0]
        os.system("hyprctl dispatch focuswindow address:%s" % (addr))


if __name__ == "__main__":
    raise SystemExit(main())
