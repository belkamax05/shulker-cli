#!/usr/bin/env zsh
autoload -Uz add-zsh-hook

add-zsh-hook precmd hook-precmd
add-zsh-hook chpwd hook-chpwd
add-zsh-hook preexec hook-preexec
add-zsh-hook zshaddhistory hook-zshaddhistory
add-zsh-hook zshexit hook-zshexit