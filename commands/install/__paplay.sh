if ! command -v paplay &> /dev/null; then
    sudo apt install pulseaudio-utils
fi
__paplay() {
    paplay "$@"
}
__paplay "$@"