local pwd = os.getenv("PWD") or ""
local currentFile = debug.getinfo(1, "S").source:sub(2)

local dirParent1 = currentFile:match("(.*/).*/")
local dirParent2 = dirParent1:match("(.*/).*/")

local root = dirParent2

if not root:match("/shulker%-cli/$") then
    error("Root path must end with '/shulker-cli/'")
end

return {
    pwd = pwd,
    -- dirParent1 = dirParent1,
    -- dirParent2 = dirParent2,
    root = root,
}
