-- LocalScript in StarterPlayer > StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeyGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 200)  -- Rectangle shape
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -100) -- Centered
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Dark gray close to black
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Add UI Stroke (Outline)
local frameStroke = Instance.new("UIStroke")
frameStroke.Thickness = 2
frameStroke.Color = Color3.fromRGB(255, 255, 255)  -- Thin white outline
frameStroke.Parent = mainFrame

-- "Key System" Label (Top Left)
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(0.5, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 5)  -- Top left corner with padding
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Key System"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainFrame

-- "V 1" Label (Top Right)
local versionLabel = Instance.new("TextLabel")
versionLabel.Name = "Version"
versionLabel.Size = UDim2.new(0.5, -10, 0.2, 0)
versionLabel.Position = UDim2.new(0.5, 0, 0, 5)  -- Top right corner with padding
versionLabel.BackgroundTransparency = 1
versionLabel.Text = "V 1"
versionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
versionLabel.TextScaled = true
versionLabel.TextXAlignment = Enum.TextXAlignment.Right
versionLabel.Parent = mainFrame

-- Create TextBox for Key Input
local keyInput = Instance.new("TextBox")
keyInput.Name = "KeyInput"
keyInput.Size = UDim2.new(0.9, 0, 0.3, 0)
keyInput.Position = UDim2.new(0.05, 0, 0.35, 0)
keyInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)  -- Slightly lighter gray for contrast
keyInput.BorderSizePixel = 0
keyInput.Text = ""
keyInput.PlaceholderText = "Enter Key Here"
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextScaled = true
keyInput.ClearTextOnFocus = false
keyInput.Parent = mainFrame

-- Add UI Stroke to TextBox
local inputStroke = Instance.new("UIStroke")
inputStroke.Thickness = 1.5
inputStroke.Color = Color3.fromRGB(255, 255, 255)
inputStroke.Parent = keyInput

-- Create Enter Button
local enterButton = Instance.new("TextButton")
enterButton.Name = "EnterButton"
enterButton.Size = UDim2.new(0.9, 0, 0.3, 0)
enterButton.Position = UDim2.new(0.05, 0, 0.7, 0)
enterButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)  -- Slightly lighter gray for the button
enterButton.BorderSizePixel = 0
enterButton.Text = "Enter"
enterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
enterButton.TextScaled = true
enterButton.Parent = mainFrame

-- Add UI Stroke to Enter Button
local buttonStroke = Instance.new("UIStroke")
buttonStroke.Thickness = 1.5
buttonStroke.Color = Color3.fromRGB(255, 255, 255)
buttonStroke.Parent = enterButton

-- Create Feedback Label
local feedbackMessage = Instance.new("TextLabel")
feedbackMessage.Name = "FeedbackMessage"
feedbackMessage.Size = UDim2.new(1, 0, 0.2, 0)
feedbackMessage.Position = UDim2.new(0, 0, 1, 0)
feedbackMessage.BackgroundTransparency = 1
feedbackMessage.Text = ""
feedbackMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackMessage.TextScaled = true
feedbackMessage.Parent = mainFrame

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
