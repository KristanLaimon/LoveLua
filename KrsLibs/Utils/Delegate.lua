--- # DelegateType
--- Delegate Type for 'Delegate' generic class
---
--- Sintaxis:
--- ```lua
--- local delegate = require "KrsLibs.Utils.Delegate"
--- 
--- ---@type DelegateType<functionType, firstParamType, secondParamType>
--- local myDelegate = delegate()
--- ```
---
--- #### Generics
--- ---------
--- #### Function Type : T
---   It is the unique type of function this delegate will accept
---
--- e.g:
--- ```lua
---   DelegateType<fun():nil>
---   DelegateType<fun(name:string):nil, string>
--- ```
--- #### Function Parameter 1 Type : V (Optional)
--- The type of the first param of the function
---
--- #### Function Parameter 2 Type : R (Optional)
--- Tye type of the second param of the function
---@class DelegateType<T,V,R>: {Functs:T[], CallAll: fun(self:DelegateType<T,V,R>, param1:V|nil, param2:R|nil), Add: fun(self:DelegateType<T,V,R>, fun:T)}

---@class Delegate
---@field Functs function[]
---@field CallAll fun(  self:Delegate, ...):nil;
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