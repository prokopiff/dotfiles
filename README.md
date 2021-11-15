# dotfiles

## Initial setup

```sh
sudo apt install -y git
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
config remote add origin https://github.com/prokopiff/dotfiles.git
echo '.zsh_history filter=crypt diff=crypt merge=crypt' >> $HOME/.dotfiles/info/attributes
echo '.work_aliases filter=crypt diff=crypt merge=crypt' >> $HOME/.dotfiles/info/attributes
echo 'PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
source ~/.bashrc

cd .dotfiles
transcrypt

config pull origin master
config remote set-url origin git@github.com:prokopiff/dotfiles.git
```

## Install software
```sh
sudo apt install -y neofetch jq smplayer geany terminator zsh

# oh-my-zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
