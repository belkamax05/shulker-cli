#!/usr/bin/env lua

local args = { ... }
if #args > 0 then
    for i, v in ipairs(args) do
        print("Argument " .. i .. ": " .. v)
    end
else
    print("No arguments provided.")
end
print("Hello from Lua!")

print("Blue color example: \27[34mThis text is blue!\27[0m")
