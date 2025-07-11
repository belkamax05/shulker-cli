local currentDir=$1
local currentCmd=$2
shift 2

local prefix="$(format-cmd "shu-run-script")"

local currentDirFormatted=$(format-args "$currentDir")
local currentCmdFormatted=$(format-args "$currentCmd")
local restArgsFormatted=$(format-args "$@")

echo-debug "$prefix Current dir: $currentDirFormatted"
echo-debug "$prefix Current command: $currentCmdFormatted"
echo-debug "$prefix Rest args: $restArgsFormatted"

local shPath="$currentDir/$currentCmd.sh"
local zshPath="$currentDir/$currentCmd.zsh"
local luaPath="$currentDir/$currentCmd.lua"
local tsPath="$currentDir/$currentCmd.ts"

if [[ $shPath == *.sh.sh ]]; then
    shPath="${shPath%.sh.sh}.sh"
fi
if [[ $zshPath == *.zsh.zsh ]]; then
    zshPath="${zshPath%.zsh.zsh}.zsh"
fi
if [[ $luaPath == *.lua.lua ]]; then
    luaPath="${luaPath%.lua.lua}.lua"
fi
if [[ $tsPath == *.ts.ts ]]; then
    tsPath="${tsPath%.ts.ts}.ts"
fi

if [[ -f $shPath ]]; then
    echo-debug "$prefix Script file exists: $(format-args "$shPath")"
    source "$shPath" $@
    return $?
fi

if [[ -f $zshPath ]]; then
    echo-debug "$prefix Script file exists: $(format-args "$zshPath")"
    source "$zshPath" $@
    return $?
fi

if [[ -f $luaPath ]]; then
    echo-debug "$prefix Script file exists: $(format-args "$luaPath")"
    lua "$luaPath" $@
    return $?
fi

if [[ -f $tsPath ]]; then
    echo-debug "$prefix Script file exists: $(format-args "$tsPath")"
    x-ts-node "$tsPath" $@
    return $?
fi

echo-error "No $currentCmdFormatted script found at $currentDirFormatted"