# repo/clone-and-source.sh
local repo="$1"
local dest="$2"
local importPath="$3"

clone-if-missing "$repo" "$dest"
source-if-exists "$dest/$importPath"