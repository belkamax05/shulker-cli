function color_rgb(r, g, b)
    return string.format("\27[38;2;%d;%d;%dm", r, g, b)
end
