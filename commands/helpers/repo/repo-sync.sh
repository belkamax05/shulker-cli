git fetch --all
git pull
if [[ "$@" == *"--push"* ]]; then
    repo fast-push
fi