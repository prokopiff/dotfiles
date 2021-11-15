# dotfiles

## Initial setup

```sh
sudo apt install -y git
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
config remote add origin https://github.com/prokopiff/dotfiles.git
config pull origin master
config remote set-url origin git@github.com:prokopiff/dotfiles.git
```

## Install software
```sh
sudo apt install -y neofetch filezilla jq smplayer geany terminator
```
