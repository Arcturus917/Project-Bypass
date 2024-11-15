-- LocalScript in StarterPlayer > StarterPlayerScripts
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeyGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create Frame
local frame = Instance.new("Frame")
frame.Name = "KeyFrame"
frame.Size = UDim2.new(0, 350, 0, 180)
frame.Position = UDim2.new(0.5, -175, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create UIGradient for Frame (Black-to-Dark-Gray)
local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
}
uiGradient.Rotation = 90
uiGradient.Parent = frame

-- Create UICorner for rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame

-- Create Title TextLabel
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
titleLabel.Position = UDim2.new(0, 0, 0.2, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Enter Access Key"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Parent = frame

-- Create TextBox for Key Input
local keyInput = Instance.new("TextBox")
keyInput.Name = "KeyInput"
keyInput.Size = UDim2.new(0.8, 0, 0.2, 0)
keyInput.Position = UDim2.new(0.1, 0, 0.5, 0)
keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyInput.BorderSizePixel = 0
keyInput.Text = ""
keyInput.PlaceholderText = "Enter Key Here"
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextScaled = true
keyInput.ClearTextOnFocus = false
keyInput.Parent = frame

-- Create Enter Button
local enterButton = Instance.new("TextButton")
enterButton.Name = "EnterButton"
enterButton.Size = UDim2.new(0.8, 0, 0.2, 0)
enterButton.Position = UDim2.new(0.1, 0, 0.75, 0)
enterButton.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
enterButton.BorderSizePixel = 0
enterButton.Text = "Enter"
enterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
enterButton.TextScaled = true
enterButton.Parent = frame

-- Create Feedback Label
local feedbackMessage = Instance.new("TextLabel")
feedbackMessage.Name = "FeedbackMessage"
feedbackMessage.Size = UDim2.new(1, 0, 0.2, 0)
feedbackMessage.Position = UDim2.new(0, 0, 1.05, 0)
feedbackMessage.BackgroundTransparency = 1
feedbackMessage.Text = ""
feedbackMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackMessage.TextScaled = true
feedbackMessage.Parent = frame

-- Define the only valid key
local validKey = "Bypass"
local fileName = "BypassKey.cb"

-- Function to check if the key was saved
local function checkSavedKey()
    if isfile(fileName) then
        local savedKey = readfile(fileName)
        if savedKey == validKey then
            return true
        end
    end
    return false
end

-- Function to save the key
local function saveKey()
    if not isfile(fileName) then
        writefile(fileName, validKey)
    end
end

-- Check if the key is already validated
if checkSavedKey() then
    feedbackMessage.Text = "Access Granted!"
    feedbackMessage.TextColor3 = Color3.fromRGB(0, 255, 0)
    wait(1)
    screenGui:Destroy()

    local success, errorMessage = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Arcturus917/Project-Bypass/refs/heads/main/Main.lua"))()
    end)

    if not success then
        warn("Error executing loadstring: " .. errorMessage)
    end
    return
end

-- Function to handle the button click
local function onSubmit()
    local enteredKey = keyInput.Text

    if enteredKey == validKey then
        feedbackMessage.Text = "Access Granted!"
        feedbackMessage.TextColor3 = Color3.fromRGB(0, 255, 0)
        saveKey()
        wait(1)
        screenGui:Destroy()

        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Arcturus917/Project-Bypass/refs/heads/main/Main.lua"))()
        end)

        if not success then
            warn("Error executing loadstring: " .. errorMessage)
        end
    else
        feedbackMessage.Text = "Invalid Key! Try Again."
        feedbackMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end

-- Connect the button click to the function
enterButton.MouseButton1Click:Connect(onSubmit)
