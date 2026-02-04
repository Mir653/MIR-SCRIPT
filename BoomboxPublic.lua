-- Public Boombox (everyone can see & hear)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Create Boombox Part
local boomboxPart = Instance.new("Part")
boomboxPart.Size = Vector3.new(2,2,2)
boomboxPart.Position = hrp.Position + Vector3.new(0,3,0)
boomboxPart.Anchored = true
boomboxPart.CanCollide = false
boomboxPart.Name = "PublicBoombox"
boomboxPart.Parent = workspace

-- Billboard GUI for buttons
local gui = Instance.new("BillboardGui")
gui.Size = UDim2.new(0,200,0,100)
gui.Adornee = boomboxPart
gui.AlwaysOnTop = true
gui.Parent = boomboxPart

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1,0,1,0)
frame.BackgroundTransparency = 0.3
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.Text = "Public Boombox"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Parent = frame

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.9,0,0,40)
inputBox.Position = UDim2.new(0.05,0,0.35,0)
inputBox.PlaceholderText = "Enter Audio ID"
inputBox.TextColor3 = Color3.new(1,1,1)
inputBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
inputBox.Parent = frame

local playBtn = Instance.new("TextButton")
playBtn.Size = UDim2.new(0.9,0,0,35)
playBtn.Position = UDim2.new(0.05,0,0.75,0)
playBtn.Text = "PLAY AUDIO"
playBtn.TextColor3 = Color3.new(1,1,1)
playBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
playBtn.Parent = frame

-- Sound (server-visible)
local sound = Instance.new("Sound")
sound.Parent = boomboxPart
sound.Looped = true
sound.MaxDistance = 100
sound.RollOffMode = Enum.RollOffMode.Linear

-- Play audio when button clicked
playBtn.MouseButton1Click:Connect(function()
    local id = tonumber(inputBox.Text)
    if id then
        sound.SoundId = "rbxassetid://"..id
        sound:Play()
        playBtn.Text = "PLAYING..."
        task.wait(1)
        playBtn.Text = "PLAY AUDIO"
    else
        playBtn.Text = "INVALID ID"
        task.wait(1)
        playBtn.Text = "PLAY AUDIO"
    end
end)
