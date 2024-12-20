# Set up the prompt

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

function reload() {
    . "$HOME/.zshrc"
}

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export ZETUP_DIR="$HOME/.zetup"
export STOW_DIR="$ZETUP_DIR/dotfiles"

. "$HOME/.zetup/shell/feature_flags.sh"

if cargo_flag ; then
   . "$HOME/.cargo/env"
   if check_imms ; then
       . "$HOME/export-esp.sh"
   fi
fi

. "$HOME/.zetup/shell/zsh_aliases.sh"
. "$HOME/.zetup/shell/zsh_history.sh"
. "$HOME/.zetup/shell/zsh_keybinds.sh"

alias stowz='stow -t $HOME'

stowz common

eval "$(starship init zsh)"


