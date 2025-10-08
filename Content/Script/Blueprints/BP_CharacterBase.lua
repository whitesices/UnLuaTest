--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
local Screen = require "Screen"

---@type BP_CharacterBase_C
local BP_CharacterBase = UnLua.Class()

-- function BP_CharacterBase:Initialize(Initializer)
-- end

-- function BP_CharacterBase:UserConstructionScript()
-- end

function BP_CharacterBase:ReceiveBeginPlay()
    local msg = "This is BP_CharaceterBase"
    Screen.Print( msg , UE.FLinearColor(1,0,1,1), 2.0)

    --一开始生成武器
    local Weapon = self:SpawnWeapon()
    if Weapon then
        local WeaponMsg = "Weapon is not nil"
        Screen.Print( WeaponMsg , UE.FLinearColor(1,0,1,1) , 2.0)
        --绑定武器到角色的武器插槽上
        Weapon:K2_AttachToComponent(
            self.WeaponPoint,
            nil,
            UE.EAttachmentRule.SnapToTarget,
            UE.EAttachmentRule.SnapToTarget,
            UE.EAttachmentRule.SnapToTarget
        )
        --设置武器变量
        self.Weapon = Weapon
    end
end
------------------------------------------------
--实现接口的函数
function BP_CharacterBase:StartFire()
end

function BP_CharacterBase:StopFire()
end

function BP_CharacterBase:SpawnWeapon()
    local msg = "This is weapon Sapwn"
    return nil
end

function BP_CharacterBase:NotifyEnemyDied()
    local msg = "This parent NotifyEnemyDiedFunction"
    Screen.Print( msg , UE.FLinearColor(1,0,1,1) , 2.0 )
end
-----------------------------------------------------------------------

-- function BP_CharacterBase:ReceiveEndPlay()
-- end

-- function BP_CharacterBase:ReceiveTick(DeltaSeconds)
-- end

-- function BP_CharacterBase:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function BP_CharacterBase:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function BP_CharacterBase:ReceiveActorEndOverlap(OtherActor)
-- end

return BP_CharacterBase
