. $ZETUP_DIR/shell/check_environments.sh

function cargo_flag () {
    ! check_termux
    return $?
}

function project_alias_flag() {
    check_wsl2 && check_imms
}


