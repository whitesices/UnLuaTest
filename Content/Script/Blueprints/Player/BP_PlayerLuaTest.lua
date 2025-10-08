--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_PlayerLuaTest_C
---
local Screen = require "Screen"
-- local CharacterBase = require "BP_CharacterBase"
local BP_PlayerLuaTest = UnLua.Class("Blueprints.BP_CharacterBase")

-- function BP_PlayerLuaTest:Initialize(Initializer)
-- end

-- function BP_PlayerLuaTest:UserConstructionScript()
-- end
--初始化
function BP_PlayerLuaTest:ReceiveBeginPlay()

    self.Super.ReceiveBeginPlay(self)
        --通过调用通用函数库的方法获取名字
    -- local msg = "Hello there is " .. UE.UKismetSystemLibrary.GetDisplayName(self)
    -- --打印相应的信息
    -- Screen.Print(msg,UE.FLinearColor( 1 , 1 , 0 , 1),7.0)

    --beginplay中声明初始化FOV的相应变量参数
    --获取默认相机参数，DefaultFOV在蓝图中声明
    self.DefaultFOV = self.Camera.FieldOfView
    --声明本地的线性插值
    local InterpFloats = self.ZoomInOut.TheTimeline.InterpFloats
    local FloatTrack = InterpFloats:GetRef(1)
    --绑定相应的函数
    FloatTrack.InterpFunc:Bind( self,BP_PlayerLuaTest.OnZoomInOutUpdate)

end

--自定义一个更新FOV的函数,实现BPI接口的函数
function BP_PlayerLuaTest:UpdateAiming(isTrue)
    --判断isTrue的有效性
    if isTrue then
        --时间轴ZoomInOut在蓝图中声明当然也可以C++中声明然后lua调用
        self.ZoomInOut:Play()
    else
        self.ZoomInOut:Reverse()
    end

end

--重载父类的函数实现多态
function BP_PlayerLuaTest:SpawnWeapon()
    local msg = "This is WeaponSapwn child function"
    Screen.Print( msg , UE.FLinearColor(1 , 1, 0 , 1) , 2.0)
    --获取当前的世界对象
    local World = self:GetWorld()
    --判断World是否有效
    if not World then
        return
    end
    --通过世界对象调用SpawnActor方法生成武器
    local WeaponClass = UE.UClass.Load("/Game/Blueprints/Weapon/BP_DefaultWeapon.BP_DefaultWeapon_C")
    local NewWeapon = World:SpawnActor( WeaponClass , self:GetTransform(),UE.ESpawnActorCollisionHandlingMethod.AlwaysSpawn,self,self,"Blueprints.Weapon.BP_DefaultWeapon")
    return NewWeapon
end
-----------------------------------
--实现BPI_Player接口中的函数
function BP_PlayerLuaTest:NotifyEnemyDied()
    local msg = "This is EnemyDied"
    Screen.Print(msg, UE.FLinearColor(1,1,0,1), 2.0)
end
--实现BPI_Player接口中的函数
function BP_PlayerLuaTest:GetWeaponTraceInfo()
    local msg = "This is GetWeaponTraceInfo"
    Screen.Print(msg,UE.FLinearColor(1,1,0,1),2.0)
    return UE.FVector(),UE.FVector()
end
--实现BPI_Player接口中的函数
-- function BP_PlayerLuaTest:StartFire()
--     self.Super.StartFire()
--     local msg = "This is StartFireFunction"
--     Screen.Print( msg, UE.FLinearColor(1,1,0,1), 2.0)
-- end
--实现BPI_Player接口中的函数
-- function BP_PlayerLuaTest:StopFire()
--     self.Super.StopFire()
--     local msg = "This is StopFireFunction"
--     Screen.Print( msg , UE.FLinearColor(1,1,0,1) , 2.0)
-- end
------------------------------------

--自定义需要绑定的时间轴函数
function BP_PlayerLuaTest:OnZoomInOutUpdate(Alpha)
    -- local msg = "Call OnZoomInOutUpdate"
    -- Screen.Print(msg)
    --获取默认的FOV,进行平滑过度调用Lerp函数
    local FOV = UE.UKismetMathLibrary.Lerp(self.DefaultFOV,100,Alpha)
    self.Camera:SetFieldOfView(FOV)
end

-- function BP_PlayerLuaTest:ReceiveEndPlay()
-- end

-- function BP_PlayerLuaTest:ReceiveTick(DeltaSeconds)
-- end

-- function BP_PlayerLuaTest:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function BP_PlayerLuaTest:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function BP_PlayerLuaTest:ReceiveActorEndOverlap(OtherActor)
-- end

return BP_PlayerLuaTest
