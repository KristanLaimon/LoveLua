---@type number
local MaxRange;
---@type number
local MinRange;
---@type number
local i;

local OnlyMinRange = function()
  return function()
    if i < MinRange then
      i = i + 1;
        return i;
      else
        return nil;
    end
  end
end

local WithMinAndMaxRange = function()
  local j = MinRange - 1
  return function()
      if j < MaxRange then
          j = j + 1;
          return j
      else
          return nil
      end
  end
end

--- Range with 2 overchargs (?) with maxrange or min and max range
---@param minRange integer
---@param maxRange integer
---@overload fun(maxRange:integer) Range starting from 1 to maxRange parameter
local Range = function(minRange, maxRange)
    i = 0
    MaxRange = maxRange;
    MinRange = minRange;
    if (maxRange == nil) then
      return OnlyMinRange()
    else
      return WithMinAndMaxRange()
    end
end

return Range