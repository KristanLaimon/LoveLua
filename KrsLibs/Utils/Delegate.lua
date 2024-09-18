
---@alias DelegateType function

---@class Delegate<DelegateType>
---@field Functs DelegateType[]
---@field CallAll fun(self:Delegate, params:any|nil):nil;
---@field Add fun(self:Delegate, funct:function):nil
local _Delegate = {
  Functs = {}
};

---Add a new funct subscriber to this function
---@param newFunct DelegateType
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

return function()
  local _ = setmetatable({}, {__index = _Delegate});
  return _;
end