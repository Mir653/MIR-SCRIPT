local frame = script.Parent
local audioInput = frame:WaitForChild("AudioInput")
local playButton = frame:WaitForChild("PlayButton")
local stopButton = frame:WaitForChild("StopButton")

local sound -- will hold our Sound object

-- Function to play music by ID
local function playMusic(audioId)
    -- Stop previous sound if exists
    if sound then
        sound:Stop()
        sound:Destroy()
    end

    -- Create new Sound object
    sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. audioId
    sound.Volume = 1
    sound.Looped = true
    sound.Parent = workspace
    sound:Play()
end

-- Button click events
playButton.MouseButton1Click:Connect(function()
    local id = audioInput.Text
    if tonumber(id) then
        playMusic(id)
    else
        warn("Invalid Audio ID!")
    end
end)

stopButton.MouseButton1Click:Connect(function()
    if sound then
        sound:Stop()
        sound:Destroy()
        sound = nil
    end
end)
