--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
local Screen = require "Screen"
---@type BP_OneActor_C
local BP_OneActor = UnLua.Class()

-- function BP_OneActor:Initialize(Initializer)
-- end

-- function BP_OneActor:UserConstructionScript()
-- end

--注释掉让蓝图的beginplay生效
--function BP_OneActor:ReceiveBeginPlay()
    -- local msg = "The index " .. self:GetIndex() .. " " .. self.TestFloat+10 .. self.name
    -- print(msg)
    -- Screen.Print( msg,UE.FLinearColor( 0 , 1 , 0 , 1),7.0)
--end

--实现C++中定义的BlueprintImplementable函数
-- function BP_OneActor:LuaImp()
--     Screen.Print("this is a function implements c++")
-- end
--实现C++中定义的BlueprintNativeEvent方法
function BP_OneActor:LuaNative()
    Screen.Print("Native Event")
end

--实现蓝图中自定义的事件函数
function BP_OneActor:CE_Test()
    Screen.Print("This is Ce_Test event function")
end

--
-- function BP_OneActor:ReceiveEndPlay()
-- end

-- function BP_OneActor:ReceiveTick(DeltaSeconds)
-- end

-- function BP_OneActor:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function BP_OneActor:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function BP_OneActor:ReceiveActorEndOverlap(OtherActor)
-- end

return BP_OneActor
