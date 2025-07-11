local directory="$1"
local type="$2"
if [[ -z "$directory" || -z "$type" ]]; then
    echo-error "connect-list-add-value: directory and type must be provided"
    return $CODE_ERROR
fi
connect_list["$directory"]="$type"
echo-debug "Added to connect_list: $directory -> $type"