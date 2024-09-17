local LivingBeing = {
  raze = "",
  age = 0,
  makeSound = function() print("I can make a sound") end
}

---@generic T
---@generic V
---@param from T
---@param to V
---@return T | V Child Resulting child
function Inherence(from, to)
  for key, value in pairs(from) do
    if to[key] == nil then
      to[key] = value;
    end
  end
  return to;
end

local Person = Inherence(LivingBeing, {
  name = "Kristan",
  age = 20,
  work = function() print("I can work as a person")end,
  makeSound = function() print("I cant talk!!!!") end,
  raze = "Human"
});

Person.work();
Person.makeSound();
print(Person.raze)


local AnotherPerson = setmetatable(setmetatable({}, { __index = LivingBeing }), { __index = Person });
