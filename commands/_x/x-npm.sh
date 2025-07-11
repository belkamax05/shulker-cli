if ! command-exists npm; then
    load-nvm
fi
npm $@
return $?