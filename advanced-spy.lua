local Gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/IKedi/advanced-spy/master/gui.lua"))()
Gui.load() --Loads save file thingy, i should move this to the gui module

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local PlrNum = 1
local ClosedState = 1 --2 fully open, 0 semi open, 1 closed

local EventBindings = {}
local PlayerList = {}

local ChatLogSize = 0

local filled = nil

local function KillGui()
	for event, binding in pairs(EventBindings) do
		if binding ~= nil then
			pcall(function()
				binding:Disconnect()
			end)

			EventBindings[event] = nil
		end
	end

	Gui.ScreenGui.Parent = nil --For some fucking reason :Destroy() doesn't do shit
	Gui.ScreenGui:Destroy()
end

local function CheckNewGui(obj)
	if obj:FindFirstChild("Fakt_AdvancedSpy") and obj ~= Gui.ScrenGui then
		KillGui()
	end
end

local function ToggleGui()
	if ClosedState == 0 then
		Gui.Main.BackgroundTransparency = 1
		Gui.Next.BackgroundTransparency = 1
		Gui.Previous.BackgroundTransparency = 1
		Gui.Autofill.BackgroundTransparency = 1

		Gui.ExtraPanel.Visible = false
		Gui.SettingsPanel.Visible = false
		Gui.ChatLog.Visible = true

		ClosedState = 1
	elseif ClosedState == 1 then
		Gui.ScreenGui.Enabled = false

		ClosedState = 2
	else
		Gui.Main.BackgroundTransparency = 0.3
		Gui.Next.BackgroundTransparency = 0.2
		Gui.Previous.BackgroundTransparency = 0.2
		Gui.Autofill.BackgroundTransparency = 0.3

		Gui.ExtraPanel.Visible = true

		Gui.ScreenGui.Enabled = true

		ClosedState = 0
	end
end

local function KeyPressed(input)
	if input.KeyCode == Enum.KeyCode.F2 then
		ToggleGui()
	end
end

local function AutoFill(input)
	local FullNameList = {}

	for Name, DisplayName in pairs(PlayerList) do
		table.insert(FullNameList, Name)
		table.insert(FullNameList, DisplayName)
	end

	for i, Name in ipairs(FullNameList) do
		if Gui.SearchBox.Text:lower() == Name:sub(1, Gui.SearchBox.Text:len()):lower() then
			filled = Name
		end
	end
end

-----[[CAMERA]]-----
local function SetCamera()
	for i, plr in ipairs(Players:GetPlayers()) do
		if i == PlrNum then
			Gui.SearchBox.Text = plr.Name
			workspace.Camera.CameraSubject = plr.Character.Humanoid

			local BoundFunction = EventBindings.BoundFunction

			if BoundFunction ~= nil then EventBindings.BoundFunction:Disconnect() end
			BoundFunction = plr.Character.Humanoid.Died:Connect(function()
				plr.CharacterAdded:Wait()

				if BoundFunction == EventBindings.BoundFunction then --If player changes player during Wait()
					PlrNum = i
					SetCamera()
				end
			end)

			EventBindings.BoundFunction = BoundFunction
			break
		end
	end
end

local function SetPN(Input)
	for Name, DisplayName in pairs(PlayerList) do
		if Name == Input or DisplayName == Input then
			for i, v in ipairs(Players:GetPlayers()) do
				if v.Name == Name then
					PlrNum = i
					SetCamera()
					break
				end
			end
		end
	end

	return         
end

-----[[LOG CHAT]]-----

local function CalculateSize()
	local size = Gui.UIListLayout.AbsoluteContentSize.Y + 1
	local scroll = false
	
	local cl = Gui.ChatLog
	if (cl.CanvasPosition.Y - (cl.CanvasSize.Y.Offset - cl.AbsoluteSize.Y)) > -5 or (cl.CanvasSize.Y.Offset - cl.AbsoluteSize.Y) < 0 then
		--it prob wont go under -1 even in 4k monitors but just to be safe ¯\_(ツ)_/¯
		scroll = true
	end
	
	Gui.ChatLog.CanvasSize = UDim2.new(0, 0, 0, size)
	
	if scroll then
		Gui.tween(Gui.Chatlog, 0.1, {CanvasPosition = Vector2.new(0, size)})
	end
end

local function getPlrColor(plr)
	print(plr.Name)
	local Color = plr.TeamColor.Color

	if plr.Team == nil then
		Color = Gui.ComputeNameColor(plr.Name)
	end

	return Color3.new(Color.R * 255, Color.G * 255, Color.B * 255)
end

local function CreateMsgObject(plr, msg, color)
	local ChatObject = Gui.ChatText:Clone()
	local EditedMessage = ""
	local UsernameText = ""

	msg = msg:gsub("<", "&lt;")
	msg = msg:gsub(">", "&gt;")
	msg = msg:gsub("\"", "&quot;")
	msg = msg:gsub("'", "&apos;")
	msg = msg:gsub("&", "&amp;")

	local function ApplyText()
		if color then
			ChatObject.Text = UsernameText..string.format([[<font color="rgb(%s)">%s</font>]], tostring(color), EditedMessage)
		else
			ChatObject.Text = UsernameText..EditedMessage
		end
	end

	local function ShowName()
		for i, v in ipairs(Players:GetPlayers()) do
			EditedMessage = msg:gsub(v.Name, ([[<font color="rgb(%s)"><i>%s</i></font>]]):format(tostring(getPlrColor(v)), v.Name))
		end
		
		UsernameText = string.format([[<font color="rgb(%s)">[%s]</font>: ]], tostring(getPlrColor(plr)), plr.Name)

		ApplyText()
	end

	local function ShowDisplayName()
		for i, v in ipairs(Players:GetPlayers()) do
			EditedMessage = msg:gsub(v.Name, ([[<font color="rgb(%s)"><i>%s</i></font>]]):format(tostring(getPlrColor(v)), v.DisplayName))
		end
		
		UsernameText = string.format([[<font color="rgb(%s)">[%s]</font>: ]], tostring(getPlrColor(plr)), plr.DisplayName)

		ApplyText()
	end

	ChatObject.MouseEnter:Connect(ShowDisplayName)
	ChatObject.MouseLeave:Connect(ShowName)

	ChatObject.MouseButton1Click:Connect(function()
		Gui.SearchBox.Text = plr.Name
		SetPN(plr.Name)
		SetCamera()
	end)

	ShowName()

	ChatObject:GetPropertyChangedSignal("TextBounds"):Connect(CalculateSize)
	ChatObject.Parent = Gui.ChatLog
end

local function Chatted(plr, msg)
	local a = string.sub(msg, 1, 1):match('%p') and string.sub(msg, 2, 2):match('%a') and string.len(msg) >= 5

	if a and Gui.RoleplayEmphasizer:GetAttribute("Checked") == true then
		CreateMsgObject(plr, msg, Color3.new(255, 0, 0))
	else
		CreateMsgObject(plr, msg)
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

Gui.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
	if (Gui.SearchBox.Text == "" or Gui.SearchBox.Text == " ") then
		Gui.Autofill.Text = ""
	else
		AutoFill(Gui.SearchBox.Text)
		Gui.Autofill.Text = Gui.SearchBox.Text..filled:sub(#Gui.SearchBox.Text + 1)
	end
end)

Gui.SearchBox.FocusLost:Connect(function(Enter)
	if not Enter then return;end

	if (Gui.SearchBox.Text == "" or Gui.SearchBox.Text == " ") then
		PlrNum = 1
		SetCamera()
	else
		SetPN(filled)
	end
end)

Gui.SettingsButton.MouseButton1Click:Connect(function()
	Gui.save()

	if Gui.SettingsPanel.Visible then
		Gui.SettingsPanel.Visible = false
		Gui.ChatLog.Visible = true
	else
		Gui.SettingsPanel.Visible = true
		Gui.ChatLog.Visible = false
	end
end)
local function PlayerAdded(plr)
	EventBindings["Log_"..plr.Name] = plr.Chatted:Connect(function(msg)
		Chatted(plr, msg)
	end)

	PlayerList[plr.Name] = plr.DisplayName
end
local function PlayerRemoving(plr)
	EventBindings["Log_"..plr.Name]:Disconnect()
	EventBindings["Log_"..plr.Name] = nil

	PlayerList[plr.Name] = nil --If we don't do this they will still appear on autofill thingy
end

for _, plr in ipairs(Players:GetPlayers()) do
	EventBindings["Log_"..plr.Name] = plr.Chatted:Connect(function(msg)
		Chatted(plr, msg)
	end)

	PlayerList[plr.Name] = plr.DisplayName
end

EventBindings.cgCD = game:GetService("CoreGui").ChildAdded:Connect(CheckNewGui)
EventBindings.uisIB = UserInputService.InputBegan:Connect(KeyPressed)
EventBindings.pPA = Players.PlayerAdded:Connect(PlayerAdded)
EventBindings.pPR = Players.PlayerRemoving:Connect(PlayerRemoving)

ToggleGui()