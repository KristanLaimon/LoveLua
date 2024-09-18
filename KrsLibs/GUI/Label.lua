local Control = require "KrsLibs.GUI.Control";
local Color   = require "KrsLibs.Structs.Color"

---@alias Label Control

---@param x number
---@param y number
---@param text string
---@return Label
return function(x, y, text)
    local _ = Control(x,y, text)
    _.BackGroundColor = Color.Black;
    _.ForeGroundColor = Color.White;
    return _
end
