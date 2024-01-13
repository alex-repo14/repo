local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("PλNDA Blue", "Ocean")

local Tab = Window:NewTab("Universal")
local Section = Tab:NewSection("Movement Scripts")
Section:NewButton("Fly", "A simple fly command, press 'E' to toggle.", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TR011F4C3/PANDA/main/scripts/fly.lua", true))()
end)

Section:NewButton("Noclip", "A simple noclip command, press 'V' to toggle.", function()
noclip = false
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)

if key == "v" then
noclip = not noclip
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
end)


Section:NewButton("ClickTP", "Click Teleportation.", function()
    mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "ClickTP"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)

Section:NewToggle("Infinite Jump", "A simple Infinite Jump script.", function(state)
    if state then
_G.infinjump = true
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
if _G.infinjump then
if k:byte() == 32 then
Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Humanoid:ChangeState("Jumping")
wait(0.1)
Humanoid:ChangeState("Seated")
end
end
end)
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
    else
if _G.infinjump == true then
_G.infinjump = false
else
_G.infinjump = true
end
end
end)



Section:NewSlider("Walk Speed", "A simple Walk Speed slider.", 500, 0, function(WalkScript) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkScript
end)

Section:NewSlider("Jump Power", "A simple Jump Power slider.", 500, 0, function(JumpScript) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpScript
end)

Section:NewTextBox("Goto", "Go to a player.", function(PlayerTeleportName)
local playerone = game.Players.LocalPlayer.Character
local playertwo = game.Workspace:FindFirstChild(PlayerTeleportName)
playerone.HumanoidRootPart.CFrame = playertwo.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
end)

local Tab = Window:NewTab("Command Scripts")
local Section = Tab:NewSection("Command Line Scripts")
Section:NewButton("Infinite Yield", "Launches Infinite Yield.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
end)
Section:NewButton("CMD-X", "Launches CMD-X.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)
Section:NewButton("Homebrew Admin", "Launches Homebrew Admin.", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/mgamingpro/HomebrewAdmin/master/Main'),true))()
end)



local Tab = Window:NewTab("Game Specific")
if game.PlaceId == 4913581664 then
local Section = Tab:NewSection("Cart Ride Into Rdite!")
Section:NewButton("Win", "Teleport to the end.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(310.673279, 852.799805, 321.170715, -1, -2.03773265e-08, -1.86249469e-08, -2.03773247e-08, 1, -6.54766623e-08, 1.86249487e-08, -6.54766623e-08, -1) 
end)

Section:NewButton("Break Carts", "Makes carts no longer work.", function()
    local function hook(cart)
   pcall(function()
       cart:WaitForChild("On")
       cart.On:WaitForChild("Click")

       cart:WaitForChild("Configuration")
       local onValue = cart.Configuration:WaitForChild("CarOn")

       if onValue.Value == true then
           fireclickdetector(cart.On.Click, math.random(50,100) / 100)
       end
       onValue:GetPropertyChangedSignal("Value"):Connect(function()
           if onValue.Value == true then
               fireclickdetector(cart.On.Click, math.random(50,100) / 100)
           end
       end)
   end)
end

local cartFolder
for _,v in pairs(workspace:GetChildren()) do if v.Name == "Carts" and not v:FindFirstChildOfClass("Part") then cartFolder = v end end

for _,cart in pairs(cartFolder:GetChildren()) do
   if string.find(cart.Name:lower(), "cart") then hook(cart) end
end
cartFolder.ChildAdded:Connect(function(child)
   if string.find(child.Name:lower(), "cart") then hook(child) end
end)
end)
end

if game.PlaceId == 7396361612 then
   local Section = Tab:NewSection("Game Detection is Functional")
end