-- FlyGUI.lua (Mobile / Delta Compatible)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Wait for character
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")

local flying = false
local speed = 60
local bv, bg

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "FlyGUI"
gui.Parent = game:GetService("CoreGui")

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0,150,0,50)
btn.Position = UDim2.new(0,20,0.8,0)
btn.Text = "FLY: OFF"
btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
btn.TextColor3 = Color3.fromRGB(255,255,255)
btn.Parent = gui

-- Toggle flying on button touch
btn.MouseButton1Click:Connect(function()
    flying = not flying
    btn.Text = flying and "FLY: ON" or "FLY: OFF"

    if flying then
        hum.PlatformStand = true
        bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(1e9,1e9,1e9)
        bv.Velocity = Vector3.zero
        bv.Parent = hrp

        bg = Instance.new("BodyGyro")
        bg.MaxTorque = Vector3.new(1e9,1e9,1e9)
        bg.P = 90000
        bg.CFrame = hrp.CFrame
        bg.Parent = hrp
    else
        hum.PlatformStand = false
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end
end)

-- Update loop to move the player while flying
RunService.RenderStepped:Connect(function()
    if flying and bv and bg then
        local cam = workspace.CurrentCamera
        bv.Velocity = cam.CFrame.LookVector * speed
        bg.CFrame = cam.CFrame
    end
end)
