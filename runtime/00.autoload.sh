__CURRENT_FILE=${(%):-%N}
autoload -Uz $SHULKER_DIR/autoload/*
autoload -Uz add-zsh-hook

trace-add "$(format-cmd 'autoload') at $(format-args "$__CURRENT_FILE")"