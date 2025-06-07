__hex_to_rgb() {
  local hex="$1"
  if [[ ! "$hex" =~ ^#([0-9a-fA-F]{6})$ ]]; then
    __echo_error "Invalid hex color format. Use #RRGGBB (e.g., #ff00aa)."
    return 1
  fi
  local r=$((16#${hex:1:2}))
  local g=$((16#${hex:3:2}))
  local b=$((16#${hex:5:2}))
  echo "$r $g $b"
}
