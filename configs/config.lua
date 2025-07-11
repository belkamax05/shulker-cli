local debugVal = false
local verbose = false
local trace = true
local watch = true

local paths = require("paths")
local colors = require("colors")

local debug_print = {
    paths = paths,
    colors = colors
}

local shu = {
    dir = paths.root,
    debug_print = debug_print
}

return {
    debug = debugVal,
    verbose = verbose,
    trace = trace,
    watch = watch,
    shu = shu
}
