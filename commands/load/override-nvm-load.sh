if ! cmd-exists nvm; then
    for inner_cmd in "${nvm_cmd_list[@]}"; do
        eval "$inner_cmd() {
            load-nvm
            $inner_cmd \"\$@\"
        }"
    done
fi
