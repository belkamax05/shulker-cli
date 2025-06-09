local cmd="$1"
if [[ -n "$cmd" ]]; then
    shift
fi

case "$cmd" in
    "here")
        shulker_here "$@"
        ;;
    "compile")
        shulker_compile "$@"
        ;;
    *)
        echo "Unknown command: $cmd"
        return $CODE_ERROR
        ;;
esac