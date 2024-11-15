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
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create UIGradient for Frame
local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))
}
uiGradient.Rotation = 90
uiGradient.Parent = frame

-- Create UICorner for rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame

-- Add UIStroke for white outline
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Thickness = 1
uiStroke.Parent = frame

-- Create "Key System" label (Top Left)
local keySystemLabel = Instance.new("TextLabel")
keySystemLabel.Name = "KeySystemLabel"
keySystemLabel.Size = UDim2.new(0.2, 0, 0.2, 0)
keySystemLabel.Position = UDim2.new(0, 10, 0, 5)
keySystemLabel.BackgroundTransparency = 1
keySystemLabel.Text = "Key System"
keySystemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keySystemLabel.TextScaled = true
keySystemLabel.Font = Enum.Font.SourceSansBold
keySystemLabel.TextXAlignment = Enum.TextXAlignment.Left
keySystemLabel.Parent = frame

-- Create "V1" label (Top Right)
local versionLabel = Instance.new("TextLabel")
versionLabel.Name = "VersionLabel"
versionLabel.Size = UDim2.new(0.1, 0, 0.2, 0)
versionLabel.Position = UDim2.new(0.9, -10, 0, 5)
versionLabel.BackgroundTransparency = 1
versionLabel.Text = "V1"
versionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
versionLabel.TextScaled = true
versionLabel.Font = Enum.Font.SourceSansBold
versionLabel.TextXAlignment = Enum.TextXAlignment.Right
versionLabel.Parent = frame

-- Create Title TextLabel
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
titleLabel.Position = UDim2.new(0, 0, 0.2, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Enter Access Key"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.SourceSans
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
keyInput.Font = Enum.Font.SourceSans
keyInput.Parent = frame

-- Create UICorner for rounded corners on TextBox
local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 5)
keyInputCorner.Parent = keyInput

-- Add UIStroke for white outline on TextBox
local keyInputStroke = Instance.new("UIStroke")
keyInputStroke.Color = Color3.fromRGB(255, 255, 255)
keyInputStroke.Thickness = 1
keyInputStroke.Parent = keyInput

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
enterButton.Font = Enum.Font.SourceSansBold
enterButton.Parent = frame

-- Create UICorner for rounded corners on Enter Button
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 5)
buttonCorner.Parent = enterButton

-- Add UIStroke for white outline on Button
local enterButtonStroke = Instance.new("UIStroke")
enterButtonStroke.Color = Color3.fromRGB(255, 255, 255)
enterButtonStroke.Thickness = 1
enterButtonStroke.Parent = enterButton

-- Create Feedback Label
local feedbackMessage = Instance.new("TextLabel")
feedbackMessage.Name = "FeedbackMessage"
feedbackMessage.Size = UDim2.new(1, 0, 0.2, 0)
feedbackMessage.Position = UDim2.new(0, 0, 1.05, 0)
feedbackMessage.BackgroundTransparency = 1
feedbackMessage.Text = ""
feedbackMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackMessage.TextScaled = true
feedbackMessage.Font = Enum.Font.SourceSans
feedbackMessage.Parent = frame

-- Define the only valid key
local validKey = "Bypass"

-- Function to handle the button click
local function onSubmit()
    local enteredKey = keyInput.Text

    if enteredKey == validKey then
        feedbackMessage.Text = "Access Granted!"
        feedbackMessage.TextColor3 = Color3.fromRGB(0, 255, 0)

        -- Hide the GUI after successful entry
        wait(1)
        screenGui:Destroy()

        -- Execute the loadstring if the key is correct
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Arcturus917/Project-Bypass/refs/heads/main/Main.lua"))()
        end)

        if not success then
            warn("Error executing loadstring: " .. errorMessage)
        else
            print("Script executed successfully.")
        end
    else
        feedbackMessage.Text = "Invalid Key! Try Again."
        feedbackMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
        print("Invalid key entered: Access denied.")
    end
end

-- Connect the button click to the function
enterButton.MouseButton1Click:Connect(onSubmit)
