local Players = game:GetService("Players")

local function w(p, n)
    repeat wait() until p:FindFirstChild(n)
	return p:FindFirstChild(n)
end

if not Players.LocalPlayer then
    Players.PlayerAdded:Wait()
end

local chat = w(Players.LocalPlayer, "PlayerGui")
chat = w(chat, "Chat")
chat = w(chat, "Frame")
chat = w(chat, "ChatChannelParentFrame")
chat = w(chat, "Frame_MessageLogDisplay")
chat = w(chat, "Scroller")

local log = {}

chat.ChildAdded:Connect(function(instance)
    if instance.TextLabel.TextButton.Text == Players.LocalPlayer.Name then return;end

    local delBy = 0

    for i, v in instance.TextLabel.Text:gmatch("%s") do
        delBy += 1
    end

    table.insert(log, {
        instance = instance,
        message = instance.TextLabel.Text,
        player = instance.TextLabel.TextButton.Text
    })

    print(#instance.TextLabel.Text)

    wait(3)

    for i, v in ipairs(log) do
        if v.instance == instance then
            table.remove(log, i)
            print(string.format("%s said \"%s\" in private", v.player, v.message))
            break
        end
    end
end)

local function OnChat(plr, msg)
    if plr == Players.LocalPlayer then return;end

    local cor = coroutine.create(function()
        local function gay()
            local found = false

            for i, v in ipairs(log) do
                if v.message == msg and v.player == plr.Name then
                    table.remove(log, i)
                    break
                end
            end

            if found then
                print(string.format("%s said \"%s\"", plr.Name, msg))
            else
                wait()
                gay()
            end
        end

        gay()
    end)

    coroutine.resume(cor)
    wait(3)
    coroutine.yield(cor)
end

local function PlayerAdded(plr)
	plr.Chatted:Connect(function(msg)
		OnChat(plr, msg)
	end)
end

Players.PlayerAdded:Connect(PlayerAdded)

for _, plr in ipairs(Players:GetPlayers()) do
	PlayerAdded(plr)
end