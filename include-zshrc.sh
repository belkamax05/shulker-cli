#? Source this file from your .zshrc
__CURRENT_FILE=${(%):-%N}
__CURRENT_DIR=$(realpath $(dirname $__CURRENT_FILE))

configure-zap
configure-alias
configure-autosuggestions
configure-fzf
# if [[ -z $GIO_LAUNCHED_DESKTOP_FILE ]]; then
    configure-prompt
# fi

# TODO Implement echo all env variables including "windsurf"
# echo_all_env() {
#   printf "\n--- Environment variables (sorted) ---\n"
#   # Use printenv for exported environment variables
#   if command -v printenv >/dev/null 2>&1; then
#     printenv | sort
#   else
#     # fallback to env
#     env | sort
#   fi

#   printf "\n--- Entries matching \"windsurf\" (case-insensitive) ---\n"
#   if (printenv 2>/dev/null || env) | grep -i -- 'windsurf' >/dev/null 2>&1; then
#     (printenv 2>/dev/null || env) | grep -i -- 'windsurf' | sort
#   else
#     printf "No env var matching \"windsurf\"\n"
#   fi
#   printf "\n" # trailing newline
# }

# # Only show env when interactive and explicitly enabled.
# # if [[ -o interactive ]] && [[ "${SHULKER_ECHO_ENV:-0}" = "1" ]]; then
#   echo_all_env
# # fi

# if [[ -o interactive ]]; then
#     echo "INTERACTIVE SHELL"
# else
#     echo "NON-INTERACTIVE SHELL"
# fi
# if [[ -z $GIO_LAUNCHED_DESKTOP_FILE ]]; then
#     echo "NOT LAUNCHED FROM GUI"
# else
#     echo "LAUNCHED FROM GUI"
# fi


configure-not-found

export PATH="$HOME/.nvm/versions/node/v20.14.0/bin:$PATH"

echo-trace-project "shulker-cli [zshrc]" "$__CURRENT_DIR"

# echo "hi"