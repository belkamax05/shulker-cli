local config = require("config")


local function flatten(tbl, prefix)
    for k, v in pairs(tbl) do
        local key = prefix and (prefix .. "_" .. k) or k
        if type(v) == "table" then
            flatten(v, key)
        else
            if type(v) == "boolean" then
                v = v and "true" or "false"
            elseif type(v) == "string" then
                v = '"' .. v .. '"'
            end
            print(string.upper(key) .. "=" .. v)
        end
    end
end

flatten(config)
