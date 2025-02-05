local greetings = {}

--自定义计数变量count
local count = 0

function greetings.sayHello(name)
    --return "Hello," .. name .. "!"
    count = count + 1
    return "Hello," .. name .. "!(Called " .. count .." times)"
end
function greetings.sayGoodbye(name)
    return "Goodbye," .. name .. ".Have  a great day"
end

return greetings