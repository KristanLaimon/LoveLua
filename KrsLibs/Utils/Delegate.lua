
---@generic T asdf
---@class Delegate<T>
---@field Functs []:T
---@field CallAll fun(self:Delegate, ...):nil;
---@field Add fun(self:Delegate, funct:function):nil
local _Delegate = {
  Functs = {}
};

---Add a new funct subscriber to this function
---@param newFunct function
function _Delegate:Add(newFunct)
    table.insert(self.Functs, newFunct);
end

---Call all methods subscribed to this delegate
---@param ... any[] | nil
function _Delegate:CallAll(...)
  if ... ~= nil then
      for _, funct in pairs(self.Functs) do
          funct(...);
      end
    else
      for _, funct in pairs(self.Functs) do
        funct();
      end
  end
end

---@return Delegate
return function()
  local _ = setmetatable({}, {__index = _Delegate});
  return _;
end