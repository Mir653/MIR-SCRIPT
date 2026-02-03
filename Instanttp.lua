-- Steal a Brainrot Safe TP (Delta Mobile)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")

local savedCFrame = nil
local tpActive = false

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotTP"
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,260,0,170)
frame.Position = UDim2.new(0.5,-130,0.5,-85)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Parent = gui
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,35)
title.Text = "Safe TP (Brainrot)"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Parent = frame

-- SET button
local setBtn = Instance.new("TextButton")
setBtn.Size = UDim2.new(0.9,0,0,45)
setBtn.Position = UDim2.new(0.05,0,0.3,0)
setBtn.Text = "SET LOCATION"
setBtn.TextColor3 = Color3.new(1,1,1)
setBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
setBtn.Parent = frame

-- TELEPORT button
local tpBtn = Instance.new("TextButton")
tpBtn.Size = UDim2.new(0.9,0,0,45)
tpBtn.Position = UDim2.new(0.05,0,0.6,0)
tpBtn.Text = "TELEPORT"
tpBtn.TextColor3 = Color3.new(1,1,1)
tpBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
tpBtn.Parent = frame

-- SET LOCATION
setBtn.MouseButton1Click:Connect(function()
    savedCFrame = hrp.CFrame
    setBtn.Text = "LOCATION SAVED"
    task.wait(1)
    setBtn.Text = "SET LOCATION"
end)

-- TELEPORT
tpBtn.MouseButton1Click:Connect(function()
    if savedCFrame then
        tpActive = true
        tpBtn.Text = "TELEPORTING..."
        -- Repeat forcing CFrame until position sticks
        local conn
        conn = RunService.RenderStepped:Connect(function()
            if tpActive and hrp then
                hrp.CFrame = savedCFrame
            else
                conn:Disconnect()
            end
        end)
        -- Stop after 2 seconds
        task.delay(2, function()
            tpActive = false
            tpBtn.Text = "TELEPORT"
        end)
    else
        tpBtn.Text = "NO LOCATION SET"
        task.wait(1)
        tpBtn.Text = "TELEPORT"
    end
end)
