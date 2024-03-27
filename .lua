
repo = 'https://raw.githubusercontent.com/ReachHublua/UI/main/'
Library = loadstring(game:HttpGet(repo .. 'LinoriaLib.lua'))()
ThemeManager = loadstring(game:HttpGet(repo .. 'ThemeManager.lua'))()
SaveManager = loadstring(game:HttpGet(repo .. 'SaveManager.lua'))()


local Window = Library:CreateWindow({
  Title = 'ReachHub - Build a boat for treasure | '..os.date('%A, %B %d %Y'),
  Center = true,
  AutoShow = true,
})

local Tabs = {
  Tab1 = Window:AddTab('General'),
  ['UI Settings'] = Window:AddTab('UI Settings')
}

Library:SetWatermark('ReachHub')

local Tab1_left = Tabs.Tab1:AddLeftGroupbox('\\\\ Main  //')
local Tab1_right = Tabs.Tab1:AddRightGroupbox('\\\\ Settings //')
local Tab1_left2 = Tabs.Tab1:AddLeftGroupbox('\\\\  Equipment  //')



local SafeZone = Instance.new("Part")
SafeZone.Size = Vector3.new(10,3,10)
SafeZone.Position = Vector3.new(-70, 50, 8756)
SafeZone.Transparency = 1
SafeZone.Material = "SmoothPlastic"
SafeZone.Anchored = true
SafeZone.Parent = game:GetService("Workspace")
SafeZone.Name = "SafeZone"

-- Global Varible

_G.WaitingF = false
_G.AutoFarm = false
_G.Fastmode = true

-- Functions


function Automaticfarm(Fast)
if Fast then
_G.WaitingF = true
  game.workspace.Gravity = 0

    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame =
        CFrame.new(-50, 52, -269)
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(30, Enum.EasingStyle.Linear)
        tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character:WaitForChild("HumanoidRootPart"),
        tweenInfo,
        {CFrame = CFrame.new(-70, 53, 8756)}
    )
    tween:Play()
    tween.Completed:Connect(function()
    repeat wait()
    pcall(function()
        game.workspace.Gravity = 192
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SafeZone.CFrame * CFrame.new(0,1.5,0)
    firetouchinterest(workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
    wait()
    firetouchinterest(workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
    end)
    until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") == nil
    repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    _G.WaitingF = false
    end)
end
end


Tab1_left:AddToggle('MyToggle', {
    Text = 'Auto Farm',
    Default = false, 
    Tooltip = 'Auto Farm',
    Callback = function(bool)
    _G.AutoFarm = bool
    end
})


spawn(function()
while wait(0.5) do
if _G.AutoFarm then
if _G.WaitingF == false then
        Automaticfarm(_G.Fastmode)
    end
end
end
end)



Tab1_right:AddToggle('MyToggle', {
    Text = 'White Screen',
    Default = false, 
    Tooltip = 'White_Screen',
    Callback = function(t)
        _G.White_Screen = t
    end
})


spawn(function()
    while true do
        wait()
      
        if _G.White_Screen then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end
end)


Tab1_right:AddToggle('MyToggle', {
    Text = 'Anti AFK',
    Default = false, 
    Tooltip = '',
    Callback = function(ah)
    _G.Ato = ah
while _G.Ato do wait()
game:GetService'VirtualUser':CaptureController()
game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end
    end
})

local a1 = Tab1_left2:AddLabel("PaintingTool : 🔴")
local a2 =Tab1_left2:AddLabel("BindTool : 🔴")
local a3 = Tab1_left2:AddLabel("ScalingTool : 🔴")
local a4 = Tab1_left2:AddLabel("PropertiesTool : 🔴")
local a5 = Tab1_left2:AddLabel("TrowelTool : 🔴")


spawn(function()
        while wait() do
            pcall(function()
             if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("PaintingTool") then
                   a1:SetText("PaintingTool : 🟢")
                else
                  a1:SetText("PaintingTool : 🔴")
                end
end)
end
end)
spawn(function()
        while wait() do
            pcall(function()
             if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("BindTool") then
                   a2:SetText("BindTool : 🟢")
                else
                  a2:SetText("BindTool : 🔴")
                end
end)
end
end)
spawn(function()
        while wait() do
            pcall(function()
             if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("ScalingTool") then
                   a3:SetText("ScalingTool : 🟢")
                else
                  a3:SetText("ScalingTool : 🔴")
                end
end)
end
end)
spawn(function()
        while wait() do
            pcall(function()
             if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("PropertiesTool") then
                   a4:SetText("PropertiesTool : 🟢")
                else
                  a4:SetText("PropertiesTool : 🔴")
                end
end)
end
end)
spawn(function()
        while wait() do
            pcall(function()
             if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("TrowelTool") then
                   a5:SetText("TrowelTool : 🟢")
                else
                  a5:SetText("TrowelTool : 🔴")
                end
end)
end
end)



ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
