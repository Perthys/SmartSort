## About
Table.Sort Doesn't support multi comparision Values,
So that is why this library exists.

Good for making combat bots, and other bots that require a high intensive prioritization system.


###### Loadstring:
```lua
local Sort = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/BetterSortingAlgorithim/main/main.lua'))()
```

###### Example:

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

###### Output:
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
