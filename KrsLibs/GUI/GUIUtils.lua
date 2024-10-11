local Size = require "KrsLibs.Structs.Size"
local _ = {}

---Calculate size given a LOVE FONT, text, and padding
---@overload fun(font:Font, text:string)
---@param controlBased Control
---@param text string
---@return Size
function _.CalculateSizeBasedOnText(controlBased, text)
    local newWidth = controlBased.FontText:getWidth(text) + controlBased.Padding.leftright * 2;
    local newHeight = controlBased.FontText:getHeight(text) + controlBased.Padding.topbottom * 2;
    return Size(newWidth, newHeight)
end

return _