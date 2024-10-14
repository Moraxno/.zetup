. $ZETUP_DIR/shell/check_environments.sh

function cargo_flag () {
    ! check_termux
    return $?
}
