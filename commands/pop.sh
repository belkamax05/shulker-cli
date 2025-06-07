#? if there are arguments, assuming it's a command to execute, which then chains as "command ; pop"
local arguments=("$@")
if [[ ${#arguments[@]} -gt 0 ]]; then
    "${arguments[@]}"
fi
__play_sound $SHULKER_DIR/assets/sounds/pop.wav