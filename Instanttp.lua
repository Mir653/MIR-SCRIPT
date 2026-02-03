-- Teleport GUI (Delta Mobile Compatible)

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "TeleportGUI"
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,260,0,180)
frame.Position = UDim2.new(0.5,-130,0.5,-90)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.Parent = gui
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,35)
title.Text = "Teleport GUI"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Parent = frame

local box = Instance.new("TextBox")
box.Size = UDim2.new(0.9,0,0,40)
box.Position = UDim2.new(0.05,0,0.3,0)
box.PlaceholderText = "Enter Place ID"
box.Text = ""
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundColor3 = Color3.fromRGB(50,50,50)
box.Parent = frame

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.9,0,0,40)
btn.Position = UDim2.new(0.05,0,0.65,0)
btn.Text = "Teleport"
btn.TextColor3 = Color3.new(1,1,1)
btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
btn.Parent = frame

-- Button logic
btn.MouseButton1Click:Connect(function()
    local placeId = tonumber(box.Text)
    if placeId then
        TeleportService:Teleport(placeId, player)
    else
        btn.Text = "Invalid Place ID"
        task.wait(1)
        btn.Text = "Teleport"
    end
end)
