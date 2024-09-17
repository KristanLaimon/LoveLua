-- Definición del tipo Node
---@class Node
---@field Value any         -- El valor almacenado en el nodo
---@field NextNode Node|nil -- Referencia al siguiente nodo o nil si es el último
local Node_Base = {
  Value = nil,
  NextNode = nil,
}


function Node(value, nextNode)
  local toReturn = setmetatable({}, { __index = Node_Base })
  toReturn.Value = value;
  toReturn.NextNode = nextNode;
  return toReturn
end