local receivedValue="$1"
local padLength="$2"
local padChar="${3:- }"
local padValue=""
if [[ -z "$receivedValue" ]]; then
    echo ""
    return 0
fi
local valueLength=${#receivedValue}
if (( valueLength >= padLength )); then
    echo "$receivedValue"
    return 0
fi
local padCount=$((padLength - valueLength))
for ((i = 0; i < padCount; i++)); do
    padValue+="$padChar"
done
echo "$padValue$receivedValue"