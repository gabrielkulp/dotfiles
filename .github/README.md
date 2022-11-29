# Gabriel's Dotfiles

## Installation

Run the following, after installing `git`:
```sh
git clone "--separate-git-dir=$HOME/.dotfiles" "git@github.com:gabrielkulp/dotfiles.git" "$HOME/dotfiles-tmp"
```

Or if not planning to set up `ssh` keys:
```sh
git clone "--separate-git-dir=$HOME/.dotfiles" "https://github.com/gabrielkulp/dotfiles.git" "$HOME/dotfiles-tmp"
```

Then in either case, continue with:
```
cp ~/dotfiles-tmp/.gitmodules ~  # if using Git submodules
rm -r ~/dotfiles-tmp/
alias config='GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git'
config config --local status.showUntrackedFiles no
config checkout  # will complain about collisions
config restore ~/*  # will force-overwrite collisions
```

## Usage

```sh
config status
config add .bashrc
config commit -m "update bashrc"
config push
```

