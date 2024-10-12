local Matrix = require "KrsLibs.Math.Matrix"

local m1 = Matrix.new(3,2, {1,2,3,4,5,6})
local m2 = Matrix.new(2,2, {7,8,9,10})

local result = m1 * m2;
result:Display()