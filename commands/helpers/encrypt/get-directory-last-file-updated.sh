local sourceDir="$1"
find $sourceDir -type f -exec stat --format="%Y %n" {} + | sort -n | tail -1 | cut -d' ' -f2-