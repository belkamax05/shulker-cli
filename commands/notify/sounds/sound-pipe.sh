#? if there are arguments, assuming it's a command to execute, which then chains as "command ; pop"
local wav_file=$1
shift #? Remove the first argument (wav file path)
local arguments=("$@")
if [[ ${#arguments[@]} -gt 0 ]]; then
    "${arguments[@]}"
fi
play-sound $wav_file