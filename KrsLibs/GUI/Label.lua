local Control = require "KrsLibs.GUI.Control";
local Color   = require "KrsLibs.Structs.Color"
local GUIUtils = require "KrsLibs.GUI.GUIUtils"
local Point    = require "KrsLibs.Structs.Point"

---@class Label : Control
local Label = Control(0,0, "label");

-- Overriding parent method (Override - Abstract)
---Set the text (label especific)
---@param self Label
---@param newText string
function Label:setText(newText)
    self.Text = newText;
    self.Size = GUIUtils.CalculateSizeBasedOnText(self, newText)
end

---@param x number
---@param y number
---@param text string
---@return Label
return function(x, y, text)
    local _ = setmetatable({}, {__index=Label})
    _.BackGroundColor = Color.Black;
    _.ForeGroundColor = Color.White;
    _.Position = Point(x, y)
    _:setText(text)

    return _ --[[@as Label]]
end
