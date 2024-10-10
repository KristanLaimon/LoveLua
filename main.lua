local love = require "love";
local Label = require "KrsLibs.GUI.Label"
local DebugUtils    = require "KrsLibs.Debug.DebugUtils";

local PositionLabel = Label(10,10, "No Position");
local ClickLabel    = Label(10, 30, "Click text");
local TrueClick = Label(10,50, "Has Clicked?");

TrueClick.onClick:Add(function(clickObj) TrueClick.Text = tostring(clickObj) end)
TrueClick.onClick:

---@param dt number
function love.update(dt)
  PositionLabel.Text = DebugUtils.GetMousePosString();
  collectgarbage();
end

function love.draw()
  PositionLabel:DrawUpdate();
  ClickLabel:DrawUpdate();
  TrueClick:DrawUpdate();
end

---@param x integer
---@param y integer
---@param button integer Can be 1 | 2 | 3
function love.mousepressed(x, y, button)
  ClickLabel.Text = "X =" .. x .. " y=" .. y .. " Button=" .. button

  PositionLabel:LogicUpdate(x, y, button);
  ClickLabel:LogicUpdate(x, y, button);
  TrueClick:LogicUpdate(x,y,button);
end