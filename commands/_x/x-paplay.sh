if ! command-exists paplay; then
    sudo apt install pulseaudio-utils
fi
paplay $@
return $?
