#? This file is not intended to be sourced directly, but rather compiled and used as a part of Shulker CLI. See "include.sh" instead
__echo_debug "Compiling Shulker CLI..."

source "$SHULKER_DIR/core/compile/compile_core.sh"
__compile_core #? Also loads each file source to make core features available
#? At this point "core" is loaded, and we can use it's functionality to do rest of opeartions
__compile_commands
__compile_configs
__compile_merge