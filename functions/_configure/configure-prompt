#!/usr/bin/env zsh

if [[ -n "$PROMPT_TYPE" ]]; then
    command_name="prompt-${PROMPT_TYPE}"
    if type "$command_name" &>/dev/null; then
        "$command_name"
    else
        echo "Warning: Command $command_name not found, using default prompt"
        prompt-default
    fi
else
    echo "Warning: PROMPT_TYPE not set, using default prompt"
    prompt-default
fi

trace-add "$SHULKER_PROMPT_PREFIX$(format-cmd 'prompt') Prompt configured"