---@class Rectangle
---@field Position Point
---@field Size Size
---@return Rectangle Rect A simple rectangle
return function(Position, Size)
  return {
    Position = Position,
    Size = Size
  }
end
