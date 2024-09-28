-- saturn script init
-- todo: add more 
-- note: most of these are fake i realized giving an actual init scirpt is not a good idea

function checkcaller() --akways return true
  return true
end

function identifyexecutor()
  return "saturn", "v6.420"
end

function getexecutorname()
  return "saturn"
end

--https://github.com/speedstarkawaii/fake-identity-spoofer/
local exploit_thread = 3 --actual identity goes here(i suggest putting you real identity)

function getthreadidentity()
    return exploit_thread -- return thread
end

function identity_spoofed()
  print("Current identity is "..exploit_thread)
end

function setthreadidentity(identity)
    if type(identity) ~= "number" then
        print("oops! identity must be a number")
    end
    exploit_thread = identity
    printidentity = identity_spoofed 
end

getidentity = getthreadidentity
getthreadcontext = getthreadidentity

setidentity = setthreadidentity
setthreadcontext = setthreadidentity

isrbxactive = checkcaller
isgameactive = checkcaller

-- other shit faked i dont wanna give u real funcs so for da sake u can LEARNNNN

function getsenv(script)--theres a better way to do this
    if typeof(script) ~= "Instance" or (script.ClassName ~= "Script" and script.ClassName ~= "LocalScript" and script.ClassName ~= "ModuleScript") then
        error("oh must be a Script, LocalScript, or ModuleScript.")
    end
    
    local env = {
        script = script
    }
    
    return env
end

function getgc()
    local gc = {}

    table.insert(gc, {name = "fake"})
    table.insert(gc, {name = "xd"})
    table.insert(gc, {name = "fuck you"})

    return gc
end

-- what script actually uses these shit lol
--https://synapsexdocs.github.io/custom-lua-functions/console-functions/
function rconsoleclear() --Clears the console. MACRO: system("CLS")
end

function rconsolecreate() --todo: allocate console via bridge??? possible but i dont want to do this
end

function rconsoledestroy() -- in cpp i would do ShowWindow(hwnd, SW_HIDE) to destroy if we want we can just close it 
end

function rconsoleinput() 
end

function rconsoleprint(txt) 
end

function consoleclear() 
end

function consolecreate() 
end

function consoledestroy() 
end

function consoleinput() 
end

function consoleprint(txt) 
end

function rconsolename(txt) 
end

function consolesettitle(txt) 
end

-- i can do this via bridge i just dont feel like it
local vim = game:GetService('VirtualInputManager')

 function mouse1click(x, y)
    x, y = x or 0, y or 0
    vim:SendMouseButtonEvent(x, y, 0, true, game, false)
    task.wait()
    vim:SendMouseButtonEvent(x, y, 0, false, game, false)
end

 function mouse2click(x, y)
    x, y = x or 0, y or 0
    vim:SendMouseButtonEvent(x, y, 1, true, game, false)
    task.wait()
    vim:SendMouseButtonEvent(x, y, 1, false, game, false)
end

 function mouse1press(x, y)
    x, y = x or 0, y or 0
    vim:SendMouseButtonEvent(x, y, 0, true, game, false)
end

 function mouse1release(x, y)
    x, y = x or 0, y or 0
    vim:SendMouseButtonEvent(x, y, 0, false, game, false)
end

 function mouse2press(x, y)
    x, y = x or 0, y or 0
    vim:SendMouseButtonEvent(x, y, 1, true, game, false)
end

 function mouse2release(x, y)
    x, y = x or 0, y or 0
    vim:SendMouseButtonEvent(x, y, 1, false, game, false)
end

 function mousescroll(x, y, a)
    x, y = x or 0, y or 0
    vim:SendMouseWheelEvent(x, y, a or false, game)
end

 function mousemoverel(relx, rely)
    relx, rely = relx or 0, rely or 0
    local Pos = workspace.CurrentCamera.ViewportSize
    local x = Pos.X * relx
    local y = Pos.Y * rely
    vim:SendMouseMoveEvent(x, y, game)
end

 function mousemoveabs(x, y)
    x, y = x or 0, y or 0
    vim:SendMouseMoveEvent(x, y, game)
end
