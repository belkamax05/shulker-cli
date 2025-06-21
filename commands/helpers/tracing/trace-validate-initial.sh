if [[ -z "$SHU_START_TIME" || $((endTime - SHU_START_TIME)) -gt 5000 ]]; then
    SHU_START_TIME=$endTime
fi
if [[ -z "$SHU_LAST_TRACE_TIME" || $((endTime - SHU_LAST_TRACE_TIME)) -gt 5000 ]]; then
    SHU_LAST_TRACE_TIME=$endTime
fi
trace-validate-initial-mute