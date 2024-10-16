# Termux
function check_termux() {
    echo $PREFIX | grep "com.termux" > /dev/null
    return $?
}

# WSL
function check_wsl1() {
    uname -a | grep "WSL " > /dev/null
    return $?
}

# WSL2
function check_wsl2() {
    uname -a | grep "WSL2 " > /dev/null
    return $?
}

# IMMS
function check_imms() {
    cat $HOME/.zetup-envs | grep "env-imms" > /dev/null
    return $?
}

# All
function zetup-check() {
    if check_termux; then
        echo termux on
    else
        echo termux off
    fi
}

