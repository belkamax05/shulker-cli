local endTime=$(get-time-ms)
local elapsedTime=$((endTime - $SHU_START_TIME))
echo-trace "$1 - $COLOR_ARGS$elapsedTime$STYLE_RESET ms"