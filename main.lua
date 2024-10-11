local love = require "love";
local Label = require "KrsLibs.GUI.Label"
local DebugUtils    = require "KrsLibs.Debug.DebugUtils";
local Color = require "KrsLibs.Structs.Color"

local PositionLabel = Label(10,10, "No Position");
local ClickLabel    = Label(10, 30, "Click text");

local TrueClick     = Label(10, 60, "Has Clicked?");
TrueClick.BackGroundColor = Color.White;
TrueClick.ForeGroundColor = Color.Black;
TrueClick.onClick:Add(function (clickEvent)
  TrueClick:setText(tostring(clickEvent.hasClicked))
end)

---@param dt number
function love.update(dt)
  PositionLabel:setText(DebugUtils.GetMousePosString())
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
  ClickLabel:setText("X =" .. x .. " y=" .. y .. " Button=" .. button)
  PositionLabel:LogicUpdate(x, y, button);
  ClickLabel:LogicUpdate(x, y, button);
  TrueClick:LogicUpdate(x,y,button);
end