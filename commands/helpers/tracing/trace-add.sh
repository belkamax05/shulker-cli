if [[ $TRACE == false ]]; then
    return 0
fi
local endTime=$(get-time-ms)
trace-validate-initial
local elapsedTime=$((endTime - $SHU_START_TIME))
local elapsedFromLastTime=$((endTime - $SHU_LAST_TRACE_TIME))
echo-trace "(${STYLE_CURSIVE}$(format-args "$(pad-left "$elapsedTime" 4 " ")")ms/${STYLE_CURSIVE}$(format-args "$(pad-left "+$elapsedFromLastTime" 4 " ")")ms): $1"
SHU_LAST_TRACE_TIME=$endTime
