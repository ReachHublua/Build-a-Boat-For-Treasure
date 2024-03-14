

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







local openshit = Instance.new("ScreenGui")
local mainopen = Instance.new("TextButton")
local mainopens = Instance.new("UICorner")
local loki = Instance.new("ImageLabel")
local posto = Instance.new("UIStroke")

openshit.Name = "openshit"
openshit.Parent = game.CoreGui
openshit.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local UICorner_11 = Instance.new("UICorner")
local UICorner_12 = Instance.new("UICorner")

local buttonframe = Instance.new("Frame")

local ImageButton_2 = Instance.new("ImageButton")

buttonframe.Parent = openshit
buttonframe.Name = "buttonframe"
buttonframe.BackgroundColor3 = Color3.fromRGB(0,0,0)
buttonframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
buttonframe.BackgroundTransparency = 1.000
buttonframe.BorderSizePixel = 0
buttonframe.Position = UDim2.new(0.00790273491, 0, 0.233524337, 0)
buttonframe.Size = UDim2.new(0, 51, 0, 50)

UICorner_11.Parent = buttonframe
UICorner_12.Parent = ImageButton_2

ImageButton_2.Parent = buttonframe
ImageButton_2.BackgroundColor3 = Color3.fromRGB(86,255,255)
ImageButton_2.BorderColor3 = Color3.fromRGB(86,255,255)
ImageButton_2.BackgroundTransparency = 1.000
ImageButton_2.BorderSizePixel = 0
ImageButton_2.Position = UDim2.new(0.0242961459, 0, 0.0168576241, 0)
ImageButton_2.Size = UDim2.new(0, 49, 0, 48)
ImageButton_2.Image = "rbxassetid://16740277003"
ImageButton_2.MouseButton1Click:Connect(function()
    local screenGui = game.CoreGui:FindFirstChild("ScreenGui")
    if screenGui then
        screenGui.Enabled = not screenGui.Enabled
    end
end)

mainopens.Parent = mainopen
 
loki.Name = "loki"
loki.Parent = mainopen
loki.BackgroundColor3 = Color3.fromRGB(224,224,224)
loki.BackgroundTransparency = 1.000
loki.Position = UDim2.new(-0.0529999994, 0, -0.244000003, 0)
loki.Size = UDim2.new(0, 69, 0, 62)
loki.Image = "rbxassetid://16740277003"
 
posto.Name = "posto"
posto.Parent = mainopen
posto.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
posto.Color = Color3.fromRGB(224,224,224)
posto.LineJoinMode = Enum.LineJoinMode.Round
posto.Thickness = 1
posto.Transparency = 0
posto.Enabled = true
posto.Archivable = true

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        local Tween = TweenService:Create(object, TweenInfo.new(0.15), {
            Position = pos
        })
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

MakeDraggable(buttonframe, openshit)


local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/title33/SaveManager/main/README.md"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Reach Hub",
    SubTitle = "By Dev Reach Hub",
    TabWidth = 160,
    Size = UDim2.fromOffset(530, 340),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    General = Window:AddTab({ Title = "General", Icon = "http://www.roblox.com/asset/?id=11254763826" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}


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
        local tweenService = game:GetService("TweenService")
        local tweenInfo = TweenInfo.new(26, Enum.EasingStyle.Linear)
        local tween =
            tweenService:Create(
            game:GetService("Players")["LocalPlayer"].Character:WaitForChild("HumanoidRootPart"),
            tweenInfo,
            {CFrame = CFrame.new(-70, 53, 8756)}
        )
        tween:Play()
        tween.Completed:Connect(function()
            repeat
                wait()
                pcall(function()
                    game.workspace.Gravity = 192
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SafeZone.CFrame * CFrame.new(0, 1.5, 0)
                    firetouchinterest(workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger,
                                      game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                    wait()
                    firetouchinterest(workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger,
                                      game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                end)
            until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") == nil
            repeat
                wait()
            until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            _G.WaitingF = false
        end)
    end
end


local Options = Fluent.Options



    local Toggle = Tabs.General:AddToggle("MyToggle", {Title = "AutoFarm", Default = false })

    Toggle:OnChanged(function(bool)
       _G.AutoFarm = bool
    end)

    Options.MyToggle:SetValue(false)

spawn(function()
while wait(0.5) do
if _G.AutoFarm then
if _G.WaitingF == false then
        Automaticfarm(_G.Fastmode)
    end
end
end
end)




 LocalPlayer = game:GetService("Players").LocalPlayer

    local Toggle = Tabs.General:AddToggle("Aut", {
    Title = "AntiAFK", 
    Default = false, 
    Callback = function(S) 
_G.AntiAFKEnabled = S
    local vu = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:connect(function()
        if _G.AntiAFKEnabled then
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end
      end)
    end 
    })

    local Toggle = Tabs.General:AddToggle("MyToggle", {Title = "White Screen", Default = false })

    Toggle:OnChanged(function(bool)
       _G.White_Screen = bool
if _G.White_Screen then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
else
    game:GetService("RunService"):Set3dRenderingEnabled(true)
end
    end)

    Options.MyToggle:SetValue(false)

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)


-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
