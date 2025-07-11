if ! command-exists brew; then
fi
brew $@
return $?
