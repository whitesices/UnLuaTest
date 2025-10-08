--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
local Screen = require "Screen"
---@type BP_WeaponBase_C
local BP_WeaponBase = UnLua.Class()

-- function BP_WeaponBase:Initialize(Initializer)
-- end

-- function BP_WeaponBase:UserConstructionScript()
-- end

function BP_WeaponBase:ReceiveBeginPlay()
    local msg = "This is BP_WeaponBase"
    Screen.Print(msg,UE.FLinearColor(1,0,1,1),2.0)
end

--实现BPI_Player接口开火函数方法
function BP_WeaponBase:StartFire()
end
--实现BPI_Player接口停止开火的函数方法
function BP_WeaponBase:StopFire()
end
-- function BP_WeaponBase:ReceiveEndPlay()
-- end

-- function BP_WeaponBase:ReceiveTick(DeltaSeconds)
-- end

-- function BP_WeaponBase:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function BP_WeaponBase:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function BP_WeaponBase:ReceiveActorEndOverlap(OtherActor)
-- end

return BP_WeaponBase
