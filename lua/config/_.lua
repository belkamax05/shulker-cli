local debugVal = true
local verbose = false
local trace = true
local watch = true

local paths = require("config/paths")
local colors = require("config/colors")
local style = require("config/style")
local code = require("config/code")

local debug_print = {
    -- paths = paths,
    -- colors = colors
}

local shu = {
    dir = paths.root,
    debug_print = debug_print
}

local result = {
    debug = debugVal,
    verbose = verbose,
    trace = trace,
    watch = watch,
    shu = shu
}

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
