local module = {}

module.AdvancedSpy = Instance.new("ScreenGui")
module.Main = Instance.new("ScrollingFrame")
module.UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
module.ChatLog = Instance.new("ScrollingFrame")
module.ChatText = Instance.new("TextButton")
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

module.AdvancedSpy.Name = "Fakt_AdvancedSpy"
module.AdvancedSpy.Parent = game:GetService("CoreGui")
module.AdvancedSpy.Enabled = false
module.AdvancedSpy.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
module.AdvancedSpy.ResetOnSpawn = false

module.Main.Name = "Main"
module.Main.Parent = module.AdvancedSpy
module.Main.Active = true
module.Main.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
module.Main.BackgroundTransparency = 0.300
module.Main.BorderColor3 = Color3.fromRGB(45, 45, 65)
module.Main.BorderSizePixel = 2
module.Main.Position = UDim2.new(0.825520873, 0, 0.707296729, 0)
module.Main.Size = UDim2.new(0.200000003, 0, 0.273586214, 0)
module.Main.CanvasSize = UDim2.new(0, 0, 0, 0)

module.UIAspectRatioConstraint.Parent = module.Main
module.UIAspectRatioConstraint.AspectRatio = 1.275

module.ChatLog.Name = "ChatLog"
module.ChatLog.Parent = module.Main
module.ChatLog.Active = true
module.ChatLog.AutomaticCanvasSize = Enum.AutomaticSize.Y
module.ChatLog.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.ChatLog.BackgroundTransparency = 1.000
module.ChatLog.BorderColor3 = Color3.fromRGB(27, 42, 53)
module.ChatLog.Position = UDim2.new(0.0495950058, 0, 0, 0)
module.ChatLog.Size = UDim2.new(0.899999976, 0, 0.82385999, 0)
module.ChatLog.CanvasSize = UDim2.new(0, 0, 0, 0)

module.ChatText.Name = "ChatText"
module.ChatText.Parent = nil
module.ChatText.AutomaticSize = Enum.AutomaticSize.Y
module.ChatText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.ChatText.BackgroundTransparency = 1.000
module.ChatText.RichText = true
module.ChatText.Size = UDim2.new(0.95, 0, 0, 18)
module.ChatText.Font = Enum.Font.SourceSans
module.ChatText.Text = "[Name]: message"
module.ChatText.TextColor3 = Color3.fromRGB(255, 255, 255)
module.ChatText.TextSize = 18
module.ChatText.TextStrokeTransparency = 0.000
module.ChatText.TextWrapped = true
module.ChatText.TextXAlignment = Enum.TextXAlignment.Left
module.ChatText.TextYAlignment = Enum.TextYAlignment.Top

module.UIListLayout.Parent = module.ChatLog
module.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

module.SpectatePanel.Name = "SpectatePanel"
module.SpectatePanel.Parent = module.Main
module.SpectatePanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.SpectatePanel.BackgroundTransparency = 1.000
module.SpectatePanel.Position = UDim2.new(0.38548404, 0, 0.831899047, 0)
module.SpectatePanel.Size = UDim2.new(0.614515841, 0, 0.169679478, 0)

module.Next.Name = "Next"
module.Next.Parent = module.SpectatePanel
module.Next.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
module.Next.BackgroundTransparency = 0.200
module.Next.BorderSizePixel = 0
module.Next.Position = UDim2.new(0.86354959, 0, 0.188663736, 0)
module.Next.Size = UDim2.new(0.063218385, 0, 0.596293986, 0)
module.Next.Font = Enum.Font.GothamSemibold
module.Next.Text = ">"
module.Next.TextColor3 = Color3.fromRGB(255, 255, 255)
module.Next.TextScaled = true
module.Next.TextSize = 14.000
module.Next.TextStrokeTransparency = 0.000
module.Next.TextWrapped = true

module.Previous.Name = "Previous"
module.Previous.Parent = module.SpectatePanel
module.Previous.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
module.Previous.BackgroundTransparency = 0.200
module.Previous.BorderSizePixel = 0
module.Previous.Position = UDim2.new(0.0715145022, 0, 0.188663736, 0)
module.Previous.Size = UDim2.new(0.063218385, 0, 0.596294045, 0)
module.Previous.Font = Enum.Font.GothamSemibold
module.Previous.Text = "<"
module.Previous.TextColor3 = Color3.fromRGB(255, 255, 255)
module.Previous.TextScaled = true
module.Previous.TextSize = 14.000
module.Previous.TextStrokeTransparency = 0.000
module.Previous.TextWrapped = true

module.SearchBox.Name = "SearchBox"
module.SearchBox.Parent = module.SpectatePanel
module.SearchBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
module.SearchBox.BackgroundTransparency = 0.380
module.SearchBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
module.SearchBox.BorderSizePixel = 0
module.SearchBox.Position = UDim2.new(0.167817861, 0, 0.188663736, 0)
module.SearchBox.Size = UDim2.new(0.653448284, 0, 0.596293807, 0)
module.SearchBox.Font = Enum.Font.GothamSemibold
module.SearchBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
module.SearchBox.PlaceholderText = "Player name"
module.SearchBox.Text = ""
module.SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
module.SearchBox.TextScaled = true
module.SearchBox.TextSize = 14.000
module.SearchBox.TextStrokeTransparency = 0.000
module.SearchBox.TextWrapped = true

module.ExtraPanel.Name = "ExtraPanel"
module.ExtraPanel.Parent = module.Main
module.ExtraPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.ExtraPanel.BackgroundTransparency = 1.000
module.ExtraPanel.Position = UDim2.new(-0.00228391169, 0, 0.831899047, 0)
module.ExtraPanel.Size = UDim2.new(0.387767941, 0, 0.169679478, 0)

module.SettingsButton.Name = "SettingsButton"
module.SettingsButton.Parent = module.ExtraPanel
module.SettingsButton.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
module.SettingsButton.BackgroundTransparency = 0.500
module.SettingsButton.BorderColor3 = Color3.fromRGB(45, 45, 65)
module.SettingsButton.BorderSizePixel = 2
module.SettingsButton.Position = UDim2.new(0.128040045, 0, 0.188663676, 0)
module.SettingsButton.Size = UDim2.new(0.205959156, 0, 0.596293747, 0)
module.SettingsButton.Image = "http://www.roblox.com/asset/?id=183390139"
module.SettingsButton.ImageTransparency = 0.300

module.SettingsPanel.Name = "SettingsPanel"
module.SettingsPanel.Parent = module.Main
module.SettingsPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.SettingsPanel.BackgroundTransparency = 1.000
module.SettingsPanel.Size = UDim2.new(1, 0, 0.820097685, 0)
module.SettingsPanel.Visible = false

module.WDSETTING.Name = "WDSETTING"
module.WDSETTING.Parent = module.SettingsPanel
module.WDSETTING.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.WDSETTING.BackgroundTransparency = 1.000
module.WDSETTING.Position = UDim2.new(0.0447427258, 0, 0.0463741124, 0)
module.WDSETTING.Selectable = true
module.WDSETTING.Size = UDim2.new(0.664429486, 0, 0.15367201, 0)
module.WDSETTING.Font = Enum.Font.GothamSemibold
module.WDSETTING.Text = "Whisper detection (WIP):"
module.WDSETTING.TextColor3 = Color3.fromRGB(220, 220, 220)
module.WDSETTING.TextScaled = true
module.WDSETTING.TextSize = 14.000
module.WDSETTING.TextStrokeTransparency = 0.000
module.WDSETTING.TextWrapped = true
module.WDSETTING.TextXAlignment = Enum.TextXAlignment.Left

module.WhisperDetectionCheckBox.Name = "WhisperDetectionCheckBox"
module.WhisperDetectionCheckBox.Parent = module.WDSETTING
module.WhisperDetectionCheckBox.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
module.WhisperDetectionCheckBox.BackgroundTransparency = 0.500
module.WhisperDetectionCheckBox.BorderColor3 = Color3.fromRGB(45, 45, 65)
module.WhisperDetectionCheckBox.BorderSizePixel = 2
module.WhisperDetectionCheckBox.Position = UDim2.new(1.05635023, 0, 0.150886625, 0)
module.WhisperDetectionCheckBox.Size = UDim2.new(0.0908832252, 0, 0.623669922, 0)
module.WhisperDetectionCheckBox.Image = "rbxassetid://5465668842"
module.WhisperDetectionCheckBox.ImageTransparency = 1.000
module.WhisperDetectionCheckBox:SetAttribute("Checked", true)

module.MTSETTING.Name = "MTSETTING"
module.MTSETTING.Parent = module.SettingsPanel
module.MTSETTING.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.MTSETTING.BackgroundTransparency = 1.000
module.MTSETTING.Position = UDim2.new(0.0447427258, 0, 0.19709006, 0)
module.MTSETTING.Selectable = true
module.MTSETTING.Size = UDim2.new(0.548844337, 0, 0.15367201, 0)
module.MTSETTING.Font = Enum.Font.GothamSemibold
module.MTSETTING.Text = "Message timeout:"
module.MTSETTING.TextColor3 = Color3.fromRGB(220, 220, 220)
module.MTSETTING.TextScaled = true
module.MTSETTING.TextSize = 14.000
module.MTSETTING.TextStrokeTransparency = 0.000
module.MTSETTING.TextWrapped = true
module.MTSETTING.TextXAlignment = Enum.TextXAlignment.Left

module.MessageTimeoutBox.Name = "MessageTimeoutBox"
module.MessageTimeoutBox.Parent = module.MTSETTING
module.MessageTimeoutBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
module.MessageTimeoutBox.BackgroundTransparency = 0.380
module.MessageTimeoutBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
module.MessageTimeoutBox.BorderSizePixel = 0
module.MessageTimeoutBox.Position = UDim2.new(1.0460242, 0, 0.220535457, 0)
module.MessageTimeoutBox.Size = UDim2.new(0.446811646, 0, 0.532550573, 0)
module.MessageTimeoutBox.Font = Enum.Font.GothamSemibold
module.MessageTimeoutBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
module.MessageTimeoutBox.Text = "5"
module.MessageTimeoutBox.TextColor3 = Color3.fromRGB(255, 255, 255)
module.MessageTimeoutBox.TextScaled = true
module.MessageTimeoutBox.TextSize = 14.000
module.MessageTimeoutBox.TextStrokeTransparency = 0.000
module.MessageTimeoutBox.TextWrapped = true

module.WOCSETTING.Name = "WOCSETTING"
module.WOCSETTING.Parent = module.SettingsPanel
module.WOCSETTING.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.WOCSETTING.BackgroundTransparency = 1.000
module.WOCSETTING.Position = UDim2.new(0.0473658517, 0, 0.347806007, 0)
module.WOCSETTING.Selectable = true
module.WOCSETTING.Size = UDim2.new(0.546221077, 0, 0.182655841, 0)
module.WOCSETTING.Font = Enum.Font.GothamSemibold
module.WOCSETTING.Text = "Only show whispers:"
module.WOCSETTING.TextColor3 = Color3.fromRGB(220, 220, 220)
module.WOCSETTING.TextScaled = true
module.WOCSETTING.TextSize = 14.000
module.WOCSETTING.TextStrokeTransparency = 0.000
module.WOCSETTING.TextWrapped = true
module.WOCSETTING.TextXAlignment = Enum.TextXAlignment.Left

module.WhisperOnlyCheckBox.Name = "WhisperOnlyCheckBox"
module.WhisperOnlyCheckBox.Parent = module.WOCSETTING
module.WhisperOnlyCheckBox.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
module.WhisperOnlyCheckBox.BackgroundTransparency = 0.500
module.WhisperOnlyCheckBox.BorderColor3 = Color3.fromRGB(45, 45, 65)
module.WhisperOnlyCheckBox.BorderSizePixel = 2
module.WhisperOnlyCheckBox.Position = UDim2.new(1.04952395, 0, 0.214358464, 0)
module.WhisperOnlyCheckBox.Size = UDim2.new(0.118003823, 0, 0.528461874, 0)
module.WhisperOnlyCheckBox.Image = "rbxassetid://5465668842"
module.WhisperOnlyCheckBox.ImageTransparency = 1.000
module.WhisperOnlyCheckBox:SetAttribute("Checked", false)

--Settings--
local settingsObjects = {module.WhisperDetectionCheckBox, module.MessageTimeoutBox, module.WhisperOnlyCheckBox}

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
