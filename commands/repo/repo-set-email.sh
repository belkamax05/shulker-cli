if [[ "$@" == *"--global"* ]]; then
    git config --global user.email "$1"
else
    git config user.email "$1"
fi
repo current-user
return $CODE_OK