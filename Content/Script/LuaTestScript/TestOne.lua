-- package.path = "D:\\GASDemo\\TestGas\\Content\\Script\\LuaTestScript\\greetings.lua"

-- print(package.path)

-- local mygreeting1 = require("greetings")
-- local mygreeting2 = require("greetings")

-- print(mygreeting1.sayHello("Bob"))
-- print(mygreeting2.sayHello("liucy"))
-- print(mygreeting1.sayHello("liuc"))

-- local fruits = { apple = "red" , banana = "yellow" , cherry = "blue"}

-- local metatable = {
--     __index = function(table,key)
--         return "unkonwn color"
--     end
-- }

-- setmetatable(fruits , metatable )

-- print(fruits.apple)
-- print(fruits.cherry)

-- __index作为表
-- local animals = {dog = "woof" , cat = "meow" }
-- local metatable = {
--     __index = 
--     {
--         cow = "moo",
--         pig = "oink"
--     }
-- }

-- setmetatable(animals , metatable)
-- print(animals.dog)
-- print(animals.cow)

--__neindex
-- local protected = {newkey = 1}
-- local metaable1 = {
--     __newindex=function(table , key , value)
--         error("This is read-only")
-- end
-- }

-- setmetatable(protected,metaable1)
-- protected.newkey = 2
-- print(protected.newkey)

--__add元方法
local vector = {x=10,y=20}
local metatable2 = {
    __add = function(v1,v2)
        return { x = v1.x + v2.x , y = v1.y + v2.y} 
    end
}

setmetatable(vector , metatable2)

local result = vector + { x = 5 , y = 10}
print(result.x,result.y)