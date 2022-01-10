# BetterSortingAlgorithim

bro table.sort doesn't support multi comparision values so i made a  extension of it that assigns a score value for each of the objects and then sorts them base on the score value 

loadstring:
```lua
local Sort = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/BetterSortingAlgorithim/main/main.lua'))()
```

example:

```lua
local Sort = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/BetterSortingAlgorithim/main/main.lua'))()
local Algorithim = Sort.new()
    :Add("Health", 1, "Higher")
    :Add("Distance", 2, "Higher")
    
    
local Sorted = Algorithim:Sort({
    {
        Health = 10;
        Distance = 30;
    };
    {
        Health = 100;
        Distance = 300;
    };
    {
        Health = 10;
        Distance = 30;
    };
}, "Lower")
```

Output:
```lua
{
    ["1"] = {
        ["Distance"] = 30,
        ["Health"] = 10
    },
    ["2"] = {
        ["Distance"] = 30,
        ["Health"] = 10
    },
    ["3"] = {
        ["Distance"] = 300,
        ["Health"] = 100
    },

}
```
