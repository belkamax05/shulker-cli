local endTime=$(get-time-ms)
local elapsedTime=$((endTime - $SHU_START_TIME))
local elapsedFromLastTime=$((endTime - $SHU_LAST_TRACE_TIME))
echo-trace "(${COLOR_ARGS}$(pad-left "$elapsedTime" 4 " ")${STYLE_RESET}ms/${COLOR_ARGS}$(pad-left "+$elapsedFromLastTime" 4 " ")${STYLE_RESET}ms): $1"
SHU_LAST_TRACE_TIME=$endTime
