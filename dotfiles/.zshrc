# Allow profiling of shell initialization
zmodload zsh/zprof

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=4096
SAVEHIST=$HISTSIZE
HISTDUP=erase



IS_TERMUX=$(echo $PREFIX | grep -c 'com.termux')

LOCAL_BIN=$HOME/.local/bin
LOCAL_SHARE=$HOME/.local/share


export UENV=$HOME/uenv
export DOTFILES=${UENV}/dotfiles


if [ ! -e $LOCAL_BIN/oh-my-posh ] && [ "${IS_TERMUX}" = "0" ]; then
	mkdir -p $LOCAL_BIN
	curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $LOCAL_BIN/
fi
path+=$LOCAL_BIN

eval "$(oh-my-posh init zsh --config $UENV/configs/oh-my-posh/minimal.toml)"

setopt appendhistory
setopt sharehistory
bindkey -e

# protect path from duplicates
typeset -U path


source $HOME/.sh_aliases

alias juinstall="git clone https://github.com/fsquillace/junest.git $HOME/.local/share/junest"
path+="$HOME/.junest/usr/bin_wrappers"
path=($path $HOME/.local/share/junest/bin)

alias stowdot='stow -d ${DOTFILES}/ -t $HOME/ .'

export PATH

ZINIT_HOME="${LOCAL_SHARE}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone "https://github.com/zdharma-continuum/zinit.git" "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"


zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# autoload -Uz compinit
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
# 	compinit;
# else
# 	compinit -C;
# fi;