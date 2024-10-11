local Matrix = require "KrsLibs.Math.Matrix"

local identity = Matrix.new_identity(3);
identity:Display()

local myOtherMatrix = Matrix.new(3, 3, { 1, 2, 3, 4, 5, 6, 7, 8, 9 })
local result = identity * myOtherMatrix;
result:Display();
