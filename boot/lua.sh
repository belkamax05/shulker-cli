export LUA_PATH="$SHULKER_DIR/lua/?.lua;"

create-folder "$SHULKER_DIST"
shu emit-config > "$SHULKER_DIST/config.sh"
source "$SHULKER_DIST/config.sh"
