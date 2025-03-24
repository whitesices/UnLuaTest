--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

local Screen = require "Screen"

---@type BP_PlayerControllerLuaTest_C
local BP_PlayerControllerLuaTest = UnLua.Class()

-- function BP_PlayerControllerLuaTest:Initialize(Initializer)
-- end

-- function BP_PlayerControllerLuaTest:UserConstructionScript()
-- end

function BP_PlayerControllerLuaTest:ReceiveBeginPlay()
    --打印
    local msg = "This is " .. UE.UKismetSystemLibrary.GetDisplayName(self)
    Screen.Print( msg , UE.FLinearColor( 0 , 1 , 1 , 1), 7.0 )
    --BeginPlay里初始化两个变量,初始化旋转参数和方向向量参数
    self.ControlRot = UE.FRotator()
    self.ForwardVec = UE.FVector()
    --初始化声明Right的方向变量
    self.RightVec = UE.FVector()
end

-- function BP_PlayerControllerLuaTest:ReceiveEndPlay()
-- end

-- function BP_PlayerControllerLuaTest:ReceiveTick(DeltaSeconds)
-- end

-- function BP_PlayerControllerLuaTest:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function BP_PlayerControllerLuaTest:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function BP_PlayerControllerLuaTest:ReceiveActorEndOverlap(OtherActor)
-- end

--如何调用蓝图里面的事件？ 取一个方法名一样的进行重载
function BP_PlayerControllerLuaTest:MoveForward(AxisValue)
    --判断Pawn是否存在
    if self.Pawn then
        --设置旋转变量和参数
        local Rotation = self:GetControlRotation( self.ControlRot )
        Rotation:Set( 0 , Rotation.Yaw , 0 )
        --设置方向
        local Direction = Rotation:ToVector( self.MoveForwardVec)
        --调用Pawn的角色移动函数
        self.Pawn:AddMovementInput(Direction,AxisValue)
    end
end

--调用蓝图中的MoveRight方法
function BP_PlayerControllerLuaTest:MoveRight( AxisValue )
    --判断Pawn是否存在if

    if self.Pawn then
        --获取角色旋转
        local Rotation = self:GetControlRotation(self.ControlRot)
        Rotation:Set(0 , Rotation.Yaw , 0 )
        --获取向右向量
        local Direction = Rotation:GetRightVector(self.RightVec)
        self.Pawn:AddMovementInput( Direction , AxisValue )
    end
end

--调用鼠标控制摄像机左右旋转的Turn函数
function BP_PlayerControllerLuaTest:Turn(AxisValue)
    --Screen.Print("This is Turn")
    --判断Pawn是否存在
    if self.Pawn then
        self:AddYawInput(AxisValue)
    end
end

--调用鼠标控制摄像机上下晃动的LookUp函数
function BP_PlayerControllerLuaTest:LookUp(AxisValue)
    --打印提示
    --Screen.Print("This is LookUp")

    --判断Pawn是否存在
    if self.Pawn then
        self:AddPitchInput(AxisValue)
    end
end


--调用自定义的按键函数
function BP_PlayerControllerLuaTest:Fire_Pressed()
    local msg = "PlayerController : Fire Fire_Pressed"
    Screen.Print(msg)
end

function BP_PlayerControllerLuaTest:Fire_Released()
    local msg = "PlayerController : Fire Fire_Released"
    Screen.Print(msg)
end

function BP_PlayerControllerLuaTest:Aim_Pressed()
    local msg = "PlayerController : Aim Aim_Pressed"
    Screen.Print(msg)
    --判断Pawn的有效性
    if not self.Pawn then
        return
    end
    --更新FOV值
    self.Pawn:UpdateAiming(true)
end

function BP_PlayerControllerLuaTest:Aim_Released()
    local msg = "PlayerController : Aim Aim_Released"
    Screen.Print(msg)
    --判断Pawn的有效性
    if not self.Pawn then
        return
    end
    --还原FOV值
    self.Pawn:UpdateAiming(false)
end

return BP_PlayerControllerLuaTest
