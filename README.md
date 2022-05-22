## About
Smart sort allows you create "weights" to prioritize a certain value

For example we have a distance and health and we are prioritizing distance over health but still want prioritize the lowest health possible with prioritizing distance.

We just create a new sort Object
and add Weights using the :Add() Method

It supports chaining syntax so you can format your algorithim more cleanly.

**[Table.Sort](https://www.lua.org/pil/19.3.html)** Doesn't support multi comparision Values,

I personally use this for making combat bots, and other bots that require a high intensive prioritization system.

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
