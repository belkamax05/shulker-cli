if ! command -v jq &> /dev/null; then
    brew install jq
fi
__jq() {
    jq "$@"
}
__jq "$@"