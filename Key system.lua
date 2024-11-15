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
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create UICorner for rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame

-- Create Title TextLabel
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Enter Access Key"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Parent = frame

-- Create TextBox for Key Input
local keyInput = Instance.new("TextBox")
keyInput.Name = "KeyInput"
keyInput.Size = UDim2.new(0.8, 0, 0.3, 0)
keyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyInput.BorderSizePixel = 0
keyInput.Text = ""
keyInput.PlaceholderText = "Enter Key Here"
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextScaled = true
keyInput.ClearTextOnFocus = false
keyInput.Parent = frame

-- Create UICorner for rounded corners on TextBox
local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 5)
keyInputCorner.Parent = keyInput

-- Create Submit Button
local submitButton = Instance.new("TextButton")
submitButton.Name = "SubmitButton"
submitButton.Size = UDim2.new(0.8, 0, 0.3, 0)
submitButton.Position = UDim2.new(0.1, 0, 0.75, 0)
submitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
submitButton.BorderSizePixel = 0
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.TextScaled = true
submitButton.Parent = frame

-- Create UICorner for rounded corners on Button
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 5)
buttonCorner.Parent = submitButton

-- Create Feedback Label
local feedbackMessage = Instance.new("TextLabel")
feedbackMessage.Name = "FeedbackMessage"
feedbackMessage.Size = UDim2.new(1, 0, 0.2, 0)
feedbackMessage.Position = UDim2.new(0, 0, 1, 0)
feedbackMessage.BackgroundTransparency = 1
feedbackMessage.Text = ""
feedbackMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackMessage.TextScaled = true
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
        
        -- Add your desired actions here (e.g., teleport, unlock feature)
        print("Valid key entered: Access granted.")
    else
        feedbackMessage.Text = "Invalid Key! Try Again."
        feedbackMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
        print("Invalid key entered: Access denied.")
    end
end

-- Connect the button click to the function
submitButton.MouseButton1Click:Connect(onSubmit)
