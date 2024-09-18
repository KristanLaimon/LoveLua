local love = require "love";

local DebugUtils = {};

function DebugUtils.GetMousePosString()
    ---@type number,number
    local x, y = love.mouse.getPosition();
    return "X = " .. tostring(x) .. " Y = " .. tostring(y);
end

return DebugUtils;