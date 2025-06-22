local file=$1
local remote=${2:-origin}
local repoRoot=$(repo root)
local branch=$(repo current-branch)
# echo "file: $file"
# echo "remote: $remote"
# echo "repoRoot: $repoRoot"
# echo "branch: $branch"
local url=$(git config --get remote.$remote.url)
# echo "url: $url"
[[ -n $repoRoot && -n $branch && -n $remote ]] || return 1
# local path=${PWD/#$repoRoot/}
local pwd2=$(pwd)
# echo "pwd2: $pwd2"
local path="${PWD#$repoRoot}"
# echo "localPpathath: $path"
# echo "PWD: $PWD"
# echo "repoRoot: $repoRoot"
[[ -n $file ]] && localPath+=/$file
# echo "path: $path"
local a
IFS=:/ read -A a <<< "$url"
local len=${#a[@]}
local user=${a[$len-1]%.git}
local repo=${a[$len-0]%.git}
local viewMode="tree"
if [[ -n $file ]]; then
    viewMode="blob"
fi
local url="https://github.com/$user/$repo/$viewMode/$branch$path"
echo $url