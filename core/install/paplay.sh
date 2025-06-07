__paplay_install() {
    sudo apt install pulseaudio-utils
}
__paplay() {
    if ! command -v paplay &> /dev/null; then
        __paplay_install
    fi
    paplay "$@"
}