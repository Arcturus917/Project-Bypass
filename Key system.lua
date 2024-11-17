-- LocalScript in StarterPlayer > StarterPlayerScripts

-- Fetches the Players service to get the local player
local Players = game:GetService("Players")
-- Fetches ReplicatedStorage for potential server communication (not used here, but good for future reference)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Gets the LocalPlayer, the player currently running this script
local player = Players.LocalPlayer

-- Create a ScreenGui which is a container for UI elements
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeyGui" -- Setting a name for organizational purposes
screenGui.Parent = player:WaitForChild("PlayerGui") -- Waits for PlayerGui to ensure it exists and then sets ScreenGui as its child

-- Create a Frame to hold all the UI elements
local frame = Instance.new("Frame")
frame.Name = "KeyFrame"
-- Setting size and position; 0, 350 is width and height in pixels; 0.5 centers it on the screen, with offset adjustments
frame.Size = UDim2.new(0, 350, 0, 180)
frame.Position = UDim2.new(0.5, -175, 0.5, -90)
-- Setting background color to a dark shade
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
-- Border size set to 0 for a cleaner look
frame.BorderSizePixel = 0
frame.Parent = screenGui -- Attaching the Frame to ScreenGui

-- Create a UIGradient for a subtle gradient effect
local uiGradient = Instance.new("UIGradient")
-- Sets gradient colors, making it slightly lighter at the top
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))
}
-- Rotates the gradient vertically
uiGradient.Rotation = 90
uiGradient.Parent = frame

-- Adding rounded corners using UICorner
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10) -- Sets the radius of rounded corners
uiCorner.Parent = frame

-- Adding a white outline using UIStroke
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 255, 255) -- Sets the stroke color to white
uiStroke.Thickness = 1 -- Sets the thickness of the outline
uiStroke.Parent = frame

-- Create a "Key System" label at the top left
local keySystemLabel = Instance.new("TextLabel")
keySystemLabel.Name = "KeySystemLabel"
keySystemLabel.Size = UDim2.new(0.2, 0, 0.2, 0)
keySystemLabel.Position = UDim2.new(0, 10, 0, 5)
keySystemLabel.BackgroundTransparency = 1 -- Makes background transparent
keySystemLabel.Text = "Key System"
keySystemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keySystemLabel.TextScaled = true -- Automatically scales text to fit
keySystemLabel.Font = Enum.Font.SourceSansBold -- Sets the font style
keySystemLabel.TextXAlignment = Enum.TextXAlignment.Left -- Aligns text to the left
keySystemLabel.Parent = frame

-- Create a version label at the top right
local versionLabel = Instance.new("TextLabel")
versionLabel.Name = "VersionLabel"
versionLabel.Size = UDim2.new(0.1, 0, 0.2, 0)
versionLabel.Position = UDim2.new(0.9, -10, 0, 5)
versionLabel.BackgroundTransparency = 1
versionLabel.Text = "V1" -- Placeholder for version; can be updated
versionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
versionLabel.TextScaled = true
versionLabel.Font = Enum.Font.SourceSansBold
versionLabel.TextXAlignment = Enum.TextXAlignment.Right
versionLabel.Parent = frame

-- Create the main title TextLabel
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

-- Create a TextBox for the user to input their key
local keyInput = Instance.new("TextBox")
keyInput.Name = "KeyInput"
keyInput.Size = UDim2.new(0.8, 0, 0.2, 0)
keyInput.Position = UDim2.new(0.1, 0, 0.5, 0)
keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Dark background for contrast
keyInput.BorderSizePixel = 0
keyInput.Text = "" -- Empty initially
keyInput.PlaceholderText = "Enter Key Here" -- Hint text
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextScaled = true
keyInput.ClearTextOnFocus = false -- Keeps text if user clicks away
keyInput.Font = Enum.Font.SourceSans
keyInput.Parent = frame

-- Rounded corners for the TextBox
local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 5)
keyInputCorner.Parent = keyInput

-- White outline for the TextBox
local keyInputStroke = Instance.new("UIStroke")
keyInputStroke.Color = Color3.fromRGB(255, 255, 255)
keyInputStroke.Thickness = 1
keyInputStroke.Parent = keyInput

-- Create the "Enter" button for submitting the key
local enterButton = Instance.new("TextButton")
enterButton.Name = "EnterButton"
enterButton.Size = UDim2.new(0.8, 0, 0.2, 0)
enterButton.Position = UDim2.new(0.1, 0, 0.75, 0)
enterButton.BackgroundColor3 = Color3.fromRGB(0, 170, 127) -- Green for a positive action
enterButton.BorderSizePixel = 0
enterButton.Text = "Enter"
enterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
enterButton.TextScaled = true
enterButton.Font = Enum.Font.SourceSansBold
enterButton.Parent = frame

-- Rounded corners for the Enter button
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 5)
buttonCorner.Parent = enterButton

-- White outline for the Enter button
local enterButtonStroke = Instance.new("UIStroke")
enterButtonStroke.Color = Color3.fromRGB(255, 255, 255)
enterButtonStroke.Thickness = 1
enterButtonStroke.Parent = enterButton

-- Create a feedback label to display messages
local feedbackMessage = Instance.new("TextLabel")
feedbackMessage.Name = "FeedbackMessage"
feedbackMessage.Size = UDim2.new(1, 0, 0.2, 0)
feedbackMessage.Position = UDim2.new(0, 0, 1.05, 0)
feedbackMessage.BackgroundTransparency = 1
feedbackMessage.Text = "" -- Initially empty
feedbackMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackMessage.TextScaled = true
feedbackMessage.Font = Enum.Font.SourceSans
feedbackMessage.Parent = frame

-- Define the correct key for access
local validKey = "Bypass"

-- Function that runs when the "Enter" button is clicked
local function onSubmit()
    local enteredKey = keyInput.Text

    if enteredKey == validKey then
        feedbackMessage.Text = "Access Granted!"
        feedbackMessage.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green for success
        wait(1)
        screenGui:Destroy() -- Closes the GUI

        -- Attempt to execute the script from a URL
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
        feedbackMessage.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red for failure
        print("Invalid key entered: Access denied.")
    end
end

-- Connects the button click event to the onSubmit function
enterButton.MouseButton1Click:Connect(onSubmit)
