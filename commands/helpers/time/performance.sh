# __START_TIME=$(get-time-ms)
local start_time=$(get-time-ms)
$@
local end_time=$(get-time-ms)
local elapsed_time=$((end_time - start_time))
echo "Command executed in $elapsed_time ms"