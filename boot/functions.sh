# Add base functions directory to fpath
fpath+=("$SHULKER_DIR/functions")

# Add all nested directories under $SHULKER_DIR/functions to fpath
for dir in $SHULKER_DIR/functions/**/*(/); do
    fpath+=("$dir")
done

# Autoload all extensionless function files
for file in $SHULKER_DIR/functions/**/*(N-.); do
    funcname=${file:t}  # get filename without path
    autoload -Uz "$funcname"
done