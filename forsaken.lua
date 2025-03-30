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
		return {code = "KEY_INCORRECT", message = "Key cannot be empty"}
	end

	local success, status = pcall(function()
		return api.check_key(key)
	end)

	if not success then
		return {code = "ERROR", message = "Error occurred while checking key"}
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

	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(0, 320, 0, 220)
	Frame.Position = UDim2.new(0.5, -160, 0.5, -110)
	Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Frame.BorderSizePixel = 0
	Frame.Parent = scringui

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 8)
	UICorner.Parent = Frame

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -20, 0, 30)
	Title.Position = UDim2.new(0, 10, 0, 10)
	Title.Text = "Key Authentication"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1
	Title.TextSize = 18
	Title.Font = Enum.Font.GothamBold
	Title.Parent = Frame

	local StatusLabel = Instance.new("TextLabel")
	StatusLabel.Size = UDim2.new(1, -20, 0, 20)
	StatusLabel.Position = UDim2.new(0, 10, 0, 180)
	StatusLabel.Text = "Enter your key to continue"
	StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	StatusLabel.BackgroundTransparency = 1
	StatusLabel.TextSize = 14
	StatusLabel.Font = Enum.Font.Gotham
	StatusLabel.Parent = Frame

	local TextBox = Instance.new("TextBox")
	TextBox.Size = UDim2.new(1, -40, 0, 36)
	TextBox.Position = UDim2.new(0, 20, 0, 50)
	TextBox.Text = ""
	TextBox.PlaceholderText = "Enter Key Here"
	TextBox.Parent = Frame
	TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BorderSizePixel = 0
	TextBox.Font = Enum.Font.Gotham
	TextBox.TextSize = 14
	TextBox.ClearTextOnFocus = true

	local UICornerTextBox = Instance.new("UICorner")
	UICornerTextBox.CornerRadius = UDim.new(0, 6)
	UICornerTextBox.Parent = TextBox

	local function MakeSigmaButton(text, posY, colorRGB, callback)
		local Button = Instance.new("TextButton")
		Button.Size = UDim2.new(0, 140, 0, 36)
		Button.Position = UDim2.new(0.5, -70, 0, posY)
		Button.Text = text
		Button.Parent = Frame
		Button.BackgroundColor3 = colorRGB
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.BorderSizePixel = 0
		Button.Font = Enum.Font.GothamBold
		Button.TextSize = 14
		local UICornerButton = Instance.new("UICorner")
		UICornerButton.CornerRadius = UDim.new(0, 6)
		UICornerButton.Parent = Button

		Button.Activated:Connect(callback)
		return Button
	end

	local Getbuttonsss = MakeSigmaButton("Get Key", 100, Color3.fromRGB(0, 120, 215), function()
		setclipboard("https://discord.gg/fartsaken")
		StatusLabel.Text = "Link copied to clipboard!"
	end)
	local ChekyButton = MakeSigmaButton("Check Key", 145, Color3.fromRGB(0, 158, 73), function()
		local key = TextBox.Text:gsub("%s+", "")
		StatusLabel.Text = "Checking key..."

		local status = CheckiKey(key)

		if status.code == "KEY_VALID" then
			StatusLabel.Text = STATUS_MESSAGES.KEY_VALID
			StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
			sigmakey = key
			ApiStatusCode = status.code

			task.delay(1, function()
				scringui:Destroy()
			end)
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
		local targetPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = targetPosition
		}):Play()
	end

	Frame.InputBegan:Connect(function(input)
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

	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			SigmaDrag(input)
		end
	end)

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

			local TitleLabel = Instance.new("TextLabel")
			TitleLabel.Size = UDim2.new(1, -20, 0, 25)
			TitleLabel.Position = UDim2.new(0, 10, 0, 10)
			TitleLabel.Text = title
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
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

while ApiStatusCode ~= "KEY_VALID" do task.wait(.1) end
script_key = sigmakey
api.load_script()
