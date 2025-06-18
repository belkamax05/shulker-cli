local fileName="$1"
if [ -f "$fileName" ]; then
    source "$fileName"
else
    echo-error "File $COLOR_ARGS$fileName$STYLE_RESET does not exist, skipping source"
fi