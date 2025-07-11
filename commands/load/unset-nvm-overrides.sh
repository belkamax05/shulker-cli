for cmd in "${nvm_cmd_list[@]}"; do
  unset -f "$cmd"
done

echo-debug "$(format-cmd 'unset-nvm-overrides') NVM overrides unset"