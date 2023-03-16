local Sort = {}; Sort.__index = Sort;

local setmetatable = setmetatable;
local pairs = pairs;
local table_sort = table.sort


local BoolHandlers = {
    [true] = 1;
    [false] = 0;
}


local function ShellSort(SortedTable)
    local Increment = math.ceil(#SortedTable / 2)

    while Increment > 0 do
        for Itteration = Increment, #SortedTable do
            local Temp = SortedTable[Itteration]
            local Current = Itteration

            while Current > Increment and SortedTable[Current - Increment].Point > Temp.Point do
                SortedTable[Current] = SortedTable[Current-Increment]
                Current = Current - Increment
            end
            SortedTable[Current] = Temp
        end

        Increment = math.floor( 0.5 + Increment / 2.2 )
    end 

    return SortedTable
end

--[[
    @class Sort

    @description
        This is the base Sort class
    @param {table} tbl, optional
        Optional table if you do not want to use :Add();
    @returns {table}
        Returns a new instance of the Sort class
]]

function Sort.new(Algorithim)
    return setmetatable({
        Algorithim = Algorithim or {},
    }, Sort)
end


--[[
    @description
        This is the function used for Adding new values to the sort.
    @param Index any, required
        The index of the value to be sorted.
    @param Score number, required
        The Score of the value to be sorted.
    @param Type string, optional
       The priority of the value to be sorted. (Higher, Lower)
    @returns {table}
        Returns self;
]]

function Sort:Add(Index, Point, Type)
    self.Algorithim[Index] = {
        Point = Point,
        Type = Type or "Higher",
    }
    
    return self
end

--[[
    @description
        This is the function to sort the values
    @param Array table, required
        The Table to be sorted.
    @returns {table}
        Returns The Sorted Array
]]

function Sort:Sort(Array, Type)
    local Type = Type or "Lower";
    local Algorithim = self.Algorithim

    for _, ActualArray in pairs(Array) do
        for Index, Value in pairs(ActualArray) do
            local CurrentCheck = Algorithim[Index]

            if CurrentCheck and CurrentCheck.Point then
                local Point = CurrentCheck.Point
                
                if CurrentCheck.Type == "Lower" then
                    if BoolHandlers[Value] then
                        ActualArray.Point = -Point * BoolHandlers[Value];
                    else
                        ActualArray.Point = -Point * Value;
                    end
                elseif CurrentCheck.Type == "Higher" then
                    if BoolHandlers[Value] then
                        ActualArray.Point = Point * BoolHandlers[Value];
                    else
                        ActualArray.Point = Point * Value;
                    end
                end
            end

        end
    end
    
    Array = ShellSort(Array, Type)
    
    for _, ActualArray in pairs(Array) do
        for Index, Value in pairs(ActualArray) do
            ActualArray["Point"] = nil;
        end
    end

    return Array
end

--[[
    @description
        Returns the first value of the sorted array.
    @param Array table, required
        The Table to be sorted.
    @returns {table}
        Returns The first value of the sorted array.
]]

function Sort:GetBestValue(...)
    return self:Sort(...)[1];
end

return Sort
