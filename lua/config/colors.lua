require("utils/color/color_hex")

local cyan = color_hex("#00ffff");
local dark_red = color_hex("#ff3131");
local red = color_hex("#ff0000");
local yellow = color_hex("#ffff00");
local hotpink = color_hex("#ff00af");
local green = color_hex("#00ff00");
local magenta = color_hex("#c965c9");
local white = color_hex("#ffffff");
local dark_blue = color_hex("#0000ff");
local dark_green = color_hex("#00ff00");
local dark_yellow = color_hex("#ffff00");
local dark_cyan = color_hex("#00ffff");
local dark_magenta = color_hex("#ff00ff");
local dark_white = color_hex("#ffffff");
local dark_gray = color_hex("#808080");
local dark_orange = color_hex("#ffa500");
local dark_pink = color_hex("#ff69b4");
local dark_purple = color_hex("#800080");
local dark_turquoise = color_hex("#40e0d0");

local command = cyan;
local info = cyan;
local argument = yellow;
local params = hotpink;
local success = green;
local error = dark_red;
local debug = magenta;
local warning = dark_orange;

local args = argument;
local arg = argument;

return {
    cyan = cyan,
    dark_red = dark_red,
    red = red,
    yellow = yellow,
    hotpink = hotpink,
    green = green,
    magenta = magenta,
    white = white,
    dark_blue = dark_blue,
    dark_green = dark_green,
    dark_yellow = dark_yellow,
    dark_cyan = dark_cyan,
    dark_magenta = dark_magenta,
    dark_white = dark_white,
    dark_gray = dark_gray,
    dark_orange = dark_orange,
    dark_pink = dark_pink,
    dark_purple = dark_purple,
    dark_turquoise = dark_turquoise,

    command = command,
    info = info,
    argument = argument,
    params = params,
    success = success,
    error = error,
    debug = debug,
    warning = warning,

    args = args,
    arg = arg,
}
