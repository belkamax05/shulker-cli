function command_not_found_handler {
    local prefix="$(format-cmd "command_not_found_handler")"
    not-found-process "$@"
    local result=$?
    local command=$1
    shift 1
    if [[ $result -eq $CODE_SUCCESS ]]; then
        return $CODE_SUCCESS
    fi
    if [[ $result -eq $CODE_NOT_FOUND ]]; then
        echo-info "$prefix Command $(format-cmd "$command") not found. Args: $(format-args $@)"
        return $CODE_NOT_FOUND
    fi
    echo-error "$prefix Command $(format-cmd "$command") failed with code $result. Args: $(format-args $@)"
    return $result
}