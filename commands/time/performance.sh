# __START_TIME=$(__get_time_ms)
local start_time=$(__get_time_ms)
$@
local end_time=$(__get_time_ms)
local elapsed_time=$((end_time - start_time))
echo "Command executed in $elapsed_time ms"