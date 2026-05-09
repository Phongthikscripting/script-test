getgenv().Config = {["Setting"] = {["UiCheckItem"] = true, ["White Screen"] = false}, ["MainItem"] = {["Saber"] = true, ["Hallow Scythe"] = true, ["GodHuman"] = true, ["Skull Guitar"] = true, ["Cursed Dual Katana"] = true}, ["MiscItem"] = {["Feathered Visage"] = false, ["Pole1st"] = false, ["Dragon Trident"] = false, ["Spikey Trident"] = true, ["Buddy"] = false, ["Cavender"] = false, ["Twin Hooks"] = false, ["Gravity Blade"] = false, ["Venom Bow"] = false}, ["Quest"] = {["Race V2"] = true, ["Race V3"] = true, ["Haki Rainbow"] = true}, ["Webhook"] = {["Enable"] = false, ["UrlWebhook"] = ""}}

local KAITUN_URL = "https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/KaitunBloxFruits.lua"
local ANTIAFK_URL = "https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Loaded = false
local AutoExecute = true

local function LoadScripts()
    spawn(function()
        pcall(function()
            loadstring(game:HttpGet(KAITUN_URL))()
        end)
    end)
    spawn(function()
        pcall(function()
            loadstring(game:HttpGet(ANTIAFK_URL, true))()
        end)
    end)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ThapCamGUI"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.DisplayOrder = 999
ScreenGui.ResetOnSpawn = false

local ButtonFrame = Instance.new("Frame")
ButtonFrame.Size = UDim2.new(0, 220, 0, 130)
ButtonFrame.Position = UDim2.new(0.5, -110, 0.5, -65)
ButtonFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ButtonFrame.BorderColor3 = Color3.fromRGB(0, 150, 255)
ButtonFrame.BorderSizePixel = 2
ButtonFrame.Parent = ScreenGui

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -10, 0, 35)
TitleLabel.Position = UDim2.new(0, 5, 0, 8)
TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.TextSize = 20
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "kaitun set"
TitleLabel.BorderSizePixel = 0
TitleLabel.Parent = ButtonFrame

local Button = Instance.new("TextButton")Button.Size = UDim2.new(1, -10, 0, 40)
Button.Position = UDim2.new(0, 5, 0, 48)
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 18
Button.Font = Enum.Font.SourceSansBold
Button.Text = "LOAD SCRIPTS"
Button.BorderSizePixel = 0
Button.Parent = ButtonFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -10, 0, 20)
StatusLabel.Position = UDim2.new(0, 5, 0, 90)
StatusLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
StatusLabel.TextColor3 = Color3.new(0.8, 1, 0.8)
StatusLabel.TextSize = 13
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = "Status: Ready"
StatusLabel.Parent = ButtonFrame

local AutoExecuteFrame = Instance.new("Frame")
AutoExecuteFrame.Size = UDim2.new(1, -10, 0, 35)
AutoExecuteFrame.Position = UDim2.new(0, 5, 0, 113)
AutoExecuteFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
AutoExecuteFrame.BorderSizePixel = 0
AutoExecuteFrame.Parent = ButtonFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 60, 0, 25)
ToggleButton.Position = UDim2.new(1, -65, 0, 5)
ToggleButton.BackgroundColor3 = AutoExecute and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(80, 80, 90)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = AutoExecute and "ON" or "OFF"
ToggleButton.BorderSizePixel = 0
ToggleButton.Parent = AutoExecuteFrame

local AutoExecuteLabel = Instance.new("TextLabel")
AutoExecuteLabel.Size = UDim2.new(1, -70, 0, 25)
AutoExecuteLabel.Position = UDim2.new(0, 5, 0, 5)
AutoExecuteLabel.BackgroundTransparency = 1
AutoExecuteLabel.TextColor3 = Color3.new(0.9, 0.9, 1)
AutoExecuteLabel.TextSize = 14
AutoExecuteLabel.Font = Enum.Font.SourceSansBold
AutoExecuteLabel.Text = "Auto Execute:"
AutoExecuteLabel.TextXAlignment = Enum.TextXAlignment.Left
AutoExecuteLabel.Parent = AutoExecuteFrame

local AuthorLabel = Instance.new("TextLabel")AuthorLabel.Size = UDim2.new(1, -10, 0, 18)
AuthorLabel.Position = UDim2.new(0, 5, 0, 107)
AuthorLabel.BackgroundTransparency = 1
AuthorLabel.TextColor3 = Color3.new(0.7, 0.7, 1)
AuthorLabel.TextSize = 12
AuthorLabel.Font = Enum.Font.SourceSansItalic
AuthorLabel.Text = "by Phongthikscripting"
AuthorLabel.Parent = ButtonFrame

local function UpdateAutoExecuteUI()
    if AutoExecute then
        ToggleButton.Text = "ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        StatusLabel.Text = "Status: Auto ON"
    else
        ToggleButton.Text = "OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
        StatusLabel.Text = "Status: Ready"
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    AutoExecute = not AutoExecute
    UpdateAutoExecuteUI()
end)

Button.MouseButton1Click:Connect(function()
    if not Loaded then
        Button.Text = "⏳ Loading..."
        Button.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
        StatusLabel.Text = "Status: Loading..."
        LoadScripts()
        wait(2)
        Loaded = true
        Button.Text = "✓ Loaded"
        Button.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        StatusLabel.Text = "Status: ✓ Loaded"
    else
        Button.Text = "🔄 Reloading..."
        StatusLabel.Text = "Status: Reloading..."
        LoadScripts()
        wait(2)
        Button.Text = "✓ Loaded"
        Button.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        StatusLabel.Text = "Status: ✓ Reloaded"
    end
end)

local dragging, dragInput, dragStart, startPos
ButtonFrame.InputBegan:Connect(function(input)    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = ButtonFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
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
        ButtonFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

spawn(function()
    repeat wait() until Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    wait(2)
    
    if AutoExecute then
        print("Auto Execute triggered!")
        Button.Text = "⏳ Loading..."
        LoadScripts()
        wait(2)
        Loaded = true
        Button.Text = "✓ Loaded"
        Button.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        StatusLabel.Text = "Status: ✓ Auto Loaded"
    end
end)

print("kaitun set (with auto) loaded! by Phongthikscripting")