autoload -Uz $SHULKER_DIR/autoload/*
autoload -Uz add-zsh-hook

trace-add "$(format-cmd 'autoload') at $(format-args "$SHULKER_DIR")"