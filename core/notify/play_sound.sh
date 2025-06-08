__play_sound() {
  local wav_file=$1
  __is_linux && __paplay $wav_file
  __is_macos && afplay $wav_file
}