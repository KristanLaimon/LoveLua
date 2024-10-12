local love = require "love"
local GenericDelegate = require "KrsLibs.Utils.Delegate"
local label = require "KrsLibs.GUI.Label"

---@type DelegateType<fun(dt:number), number>
local Love_Update_Event = GenericDelegate()
---@type DelegateType<fun()>
local Love_Draw_Update = GenericDelegate()
---@type DelegateType<fun(x:integer, y:integer, button:integer), integer, integer, integer>
local Love_Mouse_Pressed = GenericDelegate()

---@param dt number
function love.update(dt)
  Love_Update_Event:CallAll(dt)
  collectgarbage();
end


function love.draw()
  Love_Draw_Update:CallAll();
end

---@param x integer
---@param y integer
---@param button integer Can be 1 | 2 | 3
function love.mousepressed(x, y, button)
  if x ~= nil and y ~= nil and button ~= nil then
    Love_Mouse_Pressed:CallAll(x, y, button)
  end
end

return {
  Love_Update = Love_Update_Event,
  Love_Draw = Love_Draw_Update,
  Love_Mouse_Pressed = Love_Mouse_Pressed
}