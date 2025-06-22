local startTime=$(get-time-ms)
restart
local endTime=$(get-time-ms)
local elapsedTime=$(($endTime - $startTime))
echo-info "Command $(format-args "restart") took $elapsedTime ms to execute."