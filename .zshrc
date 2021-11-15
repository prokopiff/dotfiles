export ZSH="/home/vp/.oh-my-zsh"

ZSH_THEME="muse"

plugins=(git adb aws cp docker docker-compose docker-machine gnu-utils gradle history httpie man mvn npm nvm pip sdk sudo rust rustup cargo)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nano'
else
	export EDITOR='micro'
fi

source /home/vp/.config/broot/launcher/bash/br
alias brls='br -d -p -g -h' # cargo install broot
alias zshconfig="micro ~/.zshrc"
alias zshr="reset && source ~/.zshrc"
alias tailf="tail -f"
alias dkillall='docker kill $(docker container ls -q)'
alias cat="batcat"
alias ll="exa -lha --group-directories-first"
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
setopt hist_ignore_all_dups hist_save_nodups
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

eval "$(starship init zsh)"

[ $[ $RANDOM % 5 ] = 0 ] && fortune | cowsay || neofetch
