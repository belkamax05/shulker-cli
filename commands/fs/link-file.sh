local src="$1"
local dest="$2"
echo-info "Linking file ${COLOR_YELLOW}$src${STYLE_RESET} to ${COLOR_YELLOW}$dest${STYLE_RESET}"
ln -sf "$src" "$dest"