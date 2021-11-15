# dotfiles

## Initial setup

```sh
sudo apt install git
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
config add origin git@github.com:prokopiff/dotfiles.git
config pull origin master
```

## Install software
```sh
sudo apt install neofetch filezilla jq smplayer geany terminator
```
