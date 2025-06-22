output=$(repo unstaged)
if [[ -z "$output" ]]; then
    echo "0"
else
    echo "$output" | wc -l
fi