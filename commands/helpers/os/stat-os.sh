is-linux && stat -c "%Y" "$@"
is-macos && stat -f "%m" "$@"