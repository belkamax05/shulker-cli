install-op-linux() {
    dot-fetch-deb "1password" "https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb"
    dot-install-deb "1password" "$DOT_TEMP/1password.deb"
}

dot-is-linux && ! dot-is-installed-msg 1password && install-op-linux