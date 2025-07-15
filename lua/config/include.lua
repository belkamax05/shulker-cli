local paths = require("config/paths")
local colors = require("config/colors")
local style = require("config/style")
local code = require("config/code")
local root_config = dofile(paths.root .. "/config.lua")

local debug_print = {}

local result = {
    debug_print = debug_print
}

for key, value in pairs(root_config) do
    result[key] = value
end

for key, value in pairs(paths) do
    result["path_" .. key] = value
end

for key, value in pairs(code) do
    result["code_" .. key] = value
end

for key, value in pairs(colors) do
    result["color_" .. key] = value
end

for key, value in pairs(style) do
    result["style_" .. key] = value
end

return result
