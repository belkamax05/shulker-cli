__is_darwin() {
    [[ "$(__get_uname)" == "Darwin" ]]
}
__is_macos() {
    __is_darwin
}
