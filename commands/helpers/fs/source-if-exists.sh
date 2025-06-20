local fileName="$1"
if [ -f "$fileName" ]; then
    source "$fileName"
    trace-add "[source-if-exists] Sourced $COLOR_ARGS$fileName$STYLE_RESET"
else
    echo-error "[source-if-exists] File $COLOR_ARGS$fileName$STYLE_RESET does not exist, skipping source"
fi