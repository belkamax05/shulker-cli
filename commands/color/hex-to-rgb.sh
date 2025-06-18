local hex="$1"
if [[ ! "$hex" =~ ^#([0-9a-fA-F]{6})$ ]]; then
  echo-error "Invalid hex color format. Use #RRGGBB (e.g., #ff00aa)."
  return $CODE_ERROR
fi
local r=$((16#${hex:1:2}))
local g=$((16#${hex:3:2}))
local b=$((16#${hex:5:2}))
echo "$r $g $b"