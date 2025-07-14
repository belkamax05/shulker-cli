autoload-functions-directory() {
    local srcDir="$1"

    #? Add base functions directory to fpath
    fpath+=("$srcDir")

    #? Add all nested directories under $srcDir to fpath
    if [[ -n "$(find "$srcDir" -mindepth 1 -type d -print -quit 2>/dev/null)" ]]; then
        #? This check ensures at least one nested directory exists
        for dir in "$srcDir"/**/*(/); do
            fpath+=("$dir")
        done
    fi

    #? Autoload all extensionless function files
    for file in "$srcDir"/**/*(N-.); do
        local funcname=${file:t}  # get filename without path
        autoload -Uz "$funcname"
    done
}

autoload-functions-directory "$SHULKER_DIR/functions"

SHU_START_TIME=$(get-time-ms)
