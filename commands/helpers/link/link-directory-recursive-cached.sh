local directoryFrom="$1"
local directoryTo="$2"

shift 2

local preffix=$(format-cmd 'link-directory-recursive-cached')

if [[ -z "$directoryFrom" || -z "$directoryTo" ]]; then
    echo-error "$preffix Missing required arguments: directoryFrom and directoryTo."
    return $CODE_ERROR
fi

local cacheFilePath="$directoryFrom.shu.hash"
local cacheFilePathFormatted=$(format-args "$cacheFilePath")

if [[ ! -f "$cacheFilePath" ]]; then
    echo-debug "$preffix Cache file not found. Running linking."
    link-directory-recursive "$directoryFrom" "$directoryTo" "$@"
    echo "$(get-directory-hash "$directoryFrom")" > "$cacheFilePath"
    trace-add "$preffix Cache file created at $cacheFilePathFormatted"
    return $CODE_SUCCESS
fi

local savedHash=$(cat "$cacheFilePath")
local currentHash=$(get-directory-hash "$directoryFrom")
if [[ "$currentHash" != "$savedHash" ]]; then
    echo-debug "$preffix Cache file hash does not match current hash. Running linking."
    link-directory-recursive "$directoryFrom" "$directoryTo" "$@"
    echo "$currentHash" > "$cacheFilePath"
    trace-add "$preffix Cache file updated at $cacheFilePathFormatted"
    return $CODE_SUCCESS
fi
trace-add "$preffix Cache file at $cacheFilePathFormatted didn't change, skipping linking."
# if [[ -f "$cacheFile" ]]; then
#     echo-debug "$preffix Cache file found: $cacheFile"
#     local cachedDirectories=$(cat "$cacheFile")
#     echo-debug "$preffix Cached directories: $cachedDirectories"
# else
#     echo-debug "$preffix No cache file found, creating new cache."
#     touch "$cacheFile"
# fi
# local directoryFromFormatted=$(format-args "$directoryFrom")
# local directoryToFormatted=$(format-args "$directoryTo")

# shift 2
# echo-debug "$preffix Link directory recursively from $directoryFromFormatted to $directoryToFormatted"
# each-file-recursive "$directoryFrom" "link-file-recursive-mapper" "$directoryFrom" "$directoryTo" "--other-args" "$@"
# echo-debug "$preffix Link from $directoryFromFormatted to $directoryToFormatted completed"
# trace-add "$preffix Linked directory $directoryFromFormatted to $directoryToFormatted with args: $(format-args "$@")"
