# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/design/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source $HOME/.sh_aliases

alias juinstall="git clone https://github.com/fsquillace/junest.git $HOME/.local/share/junest"
export PATH="$PATH:$HOME/.junest/usr/bin_wrappers"
export PATH=$HOME/.local/share/junest/bin:$PATH

export UENV=$HOME/uenv
export DOTFILES=${UENV}/dotfiles

alias stowdot='stow -d ${DOTFILES}/ -t $HOME/ .'

LOCAL_BIN=$HOME/.local/bin
LOCAL_SHARE=$HOME/.local/share


IS_TERMUX=$(echo $PREFIX | grep -c 'com.termux')

if [ $IS_TERMUX = 1 ]; then
	echo "in termux"
else
	echo "no termux"
fi

export IS_TERMUX

if [ ! -e $LOCAL_BIN/oh-my-posh ] && [ $IS_TERMUX = 0]; then
	mkdir -p $LOCAL_BIN
	curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $LOCAL_BIN/
	export PATH=$LOCAL_BIN:$PATH
fi

eval "$(oh-my-posh init zsh)"