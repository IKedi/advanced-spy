local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local module = {}

module.ScreenGui = Instance.new("ScreenGui")
module.Main = Instance.new("ScrollingFrame")
module.UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
module.ChatLog = Instance.new("ScrollingFrame")
module.ChatText = Instance.new("TextButton")
module.UIListLayout = Instance.new("UIListLayout")
module.SpectatePanel = Instance.new("Frame")
module.Next = Instance.new("TextButton")
module.Previous = Instance.new("TextButton")
module.Autofill = Instance.new("TextLabel")
module.SearchBox = Instance.new("TextBox")
module.ExtraPanel = Instance.new("Frame")
module.SettingsButton = Instance.new("ImageButton")
module.SettingsPanel = Instance.new("Frame")
module.RPESETTING = Instance.new("TextLabel")
module.RoleplayEmphasizer = Instance.new("ImageButton")

module.ScreenGui.Name = HttpService:GenerateGUID(true)
module.ScreenGui.Parent = game:GetService("CoreGui")
module.ScreenGui.Enabled = false
module.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
module.ScreenGui.ResetOnSpawn = false

module.Main.Name = "Fakt_AdvancedSpy"
module.Main.Parent = module.ScreenGui
module.Main.Active = true
module.Main.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
module.Main.BackgroundTransparency = 0.300
module.Main.BorderColor3 = Color3.fromRGB(45, 45, 65)
module.Main.BorderSizePixel = 2
module.Main.Position = UDim2.new(0.8, 0, 0.726, 0)
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

module.Autofill.Name = "Autofill"
module.Autofill.Parent = module.SpectatePanel
module.Autofill.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
module.Autofill.BackgroundTransparency = 0.380
module.Autofill.BorderColor3 = Color3.fromRGB(27, 42, 53)
module.Autofill.BorderSizePixel = 0
module.Autofill.Position = UDim2.new(0.167999998, 0, 0.188999996, 0)
module.Autofill.Size = UDim2.new(0.652999997, 0, 0.596000016, 0)
module.Autofill.Font = Enum.Font.GothamSemibold
module.Autofill.Text = ""
module.Autofill.TextColor3 = Color3.fromRGB(178, 178, 178)
module.Autofill.TextScaled = true
module.Autofill.TextSize = 14.000
module.Autofill.TextStrokeTransparency = 0.000
module.Autofill.TextWrapped = true
module.Autofill.TextXAlignment = Enum.TextXAlignment.Left

module.SearchBox.Name = "SearchBox"
module.SearchBox.Parent = module.Autofill
module.SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.SearchBox.BackgroundTransparency = 1.000
module.SearchBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
module.SearchBox.BorderSizePixel = 0
module.SearchBox.Size = UDim2.new(1, 0, 1, 0)
module.SearchBox.Font = Enum.Font.GothamSemibold
module.SearchBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
module.SearchBox.PlaceholderText = "Player name"
module.SearchBox.Text = ""
module.SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
module.SearchBox.TextScaled = true
module.SearchBox.TextSize = 14.000
module.SearchBox.TextStrokeTransparency = 0.000
module.SearchBox.TextWrapped = true
module.SearchBox.TextXAlignment = Enum.TextXAlignment.Left

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

module.RPESETTING.Name = "RPESETTING"
module.RPESETTING.Parent = module.SettingsPanel
module.RPESETTING.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
module.RPESETTING.BackgroundTransparency = 1.000
module.RPESETTING.Position = UDim2.new(0.0447427258, 0, 0.0463741124, 0)
module.RPESETTING.Selectable = true
module.RPESETTING.Size = UDim2.new(0.664429486, 0, 0.15367201, 0)
module.RPESETTING.Font = Enum.Font.GothamSemibold
module.RPESETTING.Text = "Emphasize roleplay:"
module.RPESETTING.TextColor3 = Color3.fromRGB(220, 220, 220)
module.RPESETTING.TextScaled = true
module.RPESETTING.TextSize = 14.000
module.RPESETTING.TextStrokeTransparency = 0.000
module.RPESETTING.TextWrapped = true
module.RPESETTING.TextXAlignment = Enum.TextXAlignment.Left

module.RoleplayEmphasizer.Name = "RoleplayEmphasizer"
module.RoleplayEmphasizer.Parent = module.RPESETTING
module.RoleplayEmphasizer.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
module.RoleplayEmphasizer.BackgroundTransparency = 0.500
module.RoleplayEmphasizer.BorderColor3 = Color3.fromRGB(45, 45, 65)
module.RoleplayEmphasizer.BorderSizePixel = 2
module.RoleplayEmphasizer.Position = UDim2.new(1.05635023, 0, 0.150886625, 0)
module.RoleplayEmphasizer.Size = UDim2.new(0.0908832252, 0, 0.623669922, 0)
module.RoleplayEmphasizer.Image = "rbxassetid://5465668842"
module.RoleplayEmphasizer.ImageTransparency = 1.000
module.RoleplayEmphasizer:SetAttribute("Checked", true)

--[[TEXTBOX SETTING]]--

-- module.MTSETTING.Name = "MTSETTING"
-- module.MTSETTING.Parent = module.SettingsPanel
-- module.MTSETTING.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
-- module.MTSETTING.BackgroundTransparency = 1.000
-- module.MTSETTING.Position = UDim2.new(0.0447427258, 0, 0.19709006, 0)
-- module.MTSETTING.Selectable = true
-- module.MTSETTING.Size = UDim2.new(0.548844337, 0, 0.15367201, 0)
-- module.MTSETTING.Font = Enum.Font.GothamSemibold
-- module.MTSETTING.Text = "Message timeout:"
-- module.MTSETTING.TextColor3 = Color3.fromRGB(220, 220, 220)
-- module.MTSETTING.TextScaled = true
-- module.MTSETTING.TextSize = 14.000
-- module.MTSETTING.TextStrokeTransparency = 0.000
-- module.MTSETTING.TextWrapped = true
-- module.MTSETTING.TextXAlignment = Enum.TextXAlignment.Left

-- module.MessageTimeoutBox.Name = "MessageTimeoutBox"
-- module.MessageTimeoutBox.Parent = module.MTSETTING
-- module.MessageTimeoutBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
-- module.MessageTimeoutBox.BackgroundTransparency = 0.380
-- module.MessageTimeoutBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
-- module.MessageTimeoutBox.BorderSizePixel = 0
-- module.MessageTimeoutBox.Position = UDim2.new(1.0460242, 0, 0.220535457, 0)
-- module.MessageTimeoutBox.Size = UDim2.new(0.446811646, 0, 0.532550573, 0)
-- module.MessageTimeoutBox.Font = Enum.Font.GothamSemibold
-- module.MessageTimeoutBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
-- module.MessageTimeoutBox.Text = "5"
-- module.MessageTimeoutBox.TextColor3 = Color3.fromRGB(255, 255, 255)
-- module.MessageTimeoutBox.TextScaled = true
-- module.MessageTimeoutBox.TextSize = 14.000
-- module.MessageTimeoutBox.TextStrokeTransparency = 0.000
-- module.MessageTimeoutBox.TextWrapped = true

--[[Functions and stuff]]--

local oldSaveData = {}
local saveData = {}

module.settingsObjects = {module.RoleplayEmphasizer}
module.save = function()
	if writefile == nil then return;end

	local function len(t) --definitely didn't just copy from devforum 
		local n = 0
	
		for _ in pairs(t) do
			n = n + 1
		end
		return n
	end
	
	pcall(function()
		local changed = false

		if len(oldSaveData) == len(saveData) then --#var doesn't work on libraries
			for setting, value in pairs(saveData) do
				if oldSaveData[setting] ~= value then
					changed = true
					break
				end
			end
		else
			changed = true
		end
	
		if changed then
			oldSaveData = saveData
			writefile("FaktAdvancedSpySettings.json", HttpService:JSONEncode(saveData))
		end
	end)
end

module.load = function()
	if readfile == nil and not isfile("FaktAdvancedSpySettings.json") then return;end
	local decoded = nil

	local success, errstr = pcall(function()
		decoded = HttpService:JSONDecode(readfile("FaktAdvancedSpySettings.json"))
	end)

	if success then
		saveData = decoded

		for setting, value in pairs(decoded) do
			local v = module[setting]

			if v ~= nil then
				if typeof(value) == "boolean" then
					if v:IsA("ImageButton") and v:GetAttribute("Checked") ~= nil then
						v:SetAttribute("Checked", value)
					end
				else
					if v:IsA("TextBox") then
						v.Text = tostring(value)
					end
				end
			end
		end
	else
		if errstr == "Can't parse JSON" then --Corrupted save
			saveData = {}
			module.save()
		end
	end
end

--[[Settings]]--

for i, v in ipairs(module.settingsObjects) do
	if v:IsA("ImageButton") and v:GetAttribute("Checked") ~= nil then --CheckBox
		local function SetCheckBox()
			if v:GetAttribute("Checked") == true then
				v.ImageTransparency = 0.3
			else
				v.ImageTransparency = 1
			end

			saveData[v.Name] = v:GetAttribute("Checked")

			print("fakt: ",saveData[v.Name])
		end

		v.MouseButton1Click:Connect(function()
			v:SetAttribute("Checked", not v:GetAttribute("Checked"))
			SetCheckBox()
		end)

		v.Changed:Connect(function()
			SetCheckBox()
		end)

		SetCheckBox()
	elseif v:IsA("TextBox") then
		local defaultValue = v.Text

		if not v:GetAttribute("CanSetToEmpty") then
			v.FocusLost:Connect(function()
				if v.Text == "" or " " then
					v.Text = defaultValue
				end
			end)
		end
	end
end

--[[DRAG]]--
local dragging
local dragInput
local dragStart
local startPos
local function update(input)
	local delta = input.Position - dragStart
	module.Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
module.Main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = module.Main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)
module.Main.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

return module