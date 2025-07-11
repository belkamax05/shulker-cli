local filePath="$1"
if [ -L "$filePath" ]; then
    return $CODE_SUCCESS
else
    return $CODE_ERROR
fi