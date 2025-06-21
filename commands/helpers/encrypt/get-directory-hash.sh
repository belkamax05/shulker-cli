local sourceDir="$1"
local current_hash=$(find "$sourceDir" -type f -not -path "**/.shulker/**/*" -print0 | sort -z | while IFS= read -r -d $'\0' file; do
    realpath "$file" | sed 's/\r$//' #? Remove DOS line endings
    cat "$file" #? Include file content
done | md5sum | cut -d' ' -f1)
echo "$current_hash"