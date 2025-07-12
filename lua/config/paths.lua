local pwd = os.getenv("PWD") or ""
local currentFile = debug.getinfo(1, "S").source:sub(2)

if currentFile:sub(1, 2) == "./" then
    currentFile = currentFile:sub(3)
end
local currentFileAbsolute = pwd .. "/" .. currentFile
local root = currentFileAbsolute:match("(.*/).*/") or ""

return {
    -- pwd = pwd,
    -- currentFile = currentFile,
    -- currentFileAbsolute = currentFileAbsolute,
    root = root,
}
