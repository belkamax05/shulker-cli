git commit --no-verify -m "$1" ${@:2}
if [[ "$@" == *"--sync"* ]]; then
    repo sync
fi