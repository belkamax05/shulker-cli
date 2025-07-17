local debug = false
local verbose = false
local trace = false
local watch = false
local trace_runtime = false
local prompt_type = "p10k" --? Possible options are "p10k", "kali", "zap", "custom"

--? Uncomment the following lines to enable debugging, verbose output, or tracing
-- debug = true
-- verbose = true
trace = true
trace_runtime = true

-- prompt_type = "zap"
-- prompt_type = "custom"

return {
    debug = debug,
    verbose = verbose,
    trace = trace,
    watch = watch,
    trace_runtime = trace_runtime,
    prompt_type = prompt_type
}
