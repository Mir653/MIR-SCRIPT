-- MIR / Delta Style Music Player (Executor Ready)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Remove old GUI if it exists
if player.PlayerGui:FindFirstChild("MusicPlayerGUI") then
    player.PlayerGui.MusicPlayerGUI:Destroy()
end

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MusicPlayerGUI"
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 260, 0, 140)
frame.Position = UDim2.new(0.5, -130, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Delta Music Player"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true

local box = Instance.new("TextBox")
box.Parent = frame
box.Size = UDim2.new(0, 220, 0, 30)
box.Position = UDim2.new(0, 20, 0, 40)
box.PlaceholderText = "Enter Audio ID"
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(45,45,45)
box.TextColor3 = Color3.fromRGB(255,255,255)

local playBtn = Instance.new("TextButton")
playBtn.Parent = frame
playBtn.Size = UDim2.new(0, 100, 0, 30)
playBtn.Position = UDim2.new(0, 20, 0, 85)
playBtn.Text = "Play"

local stopBtn = Instance.new("TextButton")
stopBtn.Parent = frame
stopBtn.Size = UDim2.new(0, 100, 0, 30)
stopBtn.Position = UDim2.new(0, 140, 0, 85)
stopBtn.Text = "Stop"

local sound

playBtn.MouseButton1Click:Connect(function()
    local id = tonumber(box.Text)
    if id then
        if sound then
            sound:Stop()
            sound:Destroy()
        end
        sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. id
        sound.Volume = 1
        sound.Looped = true
        sound.Parent = workspace
        sound:Play()
    end
end)

stopBtn.MouseButton1Click:Connect(function()
    if sound then
        sound:Stop()
        sound:Destroy()
        sound = nil
    end
end)
