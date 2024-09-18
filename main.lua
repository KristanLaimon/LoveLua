local Label= require "KrsLibs.GUI.Label"
local love = require "love";
local DebugUtils = require "KrsLibs.Debug.DebugUtils";

local PositionLabel = Label(10,10, "No Position");
---@param dt number
function love.update(dt)
  PositionLabel.Text = DebugUtils.GetMousePosString();
  collectgarbage();
end

function love.draw()
  PositionLabel:DrawUpdate();
end