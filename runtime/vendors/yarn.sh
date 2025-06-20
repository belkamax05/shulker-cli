if [[ $(command -v yarn) == "" ]]; then
    npm install -g yarn
    echo-success "Yarn installed"
fi
trace-add "Yarn loaded"