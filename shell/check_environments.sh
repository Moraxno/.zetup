typeset zetup_envs=()
typeset -T -x ZETUP_ENVS zetup_envs
typeset -U ZETUP_ENVS zetup_envs

# Termux
function check_termux() {
    echo $PREFIX | grep "com.termux" > /dev/null
    RETVAL=$?
}

export ZETUP_ENVS
