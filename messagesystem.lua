local module = {}

module.OnChat = function(plr, msg, cmo, gui) --No WIP whisper detection for you :trolled:
    repeat wait() until cmo
    local a = string.sub(msg, 1, 1):match('%p') and string.sub(msg, 2, 2):match('%a') and string.len(msg) >= 5

	if a and Gui.RoleplayEmphasizer:GetAttribute("Checked") == true then
		cmo(plr, msg, Color3.new(255, 0, 0))
	else
		cmo(plr, msg)
	end
end

return module
