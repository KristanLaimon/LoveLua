local del = require "KrsLibs.Utils.Delegate"

---@type DelegateType<fun(str1:string, str2:string), string, string>
local event = del();
event:CallAll("asdf", "dasf");
event:Add(function (str1, str2)
  
end)
event:Add(function() print("Hello 2") end)
print(event.Functs)
event:CallAll();


