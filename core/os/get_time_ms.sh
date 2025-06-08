__get_time_ms() {
    __is_linux && date +%s%3N
    __is_macos && gdate +%s%3N
}
