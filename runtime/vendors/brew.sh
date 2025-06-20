if [[ $(command -v brew) == "" ]]; then
    local brewEnvPath=""
    is-linux && brewEnvPath="/home/linuxbrew/.linuxbrew/bin/brew"
    is-darwin && brewEnvPath="/opt/homebrew/bin/brew"
    echo "Brew environment path: $brewEnvPath"
    [[ ! -f $brewEnvPath ]] && s-install-brew
    eval "$($brewEnvPath shellenv)"

    trace-add "Brew loaded now"
else
    trace-add "Brew was already loaded"
fi