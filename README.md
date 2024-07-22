# My .dotfiles

Config today to not config tomorrow.

## Installation

Clone the repo:
```bash
git clone git@github.com:kawanamelung/.dotfiles.git
```

$DOTFILES is automatically set to $HOME/.dotfiles.
If directory is not $HOME/.dotfiles, set the $DOTFILES environment variable:
```bash
export DOTFILES=path/to/.dotfiles
```

Run the install script for stow simlinks (check install.sh for comments):
```bash
cd ~/.dotfiles
./install.sh
```

## Extras
If you aren't using zsh, you can source the dotfiles via:
```bash
source $DOTFILES/shell/source.sh
```

This is only for my secrets:
```bash
source $dotfiles/secrets/secrets.sh
```

To test if everything is working, run:
```bash
make_forest.py
```

