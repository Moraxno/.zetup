source $ZETUP_DIR/shell/feature_flags.sh

# ls shortcuts
alias ll="ls -lah --color=auto"
alias l="ls -l --color=auto"

# cd shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"


if project_alias_flag; then
    alias tireless="cd $HOME/Projects/TIRELESS"
fi
