# connect_list is associative array, print it's keys and values
local prefix="$(format-cmd 'connect-list-print')"
echo-debug "$prefix Printing connect_list keys and values"

for key in ${(k)connect_list}; do
    echo "$key: ${connect_list[$key]}"
done

trace-add "$prefix Printed connect_list keys and values"