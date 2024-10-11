local del = require "KrsLibs.Utils.Delegate"
local Range = require "KrsLibs.Utils.Range"

---@type DelegateType<fun(str1:string, str2:string), string, string>
local event = del();
event:CallAll("asdf", "dasf");
event:Add(function (str1, str2)
  print(str1, str2)
end)
print(event.Functs)
event:CallAll("hello2", "hello2");

for i in Range(3) do
  print(i)
end

for i in Range(2,5) do
  print(i)
end