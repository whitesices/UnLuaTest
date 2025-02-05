--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
--引入Screen函数
local Screen = require "Screen"

---@type BP_FirstPersonProjectile_C
local BP_FirstPersonProjectile = UnLua.Class()

function BP_FirstPersonProjectile:Initialize(Initializer)
    local msg = [[
    Hello myTestFirstDemo
    --02
    ]]
    print(msg)
    Screen.Print(msg)
end

-- function M:UserConstructionScript()
-- end

-- function M:ReceiveBeginPlay()
-- end

-- function M:ReceiveEndPlay()
-- end

-- function M:ReceiveTick(DeltaSeconds)
-- end

-- function M:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function M:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function M:ReceiveActorEndOverlap(OtherActor)
-- end

return BP_FirstPersonProjectile
