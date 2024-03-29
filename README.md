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
echo '.ssh/config filter=crypt diff=crypt merge=crypt' >> $HOME/.dotfiles/info/attributes
echo 'PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
source ~/.bashrc

cd .dotfiles
transcrypt

config pull origin master
config remote set-url origin git@github.com:prokopiff/dotfiles.git
```

## Install software
```sh
sudo apt install -y neofetch jq smplayer geany terminator zsh gcc build-essential libxcb1-dev libxcb-render0-dev libxcb-xfiles0-dev micro exa bat

# oh-my-zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc{.pre-oh-my-zsh,}

# Rust and tools
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
cargo install broot
cargo install du-dust
cargo install tokei

# starship
bash -c "$(curl -fsSL https://starship.rs/install.sh)"

# zsh plugins
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Install fonts
https://github.com/adobe-fonts/source-code-pro/releases/
