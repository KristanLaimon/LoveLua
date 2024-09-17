local Control = require "KrsLibs.GUI.Control";
local Color = require "KrsLibs.Structs.Color";
local love = require "love";

local b = Control(10, 10, "Hola Mundoooo");
b.BackGroundColor = Color.White;
b.ForeGroundColor = Color.Black;

local x = Control(100, 100, "Some text");
x.BackGroundColor = Color.White;
x.ForeGroundColor = Color.Black;

local help = Control(123,150, "Dios, ayuda");

---@param dt number
function love.update(dt)
  b.Text = tostring(dt);
end

function love.draw()
    b:DrawUpdate();
    x:DrawUpdate();
    help:DrawUpdate();
end