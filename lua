local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/title33/SaveManager/main/README.md"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Reach Hub",
    SubTitle = "by Dev Reach Hub",
    TabWidth = 160,
    Size = UDim2.fromOffset(530, 340),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
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
