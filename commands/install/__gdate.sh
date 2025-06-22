
if ! command -v gdate &> /dev/null; then
    brew install gdate
fi
__gdate() {
    gdate "$@"
}
__gdate "$@"