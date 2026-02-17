local remote = game.ReplicatedStorage:WaitForChild("MusicEvent")

local player = game.Players.LocalPlayer

-- Create GUI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "MusicGui"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.5, -125, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.8, 0, 0.3, 0)
box.Position = UDim2.new(0.1, 0, 0.2, 0)
box.PlaceholderText = "Enter Sound ID"
box.Text = ""
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundColor3 = Color3.fromRGB(50,50,50)

local play = Instance.new("TextButton", frame)
play.Size = UDim2.new(0.35, 0, 0.25, 0)
play.Position = UDim2.new(0.1, 0, 0.6, 0)
play.Text = "Play"

local stop = Instance.new("TextButton", frame)
stop.Size = UDim2.new(0.35, 0, 0.25, 0)
stop.Position = UDim2.new(0.55, 0, 0.6, 0)
stop.Text = "Stop"

play.MouseButton1Click:Connect(function()
	if box.Text ~= "" then
		remote:FireServer(box.Text)
	end
end)

stop.MouseButton1Click:Connect(function()
	remote:FireServer("") -- stops by replacing sound
end)
