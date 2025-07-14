echo "Hello from test-all.sh. Running all tests..."
test-fun-zsh
test-fun-zsh-body

test-script-zsh
test-script-lua
test-lua-noext
test-zsh-noext

shu test-script-zsh
shu test-script-lua
shu test-lua-noext
shu test-zsh-noext

# return $CODE_OK