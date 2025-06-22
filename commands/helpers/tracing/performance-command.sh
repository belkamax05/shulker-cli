local commandName=$1
shift
local currentTime=$(get-time-ms)
$commandName "$@"
local endTime=$(get-time-ms)
local elapsedTime=$(($endTime - $currentTime))
echo-info "Command $commandName took $elapsedTime ms to execute."