-- saturn script init
-- todo: add more 
-- note: most of these are fake i realized giving an actual init scirpt is not a good idea
-- dont modify this really idrc

-- create a storage folder inside of game->CoreGui which will hold our modulescripts we will later edit them on in the c part
local cloned_folder = game.CoreGui.RobloxGui.Common.Modules -- roblox patched so we cant manually create a modulescript it has to be cloned and needs to already exist so we just clone anything inside of the module we edit anyways it makes sense so yaa

local module_scripts = {}
for _, child in ipairs(cloned_folder:GetChildren()) do
    if child:IsA("ModuleScript") then -- we dont need to do a specific module we can just do whatever we find in the modulescript
        table.insert(module_scripts, child) -- insert it into a table 
    end
end

if #module_scripts > 0 then -- this will always be above one unless you intentionally did something to the exploit (eg such as deleting the modulescripts from the cloned_folder path)
    local random_index = math.random(1, #module_scripts)
    local random_module = module_scripts[random_index]:Clone()
    random_module.Name = "nHDYICoQjw" -- doing a dummy random string we can do a backene that randomizes the string in luau and the cpp prat can read it its a bit hard but possible
    
    local junk = Instance.new("Folder") -- make a new folder that will hold our scripts 
    junk.Parent = game.CoreGui
    junk.Name = "SATURN"

    
    random_module.Parent = junk
    random_module:Destroy() -- once we dont need them we delete them instantly however in some cases spamming can cause an issue i todo fix this later on however it should work fine
else -- as said intenionnally or some bug 
    game.Players.LocalPlayer:Kick("weird. that wasnt supposed to happen")
    while true do end
end
