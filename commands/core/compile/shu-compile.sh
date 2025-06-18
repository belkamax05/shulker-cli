#? This file is not intended to be sourced directly, but rather compiled and used as a part of Shulker CLI. See "include.sh" instead
shu-compile-commands
shu-compile-configs
shu-compile-runtime
shu-compile-bundle

touch "$SHULKER_HASH_PATH"
echo "$(shu-get-current-hash)" > "$SHULKER_HASH_PATH"

return $CODE_SUCCESS