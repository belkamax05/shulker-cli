local wav_file=$1
is-linux && x-paplay $wav_file
is-macos && afplay $wav_file