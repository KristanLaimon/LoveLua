local _ = {}

---@alias ClickType "left" | "right" | "middle" | "unknown"

---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param clickX integer
---@param clickY integer
---@return boolean
function _.HasClicked(posX, posY, width, height, clickX, clickY)
    if clickX >= posX and clickX <= posX + width then
        if clickY >= posY and clickY <= posY + height then
            return true
        end
    end
    return false
end


---@return ClickType
function _.GetClickButtonFromNumber(number)
  if number == 1 then
      return "left"
    elseif number == 2 then
      return "right"
    elseif number == 3 then
      return "middle"
    else
      return "unknown"
  end
end

return _;