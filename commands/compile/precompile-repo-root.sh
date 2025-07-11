local sourceDir=$1
local distDir=$2

local prefix="$(format-cmd 'precompile-repo-root')"
local sourceDirFormatted="$(format-args "$sourceDir")"
local distDirFormatted="$(format-args "$distDir")"

echo-debug "$prefix Precompiling repository from $sourceDirFormatted to $distDirFormatted"

local precompileDir="$distDir/precompile"

create-folder "$distDir"
create-folder "$precompileDir"

(
    cd "$sourceDir/configs"
    script-run "$sourceDir/configs/emit-config" > "$precompileDir/00.config.sh"
    echo "STATIC_HASH" > "$precompileDir/00.config.sh.hash"
)
compile-commands-directory-cached "$sourceDir/commands" "$precompileDir/01.commands.sh"
compile-raw-directory-cached "$sourceDir/configs" "$precompileDir/02.configs.sh"
compile-raw-directory-cached "$sourceDir/runtime" "$precompileDir/03.runtime.sh"

trace-add "$prefix Precompile from $sourceDirFormatted to $distDirFormatted done"
