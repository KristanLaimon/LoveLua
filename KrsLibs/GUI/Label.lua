local Control = require "KrsLibs.GUI.Control";
local Color   = require "KrsLibs.Structs.Color"
local Point   = require "KrsLibs.Structs.Point"
local Parent = Control(0,0);

---@alias Label Control

--- Inherited props from control obj
---@type Control
local _Label = setmetatable({}, { __index = Control });
_Label.BackGroundColor = Color.Black;
_Label.ForeGroundColor = Color.White;

---@param x number
---@param y number
---@param Text string
---@return Label
return function(x, y, Text)
    local _ = setmetatable({}, { __index = _Label });
    _.Text = Text or Parent.Text;
    _.Position = Point(x or Parent.Position.x, y or Parent.Position.y);
    return _
end
