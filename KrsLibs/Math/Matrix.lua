---@class Matrix: {data: number[][]|integer[][]}
---@field rows integer
---@field columns integer
---@operator mul(Matrix):Matrix
local Matrix = {
  data={},
  rows=0,
  columns=0
}

---@type metatable
local Matrix_MetaTable = {
    ---Multiply two matrix
    ---@param m1 Matrix
    ---@param m2 Matrix
    ---@return Matrix
    __mul = function(m1, m2)
        if m1.columns ~= m2.rows then
            error("Matrix " .. m1 .. " can't  be multiplied with " .. m2);
            return { { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 } }
        end

        local _data_to_return_ = {}
        for i = 1, m1.rows do
            _data_to_return_[i] = {}
            for j = 1, m2.columns do
                _data_to_return_[i][j] = 0
                for k = 1, m1.columns do
                    _data_to_return_[i][j] = _data_to_return_[i][j] + m1.data[i][k] * m2.data[k][j]
                end
            end
        end

        ---@type Matrix
        local to_return = setmetatable({}, { __index = getmetatable(m1).__index })
        to_return.data = _data_to_return_
        to_return.rows = m1.rows
        to_return.columns = m2.columns

        return to_return --[[@as Matrix]]
    end,
    __index = Matrix
}

function Matrix:Display()
  local full_str = ""
    for i = 1, self.rows do
        for j = 1, self.columns do
            full_str = full_str .. tostring(self.data[i][j]) .. "\t"
        end
        full_str = full_str .. "\n"
    end
  print(full_str)
end

---                               REGION UTILS

---                              STATIC METHODS
---                                Constructor

---@generic T
---@param rows integer
---@param columns integer
---@param values T[]
---@return Matrix
local function Matrix_Constructor(rows, columns, values)
    if #values ~= rows * columns then
      error("Matrix_Constructor: number of  values does't match rows * columns total quantity")
      return {}
    end

    local _data_ = {}
    local values_i = 0
    for i = 1, rows do
        _data_[i] = {}
        for j = 1, columns do
            values_i = values_i + 1
            _data_[i][j] = values[values_i]
        end
    end

    local _ = setmetatable({}, Matrix_MetaTable)
    _.data = _data_
    _.rows = rows
    _.columns = columns
    return _
end

---Gets a matrix with a default value
---@param rows integer
---@param columns integer
---@param defaultValue any
---@return Matrix
local function Matrix_Constructor_Default(rows, columns, defaultValue)
  local default_values = {}
  for i=1, rows*columns do
    table.insert(default_values, defaultValue)
  end
  return Matrix_Constructor(rows, columns, default_values)
end

---Get an identity matrix given square dimensions
---@param squareDimension integer
---@return Matrix
local function Matrix_Identity(squareDimension)
  local _data_ = {}
    for i = 1, squareDimension do
        for j = 1, squareDimension do
            if i == j then
                table.insert(_data_, 1)
            else
                table.insert(_data_, 0)
            end
        end
    end
  return Matrix_Constructor(squareDimension, squareDimension, _data_)
end

--
local Matrix_Module = {}
Matrix_Module.new = Matrix_Constructor;
Matrix_Module.new_default = Matrix_Constructor_Default;
Matrix_Module.new_identity = Matrix_Identity;
return Matrix_Module
