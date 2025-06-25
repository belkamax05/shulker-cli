if ! cmd-exists nvm; then
    nvm() {
        load-nvm
        nvm "$@"
    }
    node() {
        load-nvm
        node "$@"
    }
    npm() {
        load-nvm
        npm "$@"
    }
    yarn() {
        load-nvm
        yarn "$@"
    }
fi
