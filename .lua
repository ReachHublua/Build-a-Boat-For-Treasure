local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0

local A = Instance.new("ScreenGui") 
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")

--ตั้งค่า

A.Parent = game.CoreGui 
A.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageLabel.Parent = A 
ImageLabel.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.ClipsDescendants = true
ImageLabel.Position = UDim2.new(0.476560513, 0, 0.443223147, 0)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Image = "rbxassetid://16740277003"

UICorner.CornerRadius = UDim.new(0.300000012, 0)
UICorner.Parent = ImageLabel

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

for i = 1, 50, 2 do
    blur.Size = i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.1
    camera.FieldOfView = camera.FieldOfView - 1 
    wait()
end
wait(1.5)

for i = 1, 50, 2 do
    blur.Size = 50 - i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.1
    camera.FieldOfView = camera.FieldOfView + 1 
    wait()
end

wait(1.5)
blur:Destroy()
A:Destroy()


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
  Tab1 = Window:AddTab('Farm'),
  ['UI Settings'] = Window:AddTab('UI Settings')
}

Library:SetWatermark('ReachHub')

local Tab1_left = Tabs.Tab1:AddLeftGroupbox('\\\\ Main //')
local Tab1_right = Tabs.Tab1:AddRightGroupbox('\\\\ Settings //')


Tab1_left:AddToggle('MyToggle', {
    Text = 'Auto Farm',
    Default = false, 
    Tooltip = 'Auto farm',
    Callback = function(bool)
    _G.AutoFarm = bool
    end
})

local function updateGoldLabel()
    local goldValue = game.Players.LocalPlayer.Data.Gold.Value
    Tab1_left:SetLabel('Gold : ' .. goldValue)
end


updateGoldLabel()


coroutine.wrap(function()
    while true do
        wait()
        updateGoldLabel() 
    end
end)()




Tab1_right:AddToggle('MyToggle', {
    Text = 'White_Screen',
    Default = false, 
    Tooltip = 'White_Screen',
    Callback = function(t)

    _G.White_Screen = t



    end
})

spawn(function()
while wait() do
if _G.White_Screen then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
else
    game:GetService("RunService"):Set3dRenderingEnabled(true)
end
                end
        end
  end)


Tab1_left:AddToggle('MyToggle', {
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


spawn(function()
while wait(0.5) do
if _G.AutoFarm then
if _G.WaitingF == false then
        Automaticfarm(_G.Fastmode)
    end
end
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


