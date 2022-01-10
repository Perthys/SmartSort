local Sort = {}; Sort.__index = Sort;

local setmetatable = setmetatable;
local pairs = pairs;
local table_sort = table.sort

function Sort.new(Algorithim)
    return setmetatable({
        Algorithim = Algorithim or {},
    }, Sort)
end

function Sort:Add(Index, Point, Type)
    self.Algorithim[Index] = {
        Point = Point,
        Type = Type or "Higher",
    }
    
    return self
end

function Sort:Sort(Array, Type)
    local Type = Type or "Lower";
    local Algorithim = self.Algorithim

    for _, ActualArray in pairs(Array) do
        for Index, Value in pairs(ActualArray) do
            local CurrentCheck = Algorithim[Index]

            if CurrentCheck and CurrentCheck.Point then
                local Point = CurrentCheck.Point
                
                if CurrentCheck.Type == "Lower" then
                    ActualArray.Point = Point / Value;
                elseif CurrentCheck.Type == "Higher" then
                    ActualArray.Point = Point * Value;
                end
            end

        end
    end

    table_sort(Array, function(a, b)
        if a.Point and b.Point then
            if Type == "Higher" then
                return a.Point > b.Point;
            elseif Type == "Lower" then
                return a.Point < b.Point;
            end
        end
    end)
    
    for _, ActualArray in pairs(Array) do
        for Index, Value in pairs(ActualArray) do
            ActualArray["Point"] = nil;
        end
    end

    return Array
end
