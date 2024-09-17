local Node = require "Node";

---@class LinkedList
---@field First Node|nil
---@field Last Node|nil
local LinkedListClass = {
  First = nil;
  Last = nil;
}

---@private
---@param node Node
local function GetRecursiveLenght(node)
  local count = 0;
  local actualNode = node
  while actualNode and actualNode.NextNode do
    count = count + 1;
    actualNode = actualNode.NextNode;
  end
  return count;
end

---Add a new node to linkedlist
---@param self LinkedList
---@param ... any
function LinkedListClass.Add(self, ...)
  local input = table.pack(...);
  for _,value in pairs(input) do
      if not self.First then
      self.First = Node(value)
      self.Last = self.First;
    else
      self.Last.NextNode = Node(value);
      self.Last = self.Last.NextNode;
    end
  end
end

---Returns this linkedlist as array (table)
---@param self LinkedList
---@return any[]
function LinkedListClass.ToArray(self)
  local array = {}
  local actualNode = self.First;
  
  while actualNode do
    table.insert(array, actualNode.Value);
    actualNode = actualNode.NextNode;
  end
  return array;
end

function LinkedListClass.Length(self)
  if self.First == nil then
    return 0
  else
    return GetRecursiveLenght(self.First)
  end
end

---Sort this list and return the sorted list
---@param self LinkedList
---@param predicate? fun(a:any, b:any):boolean
function LinkedListClass.Sort(self, predicate)
  local copy = self:ToArray()
  table.sort(copy, predicate)
  return copy;
end

---Constructor of linkedlist
---@return LinkedList
function LinkedList() return setmetatable({}, { __index = LinkedListClass }) end
