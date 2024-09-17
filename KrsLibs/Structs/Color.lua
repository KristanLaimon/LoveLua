local love = require "love";
---@alias RGB {Red:number, Green:number, Blue:number}
---@type RGB
local  White = { Red=255, Green=255, Blue=255 }
---@type RGB
local Black = {Red= 0, Green=0, Blue=0 }
---@type RGB
local Grey = { Red=147, Green=147, Blue=147 }

---@enum Color
return{
    White = White,
    Black = Black,
    Grey = Grey,
    SetThisColor =
    ---@param color RGB
    function(color)
        love.graphics.setColor(color.Red, color.Green, color.Blue);
    end
}