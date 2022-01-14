export ZSH="/home/vp/.oh-my-zsh"

ZSH_THEME="muse"

plugins=(
    git
    docker
    docker-compose
    gnu-utils
    history
    httpie
    man
    mvn
    sdk
    sudo
    rust
    bazel
#    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='vim'
fi

source /home/vp/.config/broot/launcher/bash/br
alias brls='br -d -p -g -h' # cargo install broot
alias zshconfig="vim ~/.zshrc"
alias zshr="reset && source ~/.zshrc"
alias tailf="tail -f"
alias dkillall='docker kill $(docker container ls -q)'
alias cat="bat"
alias ll="exa --group-directories-first -l -h -a"
alias a="alias | rg"
alias config='git --git-dir=/home/vp/.dotfiles/ --work-tree=/home/vp'
alias wttr='curl https://wttr.in/Ivano-Frankivsk'
alias du='dust -r' #cargo install dust
alias mount='mount | column -t'
alias fd='fdfind'

alias aptup='sudo apt update && sudo apt upgrade'
alias apti='sudo apt install'
alias apts='sudo apt search'
alias aptr='sudo apt remove'

function webcheat() {
	curl "cheat.sh/$1"
}

function crypto() {
	curl "rate.sx/$1"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/vp/.sdkman"
[[ -s "/home/vp/.sdkman/bin/sdkman-init.sh" ]] && source "/home/vp/.sdkman/bin/sdkman-init.sh"

export PATH=$PATH:/home/vp/Tools/kafka_2.13-2.7.0/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vp/Tools/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vp/Tools/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vp/Tools/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vp/Tools/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=$PATH:/home/vp/Tools/
source /home/vp/.work_aliases
source $HOME/.cargo/env
export PATH=~/.local/bin:"$PATH"
export PATH=$PATH:/usr/local/go/bin
fpath+=${ZDOTDIR:-~}/.zsh_functions

setopt autocd
setopt auto_pushd

HISTSIZE=2000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=100000             #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
export HISTORY_IGNORE="(ls|ll|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
setopt hist_ignore_all_dups hist_save_nodups
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
#bindkey '^ ' autosuggest-accept

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### BASH INSULTER (works in zsh though) ###
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

if [ "$IN_IDEA" != "1" ]; then
	eval "$(starship init zsh)"
	[ $[ $RANDOM % 5 ] = 0 ] && fortune | cowsay || neofetch
fi
