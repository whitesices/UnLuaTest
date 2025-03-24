--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
--引入外部打印屏幕信息的模块
local msg = require "Screen"
local Screen = require("Screen")
---@type ABP_PlayerLuaTest_C
local M = UnLua.Class()

-- function M:Initialize(Initializer)
-- end

-- function M:BlueprintInitializeAnimation()

-- end

function M:BlueprintBeginPlay()
    local msg = "This is " .. UE.UKismetSystemLibrary.GetDisplayName(self)
    Screen.Print( msg , UE.FLinearColor(1,1,0,1) , 7.0)
    --初始化相应的值
    self.Velocity = UE.FVector()
    self.ForwardVec = UE.FVector()
    self.RightVec = UE.FVector()
    self.ControlRot = UE.FRotator()
    self.Pawn = self:TryGetPawnOwner()
end

--更新相应数据 速度 ， 
function M:BlueprintUpdateAnimation(DeltaTimeX)
    --声明一个本地向量来存储Pawn
    local Pawn = self:TryGetPawnOwner( self.Pawn )
    --判断获取的Pawn是否有效
    if not Pawn then
        return
    end

    --声明局部变量存储角色的速度
    local Vel = Pawn:GetVelocity( self.Velocity )
    --判断获取的速度值是否有效
    if not Vel then
        return
    end

    --获取创建局部角色变量,强转为动画蓝图
    local Character = Pawn:Cast(UE.ABP_PlayerLuaTest_C)
    --local msg = "The Character`s name is " .. UE.UKismetSystemLibrary.GetDisplayName(Character)
    --Screen.Print( msg , UE.FLinearColor(1,0,0,1), 10.0)
    --判断角色变量的有效性
    if Character then
        --判断death是否有效
        if Character.bDeath and not self.bDeath then
            --初始化相应的值
            self.bDeath = true
            self.ActiveChildIndex = UE.UKismetSystemLibrary.RandomIntegerInRange(0 , 2)
        end
    end
    --获取计算方向值
    local Speed = Vel:Size()
    self.Speed = Speed

    --判断获取的速度值是否有效
    if Speed > 0.0 then 
        --将速度值进行归一化
        Vel:Normalize()
        --获取控制的旋转变量
        local Rot = Pawn:GetControlRotation( self.ControlRot )
        --设置旋转变量
        Rot:Set( 0 , Rot.Yaw , 0 )
        --获取前向向量
        local ForwardVec = Rot:GetForwardVector( self.ForwardVec )
        --获取右转向量
        local RightVec = Rot:GetRightVector( self.RightVec )
        local DP0 = Vel:Dot(RightVec)
        local DP1 = Vel:Dot(ForwardVec)
        local Angle = UE.UKismetSystemLibrary.Acos(DP1)
        --判断是否大于零
        if DP1 > 0.0 then
            self.Direction = Angle
        else
            self.Direction = -Angle
        end
    end

end

-- function M:BlueprintPostEvaluateAnimation()
-- end

return M
