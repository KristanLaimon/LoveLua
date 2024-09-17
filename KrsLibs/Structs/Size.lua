---Returns a Size object
---@class Size
---@field Width number
---@field Height number
---@field Position Point
---@param Width number
---@param Height number
return function(Width, Height)
  return {
    Width = Width,
    Height = Height,
  }
end