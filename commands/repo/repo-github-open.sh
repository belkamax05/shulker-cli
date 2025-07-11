local url=$(repo github-open-url "$@")
open "$url" || {
    echo "Failed to open URL: $url"
    return 1
}