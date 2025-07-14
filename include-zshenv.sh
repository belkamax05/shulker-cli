#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))
SHULKER_DIR=$__CURRENT_DIR
__source-directory() {
    local srcDir="$1"
    if [[ -d "$srcDir" ]]; then
        for file in $(ls -1 "$srcDir" | sort); do
            # echo "Sourcing $file from $srcDir"
            source "$srcDir/$file"
        done
    else
        echo "Directory $srcDir does not exist. (critical)"
    fi
}
__source-directory "$SHULKER_DIR/runtime-noninteractive"
echo-trace-project "shulker-cli [zshenv]" "$__CURRENT_DIR"
