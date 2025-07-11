if ! command-exists gdate; then
    x-brew install gdate
fi
gdate $@
return $?