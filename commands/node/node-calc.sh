local value=$1
local command="const result=$value;console.log(result);"
node -e $command
