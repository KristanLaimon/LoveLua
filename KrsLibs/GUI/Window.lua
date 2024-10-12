local Love_Events = require "love_cycle"
local MouseUtils  = require "KrsLibs.Utils.MouseUtils"

--@field Update_Logic fun(self:Window, delta:number)
---@class Window
---@field private MousePressed_Logic fun(self:Window, clickedX: integer, clickedY:integer, clickedButton: integer)
---@field private Draw_Logic fun(self:Window)
---@field AddControl fun(self:Window, newControl:Control)
---@field Controls Control[]
local Window = {}

-- function Window:Update_Logic(delta)
--   for i in #self.Controls do
--     self.Controls[i]
--   end
-- end

function Window:Draw_Logic()
  for _,v in pairs(self.Controls)do
    v:DrawUpdate()
  end
end

function Window:MousePressed_Logic(clickedX, clickedY, clickedButton)
    for _, v in pairs(self.Controls) do
      if MouseUtils.HasClicked(v.Position.x, v.Position.y, v.Size.Width, v.Size.Height, clickedX, clickedY) then
        v.IsFocused = true
      else
        v.IsFocused = false
      end
      v:LogicUpdate(clickedX, clickedY, clickedButton)
  end
end

function Window:AddControl(newControl)
  table.insert(self.Controls, newControl)
end

function Window:Start()
  Love_Events.Love_Draw:Add(function () self:Draw_Logic() end)
  Love_Events.Love_Mouse_Pressed:Add(function (x, y, button)
    self:MousePressed_Logic(x,y,button)
  end)
end

---@return Window
return function()
  local _ = setmetatable({}, {__index = Window})
  _.Controls = {}
  return _
end