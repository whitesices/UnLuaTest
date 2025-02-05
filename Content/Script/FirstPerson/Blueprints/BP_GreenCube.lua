--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
local Screen = require "Screen"
---@type BP_GreenCube_C
local BP_GreenCube = UnLua.Class()

-- function BP_GreenCube:Initialize(Initializer)
--     local msg = [[
--     Hello Cube
--     --02
--     ]]
--     print(msg)
--     Screen.Print(msg)
-- end

function BP_GreenCube:sayHi(name)
 local origin = self.Overridden.sayHi(self,name)
 return origin
end
-- function BP_GreenCube:UserConstructionScript()
-- end

function BP_GreenCube:ReceiveBeginPlay()
    local ms = self:sayHi("Bob")
    Screen.Print(ms)
end

-- function BP_GreenCube:ReceiveEndPlay()
-- end

-- function BP_GreenCube:ReceiveTick(DeltaSeconds)
-- end

-- function BP_GreenCube:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function BP_GreenCube:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function BP_GreenCube:ReceiveActorEndOverlap(OtherActor)
-- end

return BP_GreenCube
