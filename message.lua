local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local module = {}

module.MessageTimeout = 5

--Get chat---------------------------
local function w(p, n)
	return p:WaitForChild(n)
end

local chat = w(Players.LocalPlayer, "PlayerGui")
chat = w(chat, "Chat")
chat = w(chat, "Frame")
chat = w(chat, "ChatChannelParentFrame")
chat = w(chat, "Frame_MessageLogDisplay")
chat = w(chat, "Scroller")
------------------------------------

local chatArray = {}
local chatLoading = true

module.ChildAddedEvent = chat.ChildAdded:Connect(function(msgobject)
	local sender = nil

	for i, v in ipairs(msgobject.TextLabel:GetChildren()) do
		if v:IsA("TextButton") and v.Text:sub(1, 1) == "[" then
			sender = v
		end
	end

	if sender then
		local filteredName = sender.Text:sub(2, #sender.Text - 2)
		local startTime = tick()
		local abort = false

		chatLoading = true

		repeat 
			RunService.RenderStepped:Wait()
			if (tick() - startTime) > module.MessageTimeout then abort = true;end
		until #msgobject.TextLabel.Text:gsub(" ", ""):gsub("_", "") > 0 or abort
		chatLoading = false
		if abort then return;end

		local filteredMessage = msgobject.TextLabel.Text:gsub(" ", "")
		local array = chatArray[filteredName]

		if array == nil then
			array = {}
		end

		table.insert(array, filteredMessage)
		chatArray[filteredName] = array
	end
end)

module.IsPublic = function(plr, msg)
	repeat RunService.RenderStepped:Wait()
	until not chatLoading

	local StartTime = tick()
	local found = false

	local ca_msg = chatArray[plr.DisplayName]
	local g_msg = msg:gsub(" ", "")

	chatLoading = true --So we dont have to add wait() in front of this function

	repeat --TBH i don't know how necessary this is but yeah i wrote this part like 2 days ago
		RunService.RenderStepped:Wait() --and i won't remove it just in case the one on the top doesnt cover this

		if ca_msg[#ca_msg] == g_msg then
			found = true
		end

	until (tick() - StartTime) > module.MessageTimeout or found

	return found
end

return module
