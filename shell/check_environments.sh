# Termux
function check_termux() {
    echo $PREFIX | grep "com.termux" > /dev/null
    RETVAL=$?
}

# All
function zetup-check() {
    if [ check_termux() ]; then
        echo termux on
    else
        echo termux off
    fi
}

