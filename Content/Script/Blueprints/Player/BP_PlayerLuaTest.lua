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
local BP_PlayerLuaTest = UnLua.Class()

-- function BP_PlayerLuaTest:Initialize(Initializer)
-- end

-- function BP_PlayerLuaTest:UserConstructionScript()
-- end

function BP_PlayerLuaTest:ReceiveBeginPlay()
        --通过调用通用函数库的方法获取名字
    local msg = "Hello there is " .. UE.UKismetSystemLibrary.GetDisplayName(self)
    --打印相应的信息
    Screen.Print(msg,UE.FLinearColor( 1 , 1 , 0 , 1),7.0)

    --beginplay中声明初始化FOV的相应变量参数
    --获取默认相机参数，DefaultFOV在蓝图中声明
    self.DefaultFOV = self.Camera.FieldOfView
    --声明本地的线性插值
    local InterpFloats = self.ZoomInOut.TheTimeline.InterpFloats
    local FloatTrack = InterpFloats:GetRef(1)
    --绑定相应的函数
    FloatTrack.InterpFunc:Bind( self,BP_PlayerLuaTest.OnZoomInOutUpdate)

end

--自定义一个更新FOV的函数
function BP_PlayerLuaTest:UpdateAiming(isTrue)
    --判断isTrue的有效性
    if isTrue then
        --时间轴ZoomInOut在蓝图中声明当然也可以C++中声明然后lua调用
        self.ZoomInOut:Play()
    else
        self.ZoomInOut:Reverse()
    end

end

--自定义需要绑定的时间轴函数
function BP_PlayerLuaTest:OnZoomInOutUpdate(Alpha)
    local msg = "Call OnZoomInOutUpdate"
    Screen.Print(msg)
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
