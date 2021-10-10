local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/IKedi/advanced-spy/main/gui.lua"))()
local Message = loadstring(game:HttpGet("https://raw.githubusercontent.com/IKedi/advanced-spy/main/message.lua"))()

local PlrNum = 1
local ClosedState = 1 --2 fully open, 0 semi open, 1 closed

local EventBindings = {}

local function KillGui()
	for i, v in ipairs(EventBindings) do
		if v ~= nil then
			pcall(function()
				v:Disconnect()
			end)
		end
	end

	Gui.AdvancedSpy:Destroy()
end

local function CheckNewGui(obj)
	if obj:IsA("ScreenGui") and obj.Name == "Fakt_AdvancedSpy" then
		KillGui()
	end
end

local function ToggleGui()
	if ClosedState == 0 then
		Gui.Main.BackgroundTransparency = 1
		Gui.Next.BackgroundTransparency = 1
		Gui.Previous.BackgroundTransparency = 1
		Gui.SearchBox.BackgroundTransparency = 1

		Gui.ExtraPanel.Visible = false
		Gui.SettingsPanel.Visible = false
		Gui.ChatLog.Visible = true

		ClosedState = 1
	elseif ClosedState == 1 then
		Gui.AdvancedSpy.Enabled = false

		ClosedState = 2
	else
		Gui.Main.BackgroundTransparency = 0.3
		Gui.Next.BackgroundTransparency = 0.2
		Gui.Previous.BackgroundTransparency = 0.2
		Gui.SearchBox.BackgroundTransparency = 0.3

		Gui.ExtraPanel.Visible = true

		Gui.AdvancedSpy.Enabled = true

		ClosedState = 0
	end
end

local function KeyPressed(input)
	if input.KeyCode == Enum.KeyCode.F2 then
		ToggleGui()
	end
end

-----[[CAMERA]]-----

local function SetCamera()
	for i, v in ipairs(Players:GetPlayers()) do
		if i == PlrNum then
			Gui.SearchBox.Text = v.Name

			workspace.Camera.CameraSubject = v.Character.Humanoid

			local BoundFunction =  EventBindings.BoundFunction

			if BoundFunction ~= nil then BoundFunction:Disconnect() end
			BoundFunction = v.Character.Humanoid.Died:Connect(function()
				PlrNum = 1
				SetCamera()
			end)

			break
		end
	end
end

local function SetPN(Name)
	for i, v in ipairs(Players:GetPlayers()) do
		if v.Name == Name then
			PlrNum = i
			SetCamera()
			break
		end
	end
end

-----[[LOG CHAT]]-----

local function CreateMsgObject(plr, msg, ispublic)
	local ChatObject = Gui.ChatText:Clone()

	local Text = string.format([[<font color= "rgb(225, 255, 10)">[%s]</font>: ]], plr.Name)

	if ispublic then
		ChatObject.Text = Text..msg
	else
		ChatObject.Text = Text..string.format([[<font color= "rgb(255, 100, 100)">%s</font>]], msg)
	end

	ChatObject.MouseButton1Click:Connect(function()
		Gui.SearchBox.Text = plr.Name
		SetPN(plr.Name)
		SetCamera()
	end)

	ChatObject.Parent = Gui.ChatLog
	Gui.ChatLog.CanvasPosition = Vector2.new(0, 9999999999) -- waah
end

local function Chatted(plr, msg)
	if Gui.WhisperDetectionCheckBox:GetAttribute("Checked") then
		local public = Message.IsPublic(plr, msg)

		if Gui.WhisperOnlyCheckBox:GetAttribute("Checked") then
			if not public then
				CreateMsgObject(plr, msg, false)
			end
		else
			CreateMsgObject(plr, msg, public)
		end
	else
		CreateMsgObject(plr, msg, true)
	end
end

--[[EVENT HANDLERS]]--

Gui.Previous.MouseButton1Down:Connect(function()
	if PlrNum > 1 then
		PlrNum = PlrNum - 1
		SetCamera()
	end
end)

Gui.Next.MouseButton1Down:Connect(function()
	if PlrNum < #Players:GetPlayers() then
		PlrNum = PlrNum + 1
		SetCamera()
	end
end)

Gui.SearchBox.FocusLost:Connect(function(Enter)
	if not Enter then return;end
	if Gui.SearchBox.Text == "" then
		workspace.Camera.CameraSubject = Players.LocalPlayer.Character.Humanoid
	end

	local matches = {}

	for i, v in pairs(Players:GetPlayers()) do
		if Gui.SearchBox.Text:lower() == v.Name:sub(1, Gui.SearchBox.Text:len()):lower() then
			SetPN(v.Name)
		end
	end
end)

Gui.SettingsButton.MouseButton1Click:Connect(function()
	if Gui.SettingsPanel.Visible then
		Gui.SettingsPanel.Visible = false
		Gui.ChatLog.Visible = true
	else
		Gui.SettingsPanel.Visible = true
		Gui.ChatLog.Visible = false
	end
end)

Gui.MessageTimeoutBox.FocusLost:Connect(function()
	local input = tonumber(Gui.MessageTimeoutBox.Text)

	if input ~= nil then
		Message.MessageTimeout = input
	else
		Gui.MessageTimeoutBox.Text = "5"
		Message.MessageTimeout = 5
	end
end)

local function PlayerAdded(plr)
	EventBindings["Log_"..plr.Name] = plr.Chatted:Connect(function(msg)
		Chatted(plr, msg)
	end)
end

for _, plr in ipairs(Players:GetPlayers()) do
	EventBindings["Log_"..plr.Name] = plr.Chatted:Connect(function(msg)
		Chatted(plr, msg)
	end)
end

EventBindings.mmCA = Message.ChildAddedEvent
EventBindings.cgCD = game:GetService("CoreGui").ChildAdded:Connect(CheckNewGui)
EventBindings.uisIB = UserInputService.InputBegan:Connect(KeyPressed)
EventBindings.pPA = Players.PlayerAdded:Connect(PlayerAdded)

ToggleGui()
