local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "d0632c30c8af0316aae11552dcb2a21d"
local sigmakey
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

local function CheckiKey(key)
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
	KeyIcon.Image = "rbxassetid://6031302931" -- Key icon
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

	-- Loading Bar Container
	local LoadingBarContainer = Instance.new("Frame")
	LoadingBarContainer.Size = UDim2.new(0.85, 0, 0, 10)
	LoadingBarContainer.Position = UDim2.new(0.5, 0, 1, -65)
	LoadingBarContainer.AnchorPoint = Vector2.new(0.5, 0)
	LoadingBarContainer.BackgroundColor3 = Color3.fromRGB(50, 55, 50)
	LoadingBarContainer.BorderSizePixel = 0
	LoadingBarContainer.ZIndex = 12
	LoadingBarContainer.Visible = false
	LoadingBarContainer.Parent = Frame

	local UICornerLoading = Instance.new("UICorner")
	UICornerLoading.CornerRadius = UDim.new(0, 4)
	UICornerLoading.Parent = LoadingBarContainer

	-- Loading Bar Fill
	local LoadingBarFill = Instance.new("Frame")
	LoadingBarFill.Size = UDim2.new(0, 0, 1, 0)
	LoadingBarFill.BackgroundColor3 = Color3.fromRGB(97, 255, 140)
	LoadingBarFill.BorderSizePixel = 0
	LoadingBarFill.ZIndex = 13
	LoadingBarFill.Parent = LoadingBarContainer

	local UICornerFill = Instance.new("UICorner")
	UICornerFill.CornerRadius = UDim.new(0, 4)
	UICornerFill.Parent = LoadingBarFill

	-- Loading Text
	local LoadingText = Instance.new("TextLabel")
	LoadingText.Size = UDim2.new(0.85, 0, 0, 20)
	LoadingText.Position = UDim2.new(0.5, 0, 1, -85)
	LoadingText.AnchorPoint = Vector2.new(0.5, 0)
	LoadingText.Text = "Loading..."
	LoadingText.TextColor3 = Color3.fromRGB(97, 255, 140)
	LoadingText.BackgroundTransparency = 1
	LoadingText.TextSize = 14
	LoadingText.Font = Enum.Font.GothamBold
	LoadingText.ZIndex = 12
	LoadingText.Visible = false
	LoadingText.Parent = Frame

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

	local GetKeyButton = MakeSigmaButton("Get Key", Color3.fromRGB(60, 65, 60), Color3.fromRGB(80, 85, 80))
	GetKeyButton.Activated:Connect(function()
		setclipboard("https://linkunlocker.com/fartsaken-key-luarmor-linkvertise-SNGKc")
		StatusLabel.Text = "Link copied to clipboard!"
	end)

	local function showLoadingAnimation()
		TextBox.Visible = false
		StatusLabel.Visible = false
		ButtonsFrame.Visible = false

		LoadingBarContainer.Visible = true
		LoadingText.Visible = true

		LoadingText.Text = "Validating key..."

		local startTime = tick()
		local duration = 1.5
		local connection

		connection = game:GetService("RunService").RenderStepped:Connect(function()
			local elapsed = tick() - startTime
			local progress = math.min(elapsed / duration, 1)

			local easedProgress = 1 - (1 - progress) ^ 3

			LoadingBarFill.Size = UDim2.new(easedProgress, 0, 1, 0)

			if progress < 0.3 then
				LoadingText.Text = "Checking key..."
			elseif progress < 0.6 then
				LoadingText.Text = "Authenticating..."
			elseif progress < 0.9 then
				LoadingText.Text = "This totaly does something..."
			else
				LoadingText.Text = "Authenticated."
			end

			if math.random() < 0.1 and progress > 0.5 then
				local particle = Instance.new("Frame")
				particle.BackgroundColor3 = Color3.fromRGB(97, 255, 140)
				particle.BackgroundTransparency = 0.7
				particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
				particle.Position =
					UDim2.new(easedProgress * math.random(80, 100) / 100, 0, math.random(-10, 10) / 10, 0)
				particle.ZIndex = 14
				particle.Parent = LoadingBarContainer

				local particleCorner = Instance.new("UICorner")
				particleCorner.CornerRadius = UDim.new(1, 0)
				particleCorner.Parent = particle

				game:GetService("TweenService")
					:Create(particle, TweenInfo.new(0.5), {
						BackgroundTransparency = 1,
						Position = UDim2.new(particle.Position.X.Scale, 0, particle.Position.Y.Scale - 0.3, 0),
					})
					:Play()

				game:GetService("Debris"):AddItem(particle, 0.5)
			end

			if progress >= 1 then
				connection:Disconnect()

				game:GetService("TweenService")
					:Create(
						LoadingBarFill,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ BackgroundColor3 = Color3.fromRGB(170, 255, 200) }
					)
					:Play()

				task.delay(0.3, function()
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
			end
		end)
	end

	local CheckKeyButton = MakeSigmaButton("Check Key", Color3.fromRGB(80, 180, 100), Color3.fromRGB(100, 200, 120))
	CheckKeyButton.Activated:Connect(function()
		local key = TextBox.Text:gsub("%s+", "")
		StatusLabel.Text = "Checking key..."

		local status = CheckiKey(key)

		if status.code == "KEY_VALID" then
			StatusLabel.Text = STATUS_MESSAGES.KEY_VALID
			StatusLabel.TextColor3 = Color3.fromRGB(97, 255, 140)
			sigmakey = key
			ApiStatusCode = status.code

			showLoadingAnimation()
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
		local Notificationes = 0
		local function MakeNotificatione(title, message, duration)
			duration = duration or 3

			local NotificationeIndexirus = Notificationes
			Notificationes = Notificationes + 1

			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.Name = "NotificationUI_" .. NotificationeIndexirus
			ScreenGui.Parent = game.CoreGui

			local Frame = Instance.new("Frame")
			Frame.Size = UDim2.new(0, 280, 0, 80)
			Frame.Position = UDim2.new(1, -290, 0, 20 + (NotificationeIndexirus * 90))
			Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Frame.BorderSizePixel = 0
			Frame.Parent = ScreenGui

			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0, 8)
			UICorner.Parent = Frame

			local GlowEffect = Instance.new("ImageLabel")
			GlowEffect.BackgroundTransparency = 1
			GlowEffect.Image = "rbxassetid://7331400934"
			GlowEffect.ImageColor3 = Color3.fromRGB(97, 255, 140)
			GlowEffect.ImageTransparency = 0.8
			GlowEffect.Size = UDim2.new(1.2, 0, 1.2, 0)
			GlowEffect.Position = UDim2.new(-0.1, 0, -0.1, 0)
			GlowEffect.ZIndex = -1
			GlowEffect.Parent = Frame

			local TitleLabel = Instance.new("TextLabel")
			TitleLabel.Size = UDim2.new(1, -20, 0, 25)
			TitleLabel.Position = UDim2.new(0, 10, 0, 10)
			TitleLabel.Text = title
			TitleLabel.TextColor3 = Color3.fromRGB(97, 255, 140)
			TitleLabel.BackgroundTransparency = 1
			TitleLabel.TextSize = 16
			TitleLabel.Font = Enum.Font.GothamBold
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
			TitleLabel.Parent = Frame

			local MessageLabel = Instance.new("TextLabel")
			MessageLabel.Size = UDim2.new(1, -20, 0, 35)
			MessageLabel.Position = UDim2.new(0, 10, 0, 35)
			MessageLabel.Text = message
			MessageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
			MessageLabel.BackgroundTransparency = 1
			MessageLabel.TextSize = 14
			MessageLabel.Font = Enum.Font.Gotham
			MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
			MessageLabel.TextWrapped = true
			MessageLabel.Parent = Frame

			Frame.Position = UDim2.new(1, 20, 0, 20 + (NotificationeIndexirus * 90))
			Frame:TweenPosition(UDim2.new(1, -290, 0, 20 + (NotificationeIndexirus * 90)), "Out", "Quad", 0.5)

			task.delay(duration, function()
				Frame:TweenPosition(UDim2.new(1, 20, 0, 20 + (NotificationeIndexirus * 90)), "Out", "Quad", 0.5)
				task.delay(0.5, function()
					ScreenGui:Destroy()
					Notificationes = Notificationes - 1
				end)
			end)

			return ScreenGui
		end

		MakeNotificatione("Welcome", "Script access valid! Loading script...", 3)
		task.delay(0.5, function()
			local timeLeftSecs = status.data.auth_expire - os.time()
			local hours = math.floor(timeLeftSecs / 3600)
			local minutes = math.floor((timeLeftSecs % 3600) / 60)
			MakeNotificatione("Subscription Info", "Time left: " .. hours .. "h " .. minutes .. "m", 4)
		end)
		task.delay(1, function()
			MakeNotificatione("Usage Stats", "Total executions: " .. status.data.total_executions, 4)
		end)
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
