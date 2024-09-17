Where = function(collection, fx)
    local output = {}
    for i in Range(#collection) do
        if (fx(collection[i])) then
            table.insert(output, collection[i])
        end
    end
    return output
end

Select = function(collection, fx)
    local output = {}
    for i in Range(#collection) do
        table.insert(output, fx(collection[i]))
    end
    return output
end

-- ---First Overcharge
-- ---@param collection any[]
-- ---@param accumulator any
-- ---@param initialAccumulator any
-- ---@param fx function
-- ---@overload fun(collection:any[], accumulator:any, fx:function):any[] 
-- Aggregate = function(collection, accumulator, initialAccumulator, fx)

-- end