local r g b
r=$1
g=$2
b=$3
echo -ne "\e[38;2;${r};${g};${b}m"