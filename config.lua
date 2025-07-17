local debug = false
local verbose = false
local trace = false
local watch = false
local trace_runtime = false

--? Uncomment the following lines to enable debugging, verbose output, or tracing
-- debug = true
-- verbose = true
-- trace = true
trace_runtime = true

return {
    debug = debug,
    verbose = verbose,
    trace = trace,
    watch = watch,
    trace_runtime = trace_runtime,
}
