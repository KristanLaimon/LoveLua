local MESSAGEVALUE = {
  success = "Sucess",
  failure = "Failed",
  BasedOn = function(boolean) if boolean then return "Success" else return "Failed"end end
}

---@private
---@param Name string
---@param TestState string
---@param Time number
---@return string
local function ThrowMessage(Name, TestState, Time)
    local msg = "-- " .. Name .. ": Run " .. TestState .. " in " .. Time .. " seconds";
    local beggining;
    if TestState == MESSAGEVALUE.success then
        beggining = "✅";
    else
        beggining = "❌"
    end
    return beggining .. " " .. msg;
end

---Test if two values are equal
---@param original any
---@param expected any
function AssertEqual(original, expected)
  if original ~= expected then
    error("Got " .. expected .. " but expected " .. original);
  end
end

---Test a function code! Krs
---@param name string
---@param funct fun():nil
function It(name, funct)
  local start = os.time();
  local WithNoErrors, errorOrReturned = pcall(funct);
  errorOrReturned = errorOrReturned or "";
  local finish = os.time();
  print(ThrowMessage(name, MESSAGEVALUE.BasedOn(WithNoErrors), os.difftime(finish, start)) .. "\nDetails: " .. errorOrReturned);
end

return function()
  return {
    It = It,
    AssertEqual = AssertEqual
  }
end