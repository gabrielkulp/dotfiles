# Gabriel's Dotfiles

## Installation

Run the following, after installing `git`:
```sh
git clone --separate-git-dir=~/.dotfiles "git@github.com:gabrielkulp/dotfiles.git" ~/dotfiles-tmp
```

Or if not planning to set up `ssh` keys:
```sh
git clone --separate-git-dir=~/.dotfiles "https://github.com/gabrielkulp/dotfiles.git" ~/dotfiles-tmp
```

Then in either case, continue with:
```
cp ~/dotfiles-tmp/.gitmodules ~  # if using Git submodules
rm -r ~/dotfiles-tmp/
alias config='GIT_DIR=~/.dotfiles GIT_WORK_TREE=~ git'
config config --local status.showUntrackedFiles no
config checkout  # will complain about collisions
```

## Usage

```sh
config status
config add .bashrc
config commit -m "update bashrc"
config push
```

