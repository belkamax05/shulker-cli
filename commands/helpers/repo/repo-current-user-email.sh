if [[ "$@" == *"--global"* ]]; then
    git config --global user.email
else
    git config user.email
fi