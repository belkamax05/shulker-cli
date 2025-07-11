local repo="$1"
local dest="$2"

local repoDestStr="$(format-args "$repo") -> $(format-args "$dest")"

if [ ! -d "$dest" ]; then
    echo-info "$(format-cmd 'clone-if-missing') Cloning $repoDestStr"
    git clone "$repo" "$dest"
fi
trace-add "$(format-cmd 'clone-if-missing') Loaded $repoDestStr"