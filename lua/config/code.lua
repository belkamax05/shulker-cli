-- CODE_OK=0
-- CODE_ERROR=1
-- CODE_WARNING=2
-- CODE_INFO=3
-- CODE_DEBUG=4
-- CODE_VERBOSE=5
-- CODE_TRACE=6
-- CODE_SILENT=7
-- CODE_NOT_FOUND=127

local ok = 0
local error = 1
local warning = 2
local info = 3
local debug = 4
local verbose = 5
local trace = 6
local silent = 7
local not_found = 127

return {
    ok = ok,
    error = error,
    warning = warning,
    info = info,
    debug = debug,
    verbose = verbose,
    trace = trace,
    silent = silent,
    not_found = not_found
}
