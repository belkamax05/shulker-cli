local repo="$1"
local dest="$2"

if [ ! -d "$dest" ]; then
    echo-info "Cloning $COLOR_ARGS$repo$STYLE_RESET to $COLOR_ARGS$dest$STYLE_RESET"
    git clone "$repo" "$dest"
fi
trace-add "[clone-if-missing] $repo -> $dest"