function hex_to_rgb(hex)
    if not hex or not hex:match("^#%x%x%x%x%x%x$") then
        error("Invalid hex color format. Use #RRGGBB (e.g., #ff00aa).")
    end
    local r = tonumber(hex:sub(2, 3), 16)
    local g = tonumber(hex:sub(4, 5), 16)
    local b = tonumber(hex:sub(6, 7), 16)
    return r, g, b
end
