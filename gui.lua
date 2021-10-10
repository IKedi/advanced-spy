local module = {}

module.Fakt_AdvancedSpy = Instance.new("ScreenGui")
module.Main = Instance.new("ScrollingFrame")
module.UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
module.ChatLog = Instance.new("ScrollingFrame")
module.UIListLayout = Instance.new("UIListLayout")
module.SpectatePanel = Instance.new("Frame")
module.Next = Instance.new("TextButton")
module.Previous = Instance.new("TextButton")
module.SearchBox = Instance.new("TextBox")
module.ExtraPanel = Instance.new("Frame")
module.SettingsButton = Instance.new("ImageButton")
module.SettingsPanel = Instance.new("Frame")
module.WDSETTING = Instance.new("TextLabel")
module.WhisperDetectionCheckBox = Instance.new("ImageButton")
module.MTSETTING = Instance.new("TextLabel")
module.MessageTimeoutBox = Instance.new("TextBox")
module.WOCSETTING = Instance.new("TextLabel")
module.WhisperOnlyCheckBox = Instance.new("ImageButton")

Fakt_AdvancedSpy.Name = "Fakt_AdvancedSpy"
Fakt_AdvancedSpy.Parent = game:GetService("CoreGui")
Fakt_AdvancedSpy.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Fakt_AdvancedSpy.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = Fakt_AdvancedSpy
Main.Active = true
Main.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
Main.BackgroundTransparency = 0.300
Main.BorderColor3 = Color3.fromRGB(45, 45, 65)
Main.BorderSizePixel = 2
Main.Position = UDim2.new(0.825520873, 0, 0.707296729, 0)
Main.Size = UDim2.new(0.200000003, 0, 0.273586214, 0)
Main.CanvasSize = UDim2.new(0, 0, 0, 0)

UIAspectRatioConstraint.Parent = Main
UIAspectRatioConstraint.AspectRatio = 1.275

ChatLog.Name = "ChatLog"
ChatLog.Parent = Main
ChatLog.Active = true
ChatLog.AutomaticCanvasSize = Enum.AutomaticSize.Y
ChatLog.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChatLog.BackgroundTransparency = 1.000
ChatLog.BorderColor3 = Color3.fromRGB(27, 42, 53)
ChatLog.Position = UDim2.new(0.0495950058, 0, 0, 0)
ChatLog.Size = UDim2.new(0.899999976, 0, 0.82385999, 0)
ChatLog.CanvasSize = UDim2.new(0, 0, 0, 0)

ChatText.Name = "ChatText"
ChatText.Parent = nil
ChatText.AutomaticSize = Enum.AutomaticSize.Y
ChatText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChatText.BackgroundTransparency = 1.000
ChatText.RichText = true
ChatText.Size = UDim2.new(0.95, 0, 0, 18)
ChatText.Font = Enum.Font.SourceSans
ChatText.Text = "[Name]: message"
ChatText.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatText.TextSize = 18
ChatText.TextStrokeTransparency = 0.000
ChatText.TextWrapped = true
ChatText.TextXAlignment = Enum.TextXAlignment.Left
ChatText.TextYAlignment = Enum.TextYAlignment.Top

UIListLayout.Parent = ChatLog
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

SpectatePanel.Name = "SpectatePanel"
SpectatePanel.Parent = Main
SpectatePanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpectatePanel.BackgroundTransparency = 1.000
SpectatePanel.Position = UDim2.new(0.38548404, 0, 0.831899047, 0)
SpectatePanel.Size = UDim2.new(0.614515841, 0, 0.169679478, 0)

Next.Name = "Next"
Next.Parent = SpectatePanel
Next.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
Next.BackgroundTransparency = 0.200
Next.BorderSizePixel = 0
Next.Position = UDim2.new(0.86354959, 0, 0.188663736, 0)
Next.Size = UDim2.new(0.063218385, 0, 0.596293986, 0)
Next.Font = Enum.Font.GothamSemibold
Next.Text = ">"
Next.TextColor3 = Color3.fromRGB(255, 255, 255)
Next.TextScaled = true
Next.TextSize = 14.000
Next.TextStrokeTransparency = 0.000
Next.TextWrapped = true

Previous.Name = "Previous"
Previous.Parent = SpectatePanel
Previous.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
Previous.BackgroundTransparency = 0.200
Previous.BorderSizePixel = 0
Previous.Position = UDim2.new(0.0715145022, 0, 0.188663736, 0)
Previous.Size = UDim2.new(0.063218385, 0, 0.596294045, 0)
Previous.Font = Enum.Font.GothamSemibold
Previous.Text = "<"
Previous.TextColor3 = Color3.fromRGB(255, 255, 255)
Previous.TextScaled = true
Previous.TextSize = 14.000
Previous.TextStrokeTransparency = 0.000
Previous.TextWrapped = true

SearchBox.Name = "SearchBox"
SearchBox.Parent = SpectatePanel
SearchBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
SearchBox.BackgroundTransparency = 0.380
SearchBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
SearchBox.BorderSizePixel = 0
SearchBox.Position = UDim2.new(0.167817861, 0, 0.188663736, 0)
SearchBox.Size = UDim2.new(0.653448284, 0, 0.596293807, 0)
SearchBox.Font = Enum.Font.GothamSemibold
SearchBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
SearchBox.PlaceholderText = "Player name"
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.TextScaled = true
SearchBox.TextSize = 14.000
SearchBox.TextStrokeTransparency = 0.000
SearchBox.TextWrapped = true

ExtraPanel.Name = "ExtraPanel"
ExtraPanel.Parent = Main
ExtraPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ExtraPanel.BackgroundTransparency = 1.000
ExtraPanel.Position = UDim2.new(-0.00228391169, 0, 0.831899047, 0)
ExtraPanel.Size = UDim2.new(0.387767941, 0, 0.169679478, 0)

SettingsButton.Name = "SettingsButton"
SettingsButton.Parent = ExtraPanel
SettingsButton.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
SettingsButton.BackgroundTransparency = 0.500
SettingsButton.BorderColor3 = Color3.fromRGB(45, 45, 65)
SettingsButton.BorderSizePixel = 2
SettingsButton.Position = UDim2.new(0.128040045, 0, 0.188663676, 0)
SettingsButton.Size = UDim2.new(0.205959156, 0, 0.596293747, 0)
SettingsButton.Image = "http://www.roblox.com/asset/?id=183390139"
SettingsButton.ImageTransparency = 0.300

SettingsPanel.Name = "SettingsPanel"
SettingsPanel.Parent = Main
SettingsPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingsPanel.BackgroundTransparency = 1.000
SettingsPanel.Size = UDim2.new(1, 0, 0.820097685, 0)
SettingsPanel.Visible = false

WDSETTING.Name = "WDSETTING"
WDSETTING.Parent = SettingsPanel
WDSETTING.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WDSETTING.BackgroundTransparency = 1.000
WDSETTING.Position = UDim2.new(0.0447427258, 0, 0.0463741124, 0)
WDSETTING.Selectable = true
WDSETTING.Size = UDim2.new(0.664429486, 0, 0.15367201, 0)
WDSETTING.Font = Enum.Font.GothamSemibold
WDSETTING.Text = "Whisper detection (WIP):"
WDSETTING.TextColor3 = Color3.fromRGB(220, 220, 220)
WDSETTING.TextScaled = true
WDSETTING.TextSize = 14.000
WDSETTING.TextStrokeTransparency = 0.000
WDSETTING.TextWrapped = true
WDSETTING.TextXAlignment = Enum.TextXAlignment.Left

WhisperDetectionCheckBox.Name = "WhisperDetectionCheckBox"
WhisperDetectionCheckBox.Parent = WDSETTING
WhisperDetectionCheckBox.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
WhisperDetectionCheckBox.BackgroundTransparency = 0.500
WhisperDetectionCheckBox.BorderColor3 = Color3.fromRGB(45, 45, 65)
WhisperDetectionCheckBox.BorderSizePixel = 2
WhisperDetectionCheckBox.Position = UDim2.new(1.05635023, 0, 0.150886625, 0)
WhisperDetectionCheckBox.Size = UDim2.new(0.0908832252, 0, 0.623669922, 0)
WhisperDetectionCheckBox.Image = "rbxassetid://5465668842"
WhisperDetectionCheckBox.ImageTransparency = 1.000
WhisperDetectionCheckBox:SetAttribute("Checked", false)

MTSETTING.Name = "MTSETTING"
MTSETTING.Parent = SettingsPanel
MTSETTING.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MTSETTING.BackgroundTransparency = 1.000
MTSETTING.Position = UDim2.new(0.0447427258, 0, 0.19709006, 0)
MTSETTING.Selectable = true
MTSETTING.Size = UDim2.new(0.548844337, 0, 0.15367201, 0)
MTSETTING.Font = Enum.Font.GothamSemibold
MTSETTING.Text = "Message timeout:"
MTSETTING.TextColor3 = Color3.fromRGB(220, 220, 220)
MTSETTING.TextScaled = true
MTSETTING.TextSize = 14.000
MTSETTING.TextStrokeTransparency = 0.000
MTSETTING.TextWrapped = true
MTSETTING.TextXAlignment = Enum.TextXAlignment.Left

MessageTimeoutBox.Name = "MessageTimeoutBox"
MessageTimeoutBox.Parent = MTSETTING
MessageTimeoutBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
MessageTimeoutBox.BackgroundTransparency = 0.380
MessageTimeoutBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
MessageTimeoutBox.BorderSizePixel = 0
MessageTimeoutBox.Position = UDim2.new(1.0460242, 0, 0.220535457, 0)
MessageTimeoutBox.Size = UDim2.new(0.446811646, 0, 0.532550573, 0)
MessageTimeoutBox.Font = Enum.Font.GothamSemibold
MessageTimeoutBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
MessageTimeoutBox.Text = "5"
MessageTimeoutBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageTimeoutBox.TextScaled = true
MessageTimeoutBox.TextSize = 14.000
MessageTimeoutBox.TextStrokeTransparency = 0.000
MessageTimeoutBox.TextWrapped = true

WOCSETTING.Name = "WOCSETTING"
WOCSETTING.Parent = SettingsPanel
WOCSETTING.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WOCSETTING.BackgroundTransparency = 1.000
WOCSETTING.Position = UDim2.new(0.0473658517, 0, 0.347806007, 0)
WOCSETTING.Selectable = true
WOCSETTING.Size = UDim2.new(0.546221077, 0, 0.182655841, 0)
WOCSETTING.Font = Enum.Font.GothamSemibold
WOCSETTING.Text = "Only show whispers:"
WOCSETTING.TextColor3 = Color3.fromRGB(220, 220, 220)
WOCSETTING.TextScaled = true
WOCSETTING.TextSize = 14.000
WOCSETTING.TextStrokeTransparency = 0.000
WOCSETTING.TextWrapped = true
WOCSETTING.TextXAlignment = Enum.TextXAlignment.Left

WhisperOnlyCheckBox.Name = "WhisperOnlyCheckBox"
WhisperOnlyCheckBox.Parent = WOCSETTING
WhisperOnlyCheckBox.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
WhisperOnlyCheckBox.BackgroundTransparency = 0.500
WhisperOnlyCheckBox.BorderColor3 = Color3.fromRGB(45, 45, 65)
WhisperOnlyCheckBox.BorderSizePixel = 2
WhisperOnlyCheckBox.Position = UDim2.new(1.04952395, 0, 0.214358464, 0)
WhisperOnlyCheckBox.Size = UDim2.new(0.118003823, 0, 0.528461874, 0)
WhisperOnlyCheckBox.Image = "rbxassetid://5465668842"
WhisperOnlyCheckBox.ImageTransparency = 1.000
WhisperOnlyCheckBox:SetAttribute("Checked", false)

--Settings--
local settingsObjects = {WhisperDetectionCheckBox, MessageTimeoutBox, WhisperOnlyCheckBox}

for i, v in ipairs(settingsObjects) do
    if v:IsA("ImageButton") and v:GetAttribute("Checked") ~= nil then --CheckBox
        local function SetCheckBox()
            if v:GetAttribute("Checked") == true then
                v.ImageTransparency = 0.3
            else
                v.ImageTransparency = 1
            end
        end

        v.MouseButton1Click:Connect(function()
            v:SetAttribute("Checked", not v:GetAttribute("Checked"))
            SetCheckBox()
        end)

        SetCheckBox()
    end
end

return module
