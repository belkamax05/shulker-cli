if ! command-exists gum; then
    x-brew install gum
fi
gum $@
return $?
