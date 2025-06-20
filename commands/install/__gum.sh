if ! command -v gum &> /dev/null; then
    brew install gum
fi
__gum() {
    gum "$@"
}
__gum "$@"