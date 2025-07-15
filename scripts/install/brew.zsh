if [[ $(command -v brew) == "" ]]; then
    local brewEnvPath=""
    dot-is-linux && brewEnvPath="/home/linuxbrew/.linuxbrew/bin/brew"
    dot-is-darwin && brewEnvPath="/opt/homebrew/bin/brew"
    if [[ ! -f $brewEnvPath ]]; then
        dot-echo "Installing ${COLOR_YELLOW}brew${STYLE_RESET}"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    dot-echo "Setting up ${COLOR_YELLOW}brew${STYLE_RESET}"
    eval "$($brewEnvPath shellenv)"
fi