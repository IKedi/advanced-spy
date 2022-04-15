local Gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/IKedi/advanced-spy/beta/gui.lua"))()
local ChatSystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/IKedi/advanced-spy/beta/messagesystem.lua"))()
Gui.load(game:HttpGet("https://api.github.com/repos/IKedi/advanced-spy/commits/beta")) --Loads save file thingy, i should move this to the gui module

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local PlrNum = 1
local ClosedState = 1 --2 fully open, 0 semi open, 1 closed

local EventBindings = {}
local PlayerList = {}

local ChatLogSize = 0

local filled = nil
local log = {}

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
	if obj:FindFirstChild("Fakt_AdvancedSpy") and obj ~= Gui.ScreenGui then
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
local function SetButtonVisibility()
	Gui.Previous.Visible = PlrNum ~= 1
	Gui.Next.Visible = PlrNum ~= #Players:GetPlayers()
end

local function SetCamera()
	SetButtonVisibility()

	for i, plr in ipairs(Players:GetPlayers()) do
		if i == PlrNum then
			Gui.SearchBox.Text = plr.Name
			
			if not plr.Character then
				plr.CharacterAdded:Wait()
			end

			workspace.Camera.CameraSubject = plr.Character.Humanoid

			local BoundFunction = EventBindings.BoundFunction

			if BoundFunction ~= nil then EventBindings.BoundFunction:Disconnect() end
			BoundFunction = plr.Character.Humanoid.Died:Connect(function() --TO DO fix this
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
	
	cl.CanvasSize = UDim2.new(0, 0, 0, size)
	
	if scroll then
		Gui.tween(cl, 0.1, {["CanvasPosition"] = Vector2.new(0, size)})
	end
end

local function getPlrColor(plr)
	if typeof(plr) == "Instance" then
		local Color = plr.TeamColor.Color

		if plr.Team == nil then
			Color = Gui.ComputeNameColor(plr.Name)
		end

		return Color3.new(Color.R * 255, Color.G * 255, Color.B * 255)
	elseif typeof(plr) == "string" then
		return Gui.ComputeNameColor(plr)
	end
end

local function CreateMsgObject(plr, msg, color)
	local ChatObject = Gui.ChatText:Clone()
	local EditedMessage = ""
	local UsernameText = ""

	log[plr.Name] = table.insert(log[plr.Name], ChatObject)

	--msg = msg:gsub("<", "&lt;") --TO DO
	--msg = msg:gsub(">", "&gt;")
	--msg = msg:gsub("\"", "&quot;")
	--msg = msg:gsub("'", "&apos;")
	msg = msg:gsub("&", "&amp;")

	local function ApplyText()
		if color then
			ChatObject.Text = UsernameText..string.format([[<font color="rgb(%s)">%s</font>]], tostring(color), EditedMessage)
		else
			ChatObject.Text = UsernameText..EditedMessage
		end
	end

	local function ShowName()
		if not Gui.DisplayNameonHover:GetAttribute("Checked") then return;end
		for i, v in ipairs(Players:GetPlayers()) do
			EditedMessage = msg:gsub(v.Name, ([[<font color="rgb(%s)"><i>%s</i></font>]]):format(tostring(getPlrColor(v)), v.Name))
		end
		
		UsernameText = string.format([[<font color="rgb(%s)">[%s]:</font> ]], tostring(getPlrColor(plr)), plr.Name)

		ApplyText()
	end

	local function ShowDisplayName()
		if not Gui.DisplayNameonHover:GetAttribute("Checked") then return;end
		for i, v in ipairs(Players:GetPlayers()) do
			EditedMessage = msg:gsub(v.Name, ([[<font color="rgb(%s)"><i>%s</i></font>]]):format(tostring(getPlrColor(v)), v.DisplayName))
		end
		
		UsernameText = string.format([[<font color="rgb(%s)">[%s]:</font> ]], tostring(getPlrColor(plr)), plr.DisplayName)

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

Gui.ClearButton.MouseButton1Click:Connect(function()
	for i, v in ipairs(Gui.ChatLog:GetChildren()) do
		if v ~= Gui.UIListLayout then
			v:Destroy()
		end
	end

	CalculateSize()
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

local function updateChatName(plr)
	for i, msgObject in ipairs(log[plr.Name]) do
		local msg = ""
		local name = ""

		for j, split_ in ipairs(msgObject.Text:split(":")) do
			if j ~= 1 then
				msg = msg..split_

				if j ~= #msgObject.Text:split(":") then
					msg = msg..":"
				end
			end
		end
		
		if Players:FindFirstChild(plr.Name) then --even though plr still exists it isn't in Players
			name = string.format([[<font color="rgb(%s)">[%s]:</font> ]], tostring(getPlrColor(plr)), plr.Name)
		else
			name = string.format([[<s><font color="rgb(%s)">[%s]:</font></s> ]], tostring(getPlrColor(plr.Name)), plr.Name)
		end

		msgObject.Text = name..msg
	end
end

local function PlayerAdded(plr)
	if log[plr.Name] == nil then
		log[plr.Name] = {}
	else
		updateChatName(plr)
	end

	plr.Chatted:Connect(function(msg)
		ChatSystem.OnChat(plr, msg, CreateMsgObject, Gui)
	end)

	plr:GetPropertyChangedSignal("Team"):Connect(function()
		updateChatName(plr)
	end)

	PlayerList[plr.Name] = plr.DisplayName
	SetButtonVisibility()
end
local function PlayerRemoving(plr)
	PlayerList[plr.Name] = nil --If we don't do this they will still appear on autofill thingy
	SetButtonVisibility()
end

for _, plr in ipairs(Players:GetPlayers()) do
	PlayerAdded(plr)
end

EventBindings.cgCD = game:GetService("CoreGui").ChildAdded:Connect(CheckNewGui)
EventBindings.uisIB = UserInputService.InputBegan:Connect(KeyPressed)
EventBindings.pPA = Players.PlayerAdded:Connect(PlayerAdded)
EventBindings.pPR = Players.PlayerRemoving:Connect(PlayerRemoving)

SetButtonVisibility()
ToggleGui()
