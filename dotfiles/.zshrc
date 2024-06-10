# Robert's zsh setup

# allow zsh profiling
zmodload zsh/zprof

# Environment
UENV=$HOME/uenv
DOTFILES=$UENV/dotfiles
OMP_CONFIG=$UENV/configs/oh-my-posh/work.omp.yaml

# load oh-my-posh layout
eval "$(oh-my-posh init zsh --config $OMP_CONFIG)"

# load my subscripts
source $DOTFILES/.sh_aliases

#autoload -U compinit
#compinit

#allow tab completion in the middle of a word
#.setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
