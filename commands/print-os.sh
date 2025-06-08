echo "Operating System: $(__get_uname)"

__is_linux && echo "Is Linux: true" || echo "Is Linux: false"
__is_macos && echo "Is macOS: true" || echo "Is macOS: false"