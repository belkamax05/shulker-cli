local filePath="$SHULKER_DIR/commands/$1.sh"
local functionName=$(basename "$filePath" .sh)
shift #? Remove the first argument (the command name)
$functionName "$@"