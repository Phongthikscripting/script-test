getgenv().Config = {
    ["Setting"] = {
        ["UiCheckItem"] = true,
        ["White Screen"] = false
    },       
    ["MainItem"] = {
        ["Saber"] = true,         
        ["Hallow Scythe"] = true,
        ["GodHuman"] = true,
        ["Skull Guitar"] = true,
        ["Cursed Dual Katana"] = true
    },
    ["MiscItem"] = {
        ["Feathered Visage"] = false,
        ["Pole1st"] = false,
        ["Dragon Trident"] = false,
        ["Spikey Trident"] = true,
        ["Buddy"] = false,
        ["Cavender"] = false,
        ["Twin Hooks"] = false,
        ["Gravity Blade"] = false,
        ["Venom Bow"] = false
    },
    ["Quest"] = {
        ["Race V2"] = true,
        ["Race V3"] = true,
        ["Haki Rainbow"] = true
    },
    ["Webhook"] = {
        ["Enable"] = false,
        ["UrlWebhook"] = "",
    }
}

local SCRIPTS = {
    Kaitun = "https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/KaitunBloxFruits.lua",
    AntiAFK = "https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk"
}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Loaded = false
local DECAL_ID = "126793551564937"

local function LoadScripts()
    spawn(function()
        pcall(function()
            loadstring(game:HttpGet(SCRIPTS.Kaitun))()
        end)    end)
    
    spawn(function()
        pcall(function()
            loadstring(game:HttpGet(SCRIPTS.AntiAFK, true))()
        end)
    end)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ThapCamGUI"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.DisplayOrder = 999
ScreenGui.ResetOnSpawn = false

local ButtonFrame = Instance.new("Frame")
ButtonFrame.Size = UDim2.new(0, 220, 0, 100)
ButtonFrame.Position = UDim2.new(0.5, -110, 0.5, -50)
ButtonFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ButtonFrame.BorderColor3 = Color3.fromRGB(0, 150, 255)
ButtonFrame.BorderSizePixel = 2
ButtonFrame.Parent = ScreenGui

local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.new(0, 40, 0, 40)
Icon.Position = UDim2.new(0, 10, 0, 5)
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://" .. DECAL_ID
Icon.ScaleType = Enum.ScaleType.Crop
Icon.Parent = ButtonFrame

local Button = Instance.new("TextButton")
Button.Name = "kaitun set"
Button.Size = UDim2.new(1, -60, 0, 45)
Button.Position = UDim2.new(0, 55, 0, 5)
Button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 20
Button.Font = Enum.Font.SourceSansBold
Button.Text = "kaitun set"
Button.BorderSizePixel = 0
Button.Parent = ButtonFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -10, 0, 20)
StatusLabel.Position = UDim2.new(0, 5, 0, 52)
StatusLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
StatusLabel.TextColor3 = Color3.new(0.8, 1, 0.8)
StatusLabel.TextSize = 13StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = "Status: Ready"
StatusLabel.Parent = ButtonFrame

local AuthorLabel = Instance.new("TextLabel")
AuthorLabel.Size = UDim2.new(1, -10, 0, 18)
AuthorLabel.Position = UDim2.new(0, 5, 0, 75)
AuthorLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
AuthorLabel.BackgroundTransparency = 1
AuthorLabel.TextColor3 = Color3.new(0.7, 0.7, 1)
AuthorLabel.TextSize = 12
AuthorLabel.Font = Enum.Font.SourceSansItalic
AuthorLabel.Text = "by Phongthikscripting"
AuthorLabel.Parent = ButtonFrame

Button.MouseButton1Click:Connect(function()
    if not Loaded then
        Button.Text = "⏳ Loading..."
        Button.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
        StatusLabel.Text = "Status: Loading..."
        
        LoadScripts()
        
        task.delay(2, function()
            Loaded = true
            Button.Text = "kaitun set"
            Button.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
            StatusLabel.Text = "Status: ✓ Loaded"
        end)
    else
        Button.Text = "🔄 Reloading..."
        StatusLabel.Text = "Status: Reloading..."
        
        LoadScripts()
        
        task.delay(2, function()
            Button.Text = "kaitun set"
            Button.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
            StatusLabel.Text = "Status: ✓ Reloaded"
        end)
    end
end)

local dragging, dragInput, dragStart, startPos
ButtonFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = ButtonFrame.Position
        input.Changed:Connect(function()            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

ButtonFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        ButtonFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

task.spawn(function()
    repeat task.wait() until Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    task.wait(1)
end)