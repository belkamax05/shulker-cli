echo "Operating System: $(get-uname)"

is-linux && echo "Is Linux: true" || echo "Is Linux: false"
is-macos && echo "Is macOS: true" || echo "Is macOS: false"