#! caution, this function takes about 8ms to run by itself
# is-linux && date +%s%3N
# is-macos && gdate +%s%3N
is-linux && get-time-ms() {
    date +%s%3N
} && get-time-ms
is-macos && get-time-ms() {
    __gdate +%s%3N
} && get-time-ms