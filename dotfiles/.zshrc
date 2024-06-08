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

source $HOME/.xsh_aliases

alias juinstall="git clone https://github.com/fsquillace/junest.git $HOME/.local/share/junest"
export PATH="$PATH:$HOME/.junest/usr/bin_wrappers"
export PATH=$HOME/.local/share/junest/bin:$PATH

export UENV=$HOME/uenv
export DOTFILES=${UENV}/dotfiles

alias stowdot='stow -d ${DOTFILES}/ -t $HOME/ .'

export PATH
