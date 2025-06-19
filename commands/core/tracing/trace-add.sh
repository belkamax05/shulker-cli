local endTime=$(get-time-ms)
local elapsedTime=$((endTime - $SHU_START_TIME))
local elapsedFromLastTime=$((endTime - $SHU_LAST_TRACE_TIME))
echo-trace "$1 - $COLOR_ARGS$elapsedTime$STYLE_RESET ms (+$COLOR_ARGS$elapsedFromLastTime$STYLE_RESET ms)"
SHU_LAST_TRACE_TIME=$endTime
