require("utils/color/hex_to_rgb")
require("utils/color/color_rgb")

function color_hex(hex)
    local r, g, b = hex_to_rgb(hex)
    return color_rgb(r, g, b)
end
