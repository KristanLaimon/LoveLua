dofile "love_cycle.lua"
local Window = require "KrsLibs.GUI.Window"
local Label = require "KrsLibs.GUI.Label"

local title = Label(350, 10, "My love window!")

local twist = false;
title.onClick:Add(function (clickEvent)
  if clickEvent.buttonClicked ~= "left" then return end
  if twist then
      title:setText("My love windows!")
    else
      title:setText("You have clicked me?")
  end
  twist = not twist
end)

local mywin = Window()
mywin:AddControl(title)
mywin:Start()