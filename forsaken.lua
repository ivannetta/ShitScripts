--!nocheck
if string.split(identifyexecutor() or "None", " ")[1] == "Xeno" then
	getgenv().WebSocket = nil
end

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "d0a352d474c8c4107c512d2421582c1c"
local sigmakey
local KeyCheckingButtonSex
local ApiStatusCode
local KEY_FILE = "fartkey.txt"
local STATUS_MESSAGES = {
	KEY_VALID = "Key valid! Loading script...",
	KEY_HWID_LOCKED = "HWID Mismatch. Please get a new Key!.",
	KEY_INCORRECT = "Key is wrong or Expired!",
}

local function SaveTheKeyPlease(key)
	writefile(KEY_FILE, key or "")
end

local function LoaderTheKeyPlease()
	if isfile(KEY_FILE) then
		return readfile(KEY_FILE)
	end
	SaveTheKeyPlease("")
	return ""
end

local function CheckiKey(key: any)
	if not key or key == "" then
		return { code = "KEY_INCORRECT", message = "Key cannot be empty" }
	end

	local success, status = pcall(function()
		return api.check_key(key)
	end)

	if not success then
		return { code = "ERROR", message = "Error occurred while checking key" }
	end

	if status.code == "KEY_VALID" then
		SaveTheKeyPlease(key)
		return status
	end
	return status
end

local function makeUI()
	local scringui = Instance.new("ScreenGui")
	scringui.Name = "KeySystem"
	scringui.Parent = game.CoreGui
	local blurEffect = Instance.new("BlurEffect")
	blurEffect.Size = 0
	blurEffect.Name = "KeySystemBlur"
	blurEffect.Parent = game:GetService("Lighting")
	local Background = Instance.new("Frame")
	Background.Name = "Background"
	Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Background.BackgroundTransparency = 0.5
	Background.Size = UDim2.new(1.5, 0, 1.5, 0)
	Background.Position = UDim2.new(0.5, 0, 0.3, 0)
	Background.AnchorPoint = Vector2.new(0.5, 0.5)
	Background.ZIndex = 10
	Background.Parent = scringui

	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(0, 0, 0, 0)
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(30, 35, 30)
	Frame.BorderSizePixel = 0
	Frame.ZIndex = 11
	Frame.Parent = scringui

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 8)
	UICorner.Parent = Frame

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.fromRGB(97, 255, 140)
	UIStroke.Thickness = 2
	UIStroke.Parent = Frame

	local TitleBar = Instance.new("Frame")
	TitleBar.Name = "TitleBar"
	TitleBar.BackgroundColor3 = Color3.fromRGB(40, 45, 40)
	TitleBar.Size = UDim2.new(1, 0, 0, 40)
	TitleBar.ZIndex = 12
	TitleBar.Parent = Frame

	local TitleUICorner = Instance.new("UICorner")
	TitleUICorner.CornerRadius = UDim.new(0, 8)
	TitleUICorner.Parent = TitleBar

	local CornerFix = Instance.new("Frame")
	CornerFix.Name = "CornerFix"
	CornerFix.BackgroundColor3 = Color3.fromRGB(40, 45, 40)
	CornerFix.BorderSizePixel = 0
	CornerFix.Position = UDim2.new(0, 0, 1, -10)
	CornerFix.Size = UDim2.new(1, 0, 0, 10)
	CornerFix.ZIndex = 12
	CornerFix.Parent = TitleBar

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, 0, 1, 0)
	Title.AnchorPoint = Vector2.new(0.5, 0.5)
	Title.Position = UDim2.new(0.5, 0, 0.5, 0)
	Title.Text = "Key Authentication"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1
	Title.TextSize = 16
	Title.Font = Enum.Font.GothamBold
	Title.ZIndex = 13
	Title.Parent = TitleBar

	local CloseButton = Instance.new("TextButton")
	CloseButton.Size = UDim2.new(0, 30, 0, 30)
	CloseButton.Position = UDim2.new(1, -35, 0, 5)
	CloseButton.AnchorPoint = Vector2.new(0, 0)
	CloseButton.Text = "X"
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
	CloseButton.BackgroundTransparency = 0.7
	CloseButton.BorderSizePixel = 0
	CloseButton.Font = Enum.Font.GothamBold
	CloseButton.TextSize = 14
	CloseButton.ZIndex = 14
	CloseButton.Parent = TitleBar
	CloseButton.AutoButtonColor = false

	local CloseCorner = Instance.new("UICorner")
	CloseCorner.CornerRadius = UDim.new(0, 6)
	CloseCorner.Parent = CloseButton

	CloseButton.MouseEnter:Connect(function()
		game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.2), { BackgroundTransparency = 0.3 }):Play()
	end)

	CloseButton.MouseLeave:Connect(function()
		game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.2), { BackgroundTransparency = 0.7 }):Play()
	end)

	CloseButton.Activated:Connect(function()
		game:GetService("TweenService"):Create(blurEffect, TweenInfo.new(0.3), { Size = 0 }):Play()

		local closeTween = game:GetService("TweenService"):Create(
			Frame,
			TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
			{ Size = UDim2.new(0, 0, 0, 0) }
		)
		closeTween:Play()

		closeTween.Completed:Connect(function()
			blurEffect:Destroy()
			scringui:Destroy()
		end)
	end)

	local KeyIcon = Instance.new("ImageLabel")
	KeyIcon.Name = "KeyIcon"
	KeyIcon.BackgroundTransparency = 1
	KeyIcon.AnchorPoint = Vector2.new(0.5, 0)
	KeyIcon.Position = UDim2.new(0.5, 0, 0, 60)
	KeyIcon.Size = UDim2.new(0, 48, 0, 48)
	KeyIcon.ZIndex = 12
	KeyIcon.Image = "rbxassetid://6031302931"
	KeyIcon.ImageColor3 = Color3.fromRGB(230, 255, 180)
	KeyIcon.Parent = Frame

	local TextBox = Instance.new("TextBox")
	TextBox.Size = UDim2.new(0.85, 0, 0, 40)
	TextBox.Position = UDim2.new(0.5, 0, 0, 130)
	TextBox.AnchorPoint = Vector2.new(0.5, 0)
	TextBox.Text = ""
	TextBox.PlaceholderText = "Enter Key Here"
	TextBox.Parent = Frame
	TextBox.BackgroundColor3 = Color3.fromRGB(60, 65, 60)
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BorderSizePixel = 0
	TextBox.Font = Enum.Font.Gotham
	TextBox.TextSize = 16
	TextBox.ClearTextOnFocus = true
	TextBox.ZIndex = 12

	local UICornerTextBox = Instance.new("UICorner")
	UICornerTextBox.CornerRadius = UDim.new(0, 6)
	UICornerTextBox.Parent = TextBox

	local StatusLabel = Instance.new("TextLabel")
	StatusLabel.Size = UDim2.new(0.85, 0, 0, 25)
	StatusLabel.Position = UDim2.new(0.5, 0, 1, -95)
	StatusLabel.AnchorPoint = Vector2.new(0.5, 0)
	StatusLabel.Text = "Enter your key to continue"
	StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	StatusLabel.BackgroundTransparency = 1
	StatusLabel.TextSize = 15
	StatusLabel.Font = Enum.Font.Gotham
	StatusLabel.ZIndex = 12
	StatusLabel.Parent = Frame

	local ButtonsFrame = Instance.new("Frame")
	ButtonsFrame.Name = "ButtonsFrame"
	ButtonsFrame.BackgroundTransparency = 1
	ButtonsFrame.AnchorPoint = Vector2.new(0.5, 1)
	ButtonsFrame.Position = UDim2.new(0.5, 0, 1, -20)
	ButtonsFrame.Size = UDim2.new(0.9, 0, 0, 50)
	ButtonsFrame.ZIndex = 12
	ButtonsFrame.Parent = Frame

	local listLayout = Instance.new("UIListLayout")
	listLayout.FillDirection = Enum.FillDirection.Horizontal
	listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	listLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	listLayout.Padding = UDim.new(0, 20)
	listLayout.Parent = ButtonsFrame

	local function MakeSigmaButton(text, color, hoverColor)
		local Button = Instance.new("TextButton")
		Button.Size = UDim2.new(0, 145, 0, 42)
		Button.Text = text
		Button.Parent = ButtonsFrame
		Button.BackgroundColor3 = color
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.BorderSizePixel = 0
		Button.Font = Enum.Font.GothamBold
		Button.TextSize = 15
		Button.ZIndex = 12
		Button.AutoButtonColor = false

		local UICornerButton = Instance.new("UICorner")
		UICornerButton.CornerRadius = UDim.new(0, 6)
		UICornerButton.Parent = Button

		Button.MouseEnter:Connect(function()
			game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), { BackgroundColor3 = hoverColor }):Play()
		end)

		Button.MouseLeave:Connect(function()
			game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), { BackgroundColor3 = color }):Play()
		end)

		return Button
	end

	KeyCheckingButtonSex = MakeSigmaButton("Check Key", Color3.fromRGB(80, 180, 100), Color3.fromRGB(100, 200, 120))
	KeyCheckingButtonSex.Activated:Connect(function()
		local key = TextBox.Text:gsub("%s+", "")
		StatusLabel.Text = "Checking key..."

		local status = CheckiKey(key)

		if status.code == "KEY_VALID" then
			StatusLabel.Text = STATUS_MESSAGES.KEY_VALID
			StatusLabel.TextColor3 = Color3.fromRGB(97, 255, 140)
			sigmakey = key
			ApiStatusCode = status.code
		else
			StatusLabel.Text = STATUS_MESSAGES[status.code] or status.message
			StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		end
	end)

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function SigmaDrag(input)
		local delta = input.Position - dragStart
		local targetPosition =
			UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService("TweenService")
			:Create(Frame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = targetPosition,
			})
			:Play()
	end

	TitleBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = Frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	TitleBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			SigmaDrag(input)
		end
	end)

	game:GetService("TweenService"):Create(blurEffect, TweenInfo.new(0.3), { Size = 10 }):Play()

	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local tween = game:GetService("TweenService"):Create(Frame, tweenInfo, { Size = UDim2.new(0, 380, 0, 280) })
	tween:Play()

	return scringui
end

local key = LoaderTheKeyPlease()
if key and key ~= "" then
	local status = CheckiKey(key)
	ApiStatusCode = status.code
	if status.code == "KEY_VALID" then
		sigmakey = key
		local function showScriptSelectionPopup()
			local selectionGui = Instance.new("ScreenGui")
			selectionGui.Name = "ScriptVersionSelector"
			selectionGui.Parent = game.CoreGui

			local frame = Instance.new("Frame")
			frame.Size = UDim2.new(0, 320, 0, 180)
			frame.Position = UDim2.new(0.5, 0, 0.5, 0)
			frame.AnchorPoint = Vector2.new(0.5, 0.5)
			frame.BackgroundColor3 = Color3.fromRGB(30, 35, 30)
			frame.BorderSizePixel = 0
			frame.Parent = selectionGui

			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0, 8)
			UICorner.Parent = frame

			local UIStroke = Instance.new("UIStroke")
			UIStroke.Color = Color3.fromRGB(97, 255, 140)
			UIStroke.Thickness = 2
			UIStroke.Parent = frame

			local title = Instance.new("TextLabel")
			title.Size = UDim2.new(1, -20, 0, 40)
			title.Position = UDim2.new(0.5, 0, 0, 10)
			title.AnchorPoint = Vector2.new(0.5, 0)
			title.Text = "Script Version Selection"
			title.TextColor3 = Color3.fromRGB(255, 255, 255)
			title.BackgroundTransparency = 1
			title.TextSize = 18
			title.Font = Enum.Font.GothamBold
			title.Parent = frame

			local message = Instance.new("TextLabel")
			message.Size = UDim2.new(1, -20, 0, 30)
			message.Position = UDim2.new(0.5, 0, 0, 50)
			message.AnchorPoint = Vector2.new(0.5, 0)
			message.Text = "Select which script version to load:"
			message.TextColor3 = Color3.fromRGB(200, 200, 200)
			message.BackgroundTransparency = 1
			message.TextSize = 14
			message.Font = Enum.Font.Gotham
			message.Parent = frame

			local buttonsFrame = Instance.new("Frame")
			buttonsFrame.Size = UDim2.new(1, -40, 0, 50)
			buttonsFrame.Position = UDim2.new(0.5, 0, 1, -70)
			buttonsFrame.AnchorPoint = Vector2.new(0.5, 0)
			buttonsFrame.BackgroundTransparency = 1
			buttonsFrame.Parent = frame

			local layout = Instance.new("UIListLayout")
			layout.FillDirection = Enum.FillDirection.Horizontal
			layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			layout.VerticalAlignment = Enum.VerticalAlignment.Center
			layout.Padding = UDim.new(0, 20)
			layout.Parent = buttonsFrame

			local function createButton(text, color, scriptId)
				local button = Instance.new("TextButton")
				button.Size = UDim2.new(0.45, 0, 0, 40)
				button.Text = text
				button.BackgroundColor3 = color
				button.TextColor3 = Color3.fromRGB(255, 255, 255)
				button.BorderSizePixel = 0
				button.Font = Enum.Font.GothamBold
				button.TextSize = 16
				button.Parent = buttonsFrame
				button.AutoButtonColor = false

				local UICornerButton = Instance.new("UICorner")
				UICornerButton.CornerRadius = UDim.new(0, 6)
				UICornerButton.Parent = button

				local hoverColor =
					Color3.new(math.min(color.R * 1.2, 1), math.min(color.G * 1.2, 1), math.min(color.B * 1.2, 1))

				button.MouseEnter:Connect(function()
					game:GetService("TweenService")
						:Create(button, TweenInfo.new(0.2), { BackgroundColor3 = hoverColor })
						:Play()
				end)

				button.MouseLeave:Connect(function()
					game:GetService("TweenService")
						:Create(button, TweenInfo.new(0.2), { BackgroundColor3 = color })
						:Play()
				end)

				button.Activated:Connect(function()
					api.script_id = scriptId
					selectionGui:Destroy()
					ApiStatusCode = "KEY_VALID"
				end)

				return button
			end

			local oldScriptId = "d0a352d474c8c4107c512d2421582c1c"
			local newScriptId = "ed420b2ef0304c876277e626fef234c6"

			createButton("Old Version", Color3.fromRGB(80, 100, 180), oldScriptId)
			createButton("New Version", Color3.fromRGB(80, 180, 100), newScriptId)
		end

		ApiStatusCode = "WAITING_FOR_SELECTION"

		showScriptSelectionPopup()
	else
		print(STATUS_MESSAGES[status.code] or status.message)
		makeUI()
	end	
else
	makeUI()
end

while ApiStatusCode ~= "KEY_VALID" do
	task.wait(0.1)
end

script_key = sigmakey
api.load_script()
-- Chatgpt generated ui im not doing allat thx
