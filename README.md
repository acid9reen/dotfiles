# My dotfiles

This repository contains the dotfiles for my system

## Requirements

Ensure you have following installed on your system

* Git
* Stow

If not, install via your package manager

For fedora:

```bash
sudo dnf install git stow
```

## Installation

First, check out the dotfiles repository in your $HOME directory using git

```bash
git clone git@github.com:acid9reen/dotfiles.git
cd dotfiles
```

Then use GNU Stow to create symlinks

```bash
stow .
```
