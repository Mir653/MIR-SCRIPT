-- ServerScriptService

local BOOMBOX_ID = 212641536 -- Yellow Boombox
local ALLOWED_USER_ID = YOUR_USER_ID_HERE -- replace this

game.Players.PlayerAdded:Connect(function(player)
	if player.UserId ~= ALLOWED_USER_ID then return end

	player.CharacterAdded:Connect(function()
		local backpack = player:WaitForChild("Backpack")

		local asset = game:GetService("InsertService"):LoadAsset(BOOMBOX_ID)
		if asset then
			local tool = asset:FindFirstChildOfClass("Tool")
			if tool then
				tool.Parent = backpack
			end
		end
	end)
end)
