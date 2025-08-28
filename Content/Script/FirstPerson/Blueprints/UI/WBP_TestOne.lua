--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
--定义打印屏幕全局变量
local Screen = require "Screen"

---@type WBP_TestOne_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    local msg = "Hello Unreal " .. UE.UTestLuaUtils.GetInt() .. " " .. self.Title
    print(msg)
    print(tostring(self.Button_Main))
    Screen.Print(msg,UE.FLinearColor( 1 , 1 , 0 , 1),7.0)
    --self:ShowButton()
    self:PlayAnimation(self.Start,0,1)

    --添加按钮事件
    self.Button_Main.OnPressed:Add( self , M.OnClick_One )
end

--访问c++中的属性
function M:OnClick_One()
    --获取world
    local world = self:GetWorld()
    -- local dbg = require("emmy_core")
    -- dbg.tcpListen("localhost", 9966)
    --判断world的有效性
    if not world then
        return
    end
    --获取actor的类型
    --note 第二个需要加_C
    local ActorClass = UE.UClass.Load("/Game/FirstPerson/Blueprints/BP_OneActor.BP_OneActor_C")
    --SpawnActor
    local Actor = world:SpawnActor( ActorClass , UE.FVector() ,UE.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, self , self ,"")
    self.Actor = Actor
    Actor:GetIndex()
    local msg = "MyActor name is " .. self.Actor.name
    --打印相应信息
    Screen.Print(msg,UE.FLinearColor( 0 , 1 , 0 , 1),7.0)
end

--function M:Tick(MyGeometry, InDeltaTime)
--end

return M
