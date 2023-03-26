
--Kavos
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Ut Boss Battles", "Ocean")

local Cam = "DevCameraOcclusionMode"
local UserGameSettings = game:GetService("UserGameSettings")


--Main
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Main")
local MiscTab = Window:NewTab("Misc")
local MiscSection = MiscTab:NewSection("Misc")
local CamTab = Window:NewTab("Camera")
local CamSection = CamTab:NewSection("Camera")
CamSection:NewButton("Unlock Camera", "changes your camera or smth", function()
        game.Players.LocalPlayer.CameraMaxZoomDistance = 100000
		game.Players.LocalPlayer.CameraMinZoomDistance = 0.5
end)

CamSection:NewToggle("Look through Walls", "does what it says it does", function(state)
    if state then
        game.Players.LocalPlayer[Cam] = 1
    else
        game.Players.LocalPlayer[Cam] = 0
    end
end)




CamSection:NewSlider("FOV", "Changes Your FOV", 120, 70, function(s)

game:GetService'Workspace'.Camera.FieldOfView = s
end)
MainSection:NewButton("GodMode", "Rejoin to disable", function()
    local BlockedRemotes = { "Functions", } local Events = { Fire = true, Invoke = true, FireServer = true, InvokeServer = true, } local gameMeta = getrawmetatable(game) local psuedoEnv = { ["__index"] = gameMeta.__index, ["__namecall"] = gameMeta.__namecall; } setreadonly(gameMeta, false) gameMeta.__index, gameMeta.__namecall = newcclosure(function(self, index, ...) if Events[index] then for i,v in pairs(BlockedRemotes) do if v == self.Name then return nil end end end return psuedoEnv.__index(self, index, ...) end) setreadonly(gameMeta, true)
end)
MiscSection:NewButton("Rejoin", "Rejoins", function()
    local TeleportService = game:GetService("TeleportService")
local PlaceID = "2848920787"

TeleportService:Teleport(PlaceID)
end)

MiscSection:NewSlider("WalkSpeed", "Changes your Walkspeed", 200, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
MiscSection:NewSlider("JumpPower", "Changes your Jumppower", 200, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewToggle("Open Food/Armor Shop", "ehh", function(state)
    if state then
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Shops.FoodShop, 0)
    else
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Shops.FoodShop, 1)
    end
end)
MainSection:NewButton("Inf Damage(true hell ability)", "kills the closest enemy using the ability of true knife", function()
    local args = {
    [1] = "RealKnife",
    [2] = workspace.Game.Mobs.Dummy,
    [3] = 15042143215325100,
    [4] = "Skill2",
    [5] = 30,
    [6] = "Area",
    [7] = true,
    [8] = 1.5
}

game:GetService("ReplicatedStorage").Skill:FireServer(unpack(args))
end)
MainSection:NewButton("Equip true knife for free", "Gives you the true knife for free", function()
    local args = {
    [1] = 8
}

game:GetService("Lighting").EquipToolShop:FireServer(unpack(args))
end)