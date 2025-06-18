local wav_file=$1
is-linux && __paplay $wav_file
is-macos && afplay $wav_file