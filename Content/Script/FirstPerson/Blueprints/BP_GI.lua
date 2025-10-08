--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

require("LuaPanda").start("127.0.0.1" , 8818)

package.cpath = package.cpath .. ";c:/Users/16428/.vscode/extensions/tangzx.emmylua-0.9.29-win32-x64/debugger/emmy/windows/x64/?.dll"
local dbg = require("emmy_core")
dbg.tcpListen("localhost", 9966)

---@type BP_GI_C
local BP_GI = UnLua.Class()

return BP_GI