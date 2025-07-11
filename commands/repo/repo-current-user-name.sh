# if $@ contains "--global" then run --global variant, otherwise local
if [[ "$@" == *"--global"* ]]; then
    git config --global user.name
else
    git config user.name
fi