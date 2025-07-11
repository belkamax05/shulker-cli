! is-macos && echo-error "Not allowed on non-Mac device" && return 0
local current_user=$(whoami)
print-user-permissions
echo "---"
sudo dseditgroup -o edit -a $current_user -t user admin
sudo dscl . -append /Groups/admin GroupMembership $current_user
print-user-permissions