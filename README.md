# Dotfiles

## Prerequisites

```bash
brew install gh pandoc tectonic
brew install --cask nikitabobko/tap/aerospace
```

## Apply dotfiles

```bash
mkdir -p ~/.config

git clone https://github.com/davigar15/dotfiles
cd dotfiles/

ln -s `pwd`/nvim ~/.config/nvim
ln -s `pwd`/tmux ~/.config/tmux
ln -s `pwd`/gh ~/.config/gh
ln -s `pwd`/aerospace ~/.config/aerospace
ln -s `pwd`/ghostty ~/.config/ghostty
```
