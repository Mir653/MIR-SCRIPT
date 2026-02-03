-- Brainrot Speed GUI
-- Works while holding the brain

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

local speed = 50 -- default speed
local enabled = false

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BrainSpeedGUI"
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,280,0,180)
frame.Position = UDim2.new(0.5,-140,0.5,-90)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Parent = gui
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,35)
title.Text = "Brain Speed"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Parent = frame

-- Speed slider
local slider = Instance.new("TextBox")
slider.Size = UDim2.new(0.9,0,0,40)
slider.Position = UDim2.new(0.05,0,0.3,0)
slider.PlaceholderText = "Enter Speed (10-200)"
slider.Text = ""
slider.TextColor3 = Color3.new(1,1,1)
slider.BackgroundColor3 = Color3.fromRGB(50,50,50)
slider.Parent = frame

-- Enable / Disable button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.9,0,0,45)
toggleBtn.Position = UDim2.new(0.05,0,0.65,0)
toggleBtn.Text = "ENABLE SPEED"
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
toggleBtn.Parent = frame

-- Update speed from slider
slider.FocusLost:Connect(function(enter)
    local val = tonumber(slider.Text)
    if val and val >= 10 and val <= 200 then
        speed = val
    else
        slider.Text = ""
    end
end)

-- Toggle speed
toggleBtn.MouseButton1Click:Connect(function()
    enabled = not enabled
    toggleBtn.Text = enabled and "DISABLE SPEED" or "ENABLE SPEED"
end)

-- Speed logic (only while holding the brain)
RunService.RenderStepped:Connect(function()
    if not enabled then return end
    if not hrp then return end

    -- Check if player is holding the brain (adjust this path if needed)
    local holding = char:FindFirstChildWhichIsA("Tool") and char:FindFirstChildWhichIsA("Tool").Name:lower():find("brain")
    if holding then
        local dir = Vector3.zero
        local UIS = game:GetService("UserInputService")
        local cam = workspace.CurrentCamera

        if UIS:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end

        if dir.Magnitude > 0 then
            dir = dir.Unit * speed
            hrp.Velocity = Vector3.new(dir.X, hrp.Velocity.Y, dir.Z)
        end
    end
end)
