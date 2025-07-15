dot-install-wine-linux() {
    # Add i386 architecture if not already added
    if ! dpkg --print-foreign-architectures | grep -q i386; then
        sudo dpkg --add-architecture i386
    fi

    # Create the keyrings directory if it doesn't exist
    sudo mkdir -pm755 /etc/apt/keyrings

    # Download the WineHQ key if it doesn't already exist
    if [ ! -f /etc/apt/keyrings/winehq-archive.key ]; then
        sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
    fi

    # Add the WineHQ repository if not already added
    # if ! grep -q "^deb .*/wine-builds/ubuntu" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    #     sudo wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).list -P /etc/apt/sources.list.d/
    # fi
    #? correct form > sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/oracular/winehq-oracular.sources

    # Update package lists
    # sudo apt update

    # Install WineHQ devel if not already installed
    if ! dpkg -l | grep -q winehq-devel; then
        sudo apt install --install-recommends winehq-devel
    fi
}

dot-is-linux && dot-install-wine-linux