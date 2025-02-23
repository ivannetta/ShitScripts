local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local KeySystem
local Frame
local TextBox
local UICorner14
local UIPadding
local UICorner_2
local TextLabel
local CheckKeyButton
local UICorner_3
local GetKey
local UICorner_4

-- this is like the worst script ever bro
-- like allat needs to be deleted 🙏

local function FartHubLoad()
	-- roblox services that i dont need and totaly never use
	local Players = game:GetService("Players")
	local SoundService = game:GetService("SoundService")
	local RunService = game:GetService("RunService")
	local HttpService = game:GetService("HttpService")
	local VIM = game:GetService("VirtualInputManager")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	-- remote skibidi toilet enabler
	local MainRemoteEvent = ReplicatedStorage.Modules.Network.RemoteEvent

	-- literally just playergui 😭
	local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

	-- modulales
	local Rayfield = loadstring(
		game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/source.lua")
	)()
	--local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/101e78bd4144f8e4f5eade68176615e98a1513de/source.lua"))()

	local SmoothShiftLock
	local smoothShiftLockModule = ReplicatedStorage:WaitForChild("Systems")
		:WaitForChild("Player")
		:WaitForChild("Game")
		:FindFirstChild("SmoothShiftLock")
	local function GetShiftlock()
		local success, shiftlock = pcall(function()
			require(ReplicatedStorage.Systems.Player.Game.SmoothShiftLock)
		end)
		if success then
			SmoothShiftLock = require(ReplicatedStorage.Systems.Player.Game.SmoothShiftLock)
		else
			Rayfield:Notify({ Title = "An error occured!", Content = "Require isnt available", Duration = 10, Image = "ban" })
			SmoothShiftLock = "Unavailable"
		end
	end

	task.spawn(GetShiftlock)

	-- tablets
	local buttonFrames = {}
	local imageButtons = {}
	local CheckedPlayers = {}
	local SkibPlr = {}
	local CurrentFartsActive = {}
	local NameProtectNames = {}
	local pizzaConnections = {}
	local MusicConnections = {}

	-- flagatrons
	local CoolDownBlockers = false
	local SheddyEnabled = false
	local loopty = false
	local JoinedSigmaServer = false
	local WowWhatTheZestIsThis = nil
	local BlockEnabled = false
	local aimbotActive = false
	local FlipCooldown = false
	local GeneratorKeybindCooldown = false
	local LopticaGenBill = false
	local LopticaNameHighlight = false
	local CoinFlipping = false
	local Runners = false
	local LopticaCooldown = false
	local ReplaceStandingMusic = false
	local Prediction = false
	local SigmaData

	-- sittings
	local VectoryMultipliery = 2
	local WantedChrges = 2
	local SkibidiDistance = 6
	local AimLockTimer = 2
	local AimSmoothnes = 0.1
	local PredictionMultiplier = 0.5

	-- ui tabbings
	local PlayerTab = nil
	local VisualsTab = nil
	local GeneratorTab = nil
	local BlatantTab = nil
	local MiscTab = nil
	local AnimationsTab = nil

	-- Misc tab things that i got angyr at
	local BabyShark = nil
	local KillerFartPart = nil
	local HRP = nil
	local CurrentSound = "RottenGirl.mp3"
	local FunnyVideo = "SubwaySurfers.mp4.Fart4"

	local fart = {
		aimbot = {},
		abilities = {},
		characterChange = nil,
	}

	local success, wowzers = pcall(function()
		return Players.LocalPlayer.PlayerData.Settings.Game:WaitForChild("FieldOfView", 3)
	end)

	if success and wowzers then
		wowzers:SetAttribute("MaxValue", 120)
		wowzers:SetAttribute("MinValue", 20)
	end

	task.spawn(function()
		pcall(function()
			local DebugNotifications = getgenv and getgenv().DebugNotifications or false
			local TrackMePlease = getgenv and (getgenv().TrackMePlease ~= nil and getgenv().TrackMePlease or true)

			local SkibidiSigma = TrackMePlease and "They/Them" or "They/Them"

			MainRemoteEvent:FireServer(
				"UpdateSettings",
				Players.LocalPlayer.PlayerData.Settings.Accessibility.Pronouns,
				SkibidiSigma
			)
		end)
	end)

	local executorname = (pcall(getexecutorname) and getexecutorname())
		or (pcall(identifyexecutor) and identifyexecutor())
		or "Unknown"
	local supportedExecutors = { AWP = true, Wave = true, ["Synapse Z"] = true, Swift = true }

	task.spawn(function()
		if executorname == "AWP" then
			local folder, originalFile, tempFile = "FartHub", "FartHub/AmazingExecutor.mp3.Fart3", "FartHub/temp.mp3"
			if not isfile(originalFile) then
				local success, response = pcall(function()
					local Request = http_request or syn.request or request
					return Request
						and Request({
							Url = "https://raw.githubusercontent.com/ivannetta/ShitScripts/main/Assets/random/AmazingExecutor.mp3",
							Method = "GET",
						})
				end)
				if success and response and response.Body then
					writefile(originalFile, response.Body)
				end
			else
				return
			end
			if isfile(originalFile) then
				writefile(tempFile, readfile(originalFile))
				local sound = Instance.new("Sound", game:GetService("SoundService"))
				sound.SoundId = getcustomasset(tempFile)
				sound:Play()
			end
			delfile(tempFile)
		end
	end)

	local SkibidiPomniOhioList = {
		Killers = {
			Jason = { Duration1 = 0.5, Duration2 = 1, Duration3 = 1.5 },
			["1x1x1x1"] = { Duration1 = 0.5, Duration2 = 2.5, Duration3 = 1 },
			JohnDoe = { Duration1 = 0.5, Duration2 = 5 },
			c00lkidd = { Duration1 = 0.5, Duration2 = 1 },
		},
		Survivors = {
			Guest1337 = { Duration2 = 2, Duration3 = 2 },
			Chance = { Duration2 = 1.25 },
			Shedletsky = { Duration1 = 1.25 },
			Dusekkar = { Duration2 = 1.5 },
		},
	}

	local MusicList = {
		["RottenGirl"] = "RottenGirl.mp3",
		[":3"] = "Colon3.mp3",
		["GODDESS OF INDIFERENCE"] = "GoddessOfIndiference.mp3",
		["Canto 3 Boss Battle"] = "Canto3BossBattle.mp3",
		["Sigma Boy Phonk"] = "SigmaBoyPhonk.mp3",
		["McMental"] = "McMental.mp3",
	        ["GrassSkirt"] = "GrassSkirt.mp3",
	}

	setclipboard("https://linkunlocker.com/fartsaken-ZINXl")

	local GUI = Rayfield:CreateWindow({
		Name = "FartSaken",
		Theme = "Default",
		LoadingTitle = "Fart Hub",
		LoadingSubtitle = "meow meow meow meow meow meow",
		Icon = "microwave",
		Link = "https://github.com/ivannetta/ShitScripts/Forsaken",

		DisableBuildWarnings = true,
		DisableRayfieldPrompts = true,

		KeySystem = true,
		KeySettings = {
			Title = "Fartsaken Key System",
			Subtitle = "im such a meowzer like meow meow",
			Note = "Copied Link To Clipboard",
			FileName = "FartHubKey",
			SaveKey = true,
			GrabKeyFromSite = false,
			Key = { "ohio" },
		},
	})

	local function GetCharAndFold()
		local Me = game.Players.LocalPlayer
		if not Me or not Me.Character then
			return nil, nil
		end
		return Me.Character.Name, Me.Character.Parent.Name
	end

	local function JanitorModeEnabled(oklolloolloololololol)
		for _, connection in pairs(oklolloolloololololol) do
			if connection and connection.Connected then
				connection:Disconnect()
			end
		end
		table.clear(oklolloolloololololol)
	end

	local function WHATTHEFUCKISTHISSHITCODEKLDOWQNDJQW()
		local FartHubEmoteGUI = Instance.new("ScreenGui", game:GetService("CoreGui"))
		local Holder = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local LogoFrame = Instance.new("Frame")
		local FartsakLogo = Instance.new("ImageLabel")
		local LogoUIC = Instance.new("UICorner")
		local Bwah = Instance.new("UIAspectRatioConstraint")
		local WhereTheButtons = Instance.new("Frame")
		local _1 = Instance.new("Frame")
		local TextButton1 = Instance.new("TextButton")
		local Front1 = Instance.new("ImageLabel")
		local UIC111 = Instance.new("UICorner")
		local Background1 = Instance.new("ImageLabel")
		local UIC11 = Instance.new("UICorner")
		local UIC1 = Instance.new("UICorner")
		local _2 = Instance.new("Frame")
		local TextButton2 = Instance.new("TextButton")
		local Front2 = Instance.new("ImageLabel")
		local UIC222 = Instance.new("UICorner")
		local Background2 = Instance.new("ImageLabel")
		local UIC22 = Instance.new("UICorner")
		local UIC2 = Instance.new("UICorner")
		local _3 = Instance.new("Frame")
		local TextButton3 = Instance.new("TextButton")
		local Front3 = Instance.new("ImageLabel")
		local UIC333 = Instance.new("UICorner")
		local Background3 = Instance.new("ImageLabel")
		local UIC33 = Instance.new("UICorner")
		local UIC3 = Instance.new("UICorner")
		local _4 = Instance.new("Frame")
		local TextButton4 = Instance.new("TextButton")
		local Front4 = Instance.new("ImageLabel")
		local UIC444 = Instance.new("UICorner")
		local Background4 = Instance.new("ImageLabel")
		local UIC44 = Instance.new("UICorner")
		local UIC4 = Instance.new("UICorner")
		local _5 = Instance.new("Frame")
		local TextButton5 = Instance.new("TextButton")
		local Front5 = Instance.new("ImageLabel")
		local UIC555 = Instance.new("UICorner")
		local Background5 = Instance.new("ImageLabel")
		local UIC55 = Instance.new("UICorner")
		local UIC5 = Instance.new("UICorner")
		local _6 = Instance.new("Frame")
		local TextButton6 = Instance.new("TextButton")
		local Front6 = Instance.new("ImageLabel")
		local UIC666 = Instance.new("UICorner")
		local Background6 = Instance.new("ImageLabel")
		local UIC66 = Instance.new("UICorner")
		local UIC6 = Instance.new("UICorner")
		local _7 = Instance.new("Frame")
		local TextButton7 = Instance.new("TextButton")
		local Front7 = Instance.new("ImageLabel")
		local UIC777 = Instance.new("UICorner")
		local Background7 = Instance.new("ImageLabel")
		local UIC77 = Instance.new("UICorner")
		local UIC7 = Instance.new("UICorner")
		local _8 = Instance.new("Frame")
		local TextButton8 = Instance.new("TextButton")
		local Front8 = Instance.new("ImageLabel")
		local UIC888 = Instance.new("UICorner")
		local Background8 = Instance.new("ImageLabel")
		local UIC88 = Instance.new("UICorner")
		local UIC8 = Instance.new("UICorner")
		local ListingLayouts = Instance.new("UIListLayout")
		local WhereButtonPadding = Instance.new("UIPadding")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local Name = Instance.new("Frame")
		local NameTextbox = Instance.new("TextLabel")
		local NameUIT = Instance.new("UITextSizeConstraint")
		local NameUIC = Instance.new("UICorner")

		--Properties:

		FartHubEmoteGUI.Name = "FartHubEmoteGUI"
		FartHubEmoteGUI.Parent = game:GetService("CoreGui")
		FartHubEmoteGUI.ResetOnSpawn = false

		Holder.Name = "Holder"
		Holder.Parent = FartHubEmoteGUI
		Holder.AnchorPoint = Vector2.new(0.5, 0.5)
		Holder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Holder.BackgroundTransparency = 0.250
		Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holder.BorderSizePixel = 0
		Holder.LayoutOrder = 1
		Holder.Position = UDim2.new(0.5, 0, 0.6, 0)
		Holder.Size = UDim2.new(0, 0, 0, 0)
		Holder.SizeConstraint = Enum.SizeConstraint.RelativeXY
		UICorner.Parent = Holder

		LogoFrame.Name = "LogoFrame"
		LogoFrame.Parent = Holder
		LogoFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		LogoFrame.BackgroundTransparency = 0.250
		LogoFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogoFrame.BorderSizePixel = 0
		LogoFrame.Position = UDim2.new(0, 0, -0.400000006, -5)
		LogoFrame.Size = UDim2.new(0.100000001, 0, 0.400000006, 0)

		FartsakLogo.Name = "FartsakLogo"
		FartsakLogo.Parent = LogoFrame
		FartsakLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		FartsakLogo.BackgroundTransparency = 1.000
		FartsakLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
		FartsakLogo.BorderSizePixel = 0
		FartsakLogo.Size = UDim2.new(1, 0, 1, 0)
		FartsakLogo.Image = "http://www.roblox.com/asset/?id=138949854455429"

		LogoUIC.Name = "LogoUIC"
		LogoUIC.Parent = LogoFrame

		Bwah.Name = "Bwah"
		Bwah.Parent = LogoFrame
		Bwah.AspectRatio = 2.250

		WhereTheButtons.Name = "WhereTheButtons"
		WhereTheButtons.Parent = Holder
		WhereTheButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		WhereTheButtons.BackgroundTransparency = 1.000
		WhereTheButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
		WhereTheButtons.BorderSizePixel = 0
		WhereTheButtons.Size = UDim2.new(1, -40, 1, 0)

		_1.Name = "1"
		_1.Parent = WhereTheButtons
		_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		_1.BackgroundTransparency = 0.700
		_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_1.BorderSizePixel = 0
		_1.LayoutOrder = 1
		_1.Size = UDim2.new(0.125, 0, 1, 0)
		_1.ZIndex = 2

		TextButton1.Name = "TextButton1"
		TextButton1.Parent = _1
		TextButton1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton1.BackgroundTransparency = 1.000
		TextButton1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton1.BorderSizePixel = 0
		TextButton1.Size = UDim2.new(1, 0, 1, 0)
		TextButton1.ZIndex = 3
		TextButton1.Font = Enum.Font.FredokaOne
		TextButton1.Text = ""
		TextButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton1.TextScaled = true
		TextButton1.TextSize = 10.000
		TextButton1.TextWrapped = true

		Front1.Name = "Front1"
		Front1.Parent = TextButton1
		Front1.AnchorPoint = Vector2.new(0.5, 0.5)
		Front1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Front1.BackgroundTransparency = 1.000
		Front1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Front1.BorderSizePixel = 0
		Front1.Position = UDim2.new(0.5, 0, 0.5, 0)
		Front1.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		Front1.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Front1.ZIndex = 4
		Front1.Image = "rbxassetid://112068843495830"

		UIC111.Name = "UIC111"
		UIC111.Parent = Front1

		Background1.Name = "Background1"
		Background1.Parent = TextButton1
		Background1.AnchorPoint = Vector2.new(0.5, 0.5)
		Background1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background1.BackgroundTransparency = 1.000
		Background1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Background1.BorderSizePixel = 0
		Background1.Position = UDim2.new(0.5, 0, 0.5, 0)
		Background1.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Background1.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Background1.ZIndex = 3
		Background1.Image = "rbxassetid://138110752460865"

		UIC11.Name = "UIC11"
		UIC11.Parent = Background1

		UIC1.Name = "UIC1"
		UIC1.Parent = _1

		_2.Name = "2"
		_2.Parent = WhereTheButtons
		_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		_2.BackgroundTransparency = 0.700
		_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_2.BorderSizePixel = 0
		_2.LayoutOrder = 2
		_2.Size = UDim2.new(0.125, 0, 1, 0)
		_2.ZIndex = 2

		TextButton2.Name = "TextButton2"
		TextButton2.Parent = _2
		TextButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton2.BackgroundTransparency = 1.000
		TextButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton2.BorderSizePixel = 0
		TextButton2.Size = UDim2.new(1, 0, 1, 0)
		TextButton2.ZIndex = 3
		TextButton2.Font = Enum.Font.FredokaOne
		TextButton2.Text = ""
		TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton2.TextScaled = true
		TextButton2.TextSize = 10.000
		TextButton2.TextWrapped = true

		Front2.Name = "Front2"
		Front2.Parent = TextButton2
		Front2.AnchorPoint = Vector2.new(0.5, 0.5)
		Front2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Front2.BackgroundTransparency = 1.000
		Front2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Front2.BorderSizePixel = 0
		Front2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Front2.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		Front2.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Front2.ZIndex = 4
		Front2.Image = "rbxassetid://112068843495830"

		UIC222.Name = "UIC222"
		UIC222.Parent = Front2

		Background2.Name = "Background2"
		Background2.Parent = TextButton2
		Background2.AnchorPoint = Vector2.new(0.5, 0.5)
		Background2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background2.BackgroundTransparency = 1.000
		Background2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Background2.BorderSizePixel = 0
		Background2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Background2.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Background2.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Background2.ZIndex = 3
		Background2.Image = "rbxassetid://138110752460865"

		UIC22.Name = "UIC22"
		UIC22.Parent = Background2

		UIC2.Name = "UIC2"
		UIC2.Parent = _2

		_3.Name = "3"
		_3.Parent = WhereTheButtons
		_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		_3.BackgroundTransparency = 0.700
		_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_3.BorderSizePixel = 0
		_3.LayoutOrder = 3
		_3.Size = UDim2.new(0.125, 0, 1, 0)
		_3.ZIndex = 2

		TextButton3.Name = "TextButton3"
		TextButton3.Parent = _3
		TextButton3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton3.BackgroundTransparency = 1.000
		TextButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton3.BorderSizePixel = 0
		TextButton3.Size = UDim2.new(1, 0, 1, 0)
		TextButton3.ZIndex = 3
		TextButton3.Font = Enum.Font.FredokaOne
		TextButton3.Text = ""
		TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton3.TextScaled = true
		TextButton3.TextSize = 10.000
		TextButton3.TextWrapped = true

		Front3.Name = "Front3"
		Front3.Parent = TextButton3
		Front3.AnchorPoint = Vector2.new(0.5, 0.5)
		Front3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Front3.BackgroundTransparency = 1.000
		Front3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Front3.BorderSizePixel = 0
		Front3.Position = UDim2.new(0.5, 0, 0.5, 0)
		Front3.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		Front3.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Front3.ZIndex = 4
		Front3.Image = "rbxassetid://112068843495830"

		UIC333.Name = "UIC333"
		UIC333.Parent = Front3

		Background3.Name = "Background3"
		Background3.Parent = TextButton3
		Background3.AnchorPoint = Vector2.new(0.5, 0.5)
		Background3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background3.BackgroundTransparency = 1.000
		Background3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Background3.BorderSizePixel = 0
		Background3.Position = UDim2.new(0.5, 0, 0.5, 0)
		Background3.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Background3.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Background3.ZIndex = 3
		Background3.Image = "rbxassetid://138110752460865"

		UIC33.Name = "UIC33"
		UIC33.Parent = Background3

		UIC3.Name = "UIC3"
		UIC3.Parent = _3

		_4.Name = "4"
		_4.Parent = WhereTheButtons
		_4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		_4.BackgroundTransparency = 0.700
		_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_4.BorderSizePixel = 0
		_4.LayoutOrder = 4
		_4.Size = UDim2.new(0.125, 0, 1, 0)
		_4.ZIndex = 2

		TextButton4.Name = "TextButton4"
		TextButton4.Parent = _4
		TextButton4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton4.BackgroundTransparency = 1.000
		TextButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton4.BorderSizePixel = 0
		TextButton4.Size = UDim2.new(1, 0, 1, 0)
		TextButton4.ZIndex = 3
		TextButton4.Font = Enum.Font.FredokaOne
		TextButton4.Text = ""
		TextButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton4.TextScaled = true
		TextButton4.TextSize = 10.000
		TextButton4.TextWrapped = true

		Front4.Name = "Front4"
		Front4.Parent = TextButton4
		Front4.AnchorPoint = Vector2.new(0.5, 0.5)
		Front4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Front4.BackgroundTransparency = 1.000
		Front4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Front4.BorderSizePixel = 0
		Front4.Position = UDim2.new(0.5, 0, 0.5, 0)
		Front4.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		Front4.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Front4.ZIndex = 4
		Front4.Image = "rbxassetid://112068843495830"

		UIC444.Name = "UIC444"
		UIC444.Parent = Front4

		Background4.Name = "Background4"
		Background4.Parent = TextButton4
		Background4.AnchorPoint = Vector2.new(0.5, 0.5)
		Background4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background4.BackgroundTransparency = 1.000
		Background4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Background4.BorderSizePixel = 0
		Background4.Position = UDim2.new(0.5, 0, 0.5, 0)
		Background4.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Background4.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Background4.ZIndex = 3
		Background4.Image = "rbxassetid://138110752460865"

		UIC44.Name = "UIC44"
		UIC44.Parent = Background4

		UIC4.Name = "UIC4"
		UIC4.Parent = _4

		_5.Name = "5"
		_5.Parent = WhereTheButtons
		_5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		_5.BackgroundTransparency = 0.700
		_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_5.BorderSizePixel = 0
		_5.LayoutOrder = 5
		_5.Size = UDim2.new(0.125, 0, 1, 0)
		_5.ZIndex = 2

		TextButton5.Name = "TextButton5"
		TextButton5.Parent = _5
		TextButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton5.BackgroundTransparency = 1.000
		TextButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton5.BorderSizePixel = 0
		TextButton5.Size = UDim2.new(1, 0, 1, 0)
		TextButton5.ZIndex = 3
		TextButton5.Font = Enum.Font.FredokaOne
		TextButton5.Text = ""
		TextButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton5.TextScaled = true
		TextButton5.TextSize = 10.000
		TextButton5.TextWrapped = true

		Front5.Name = "Front5"
		Front5.Parent = TextButton5
		Front5.AnchorPoint = Vector2.new(0.5, 0.5)
		Front5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Front5.BackgroundTransparency = 1.000
		Front5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Front5.BorderSizePixel = 0
		Front5.Position = UDim2.new(0.5, 0, 0.5, 0)
		Front5.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		Front5.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Front5.ZIndex = 4
		Front5.Image = "rbxassetid://112068843495830"

		UIC555.Name = "UIC555"
		UIC555.Parent = Front5

		Background5.Name = "Background5"
		Background5.Parent = TextButton5
		Background5.AnchorPoint = Vector2.new(0.5, 0.5)
		Background5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background5.BackgroundTransparency = 1.000
		Background5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Background5.BorderSizePixel = 0
		Background5.Position = UDim2.new(0.5, 0, 0.5, 0)
		Background5.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Background5.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Background5.ZIndex = 3
		Background5.Image = "rbxassetid://138110752460865"

		UIC55.Name = "UIC55"
		UIC55.Parent = Background5

		UIC5.Name = "UIC5"
		UIC5.Parent = _5

		_6.Name = "6"
		_6.Parent = WhereTheButtons
		_6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		_6.BackgroundTransparency = 0.700
		_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_6.BorderSizePixel = 0
		_6.LayoutOrder = 6
		_6.Size = UDim2.new(0.125, 0, 1, 0)
		_6.ZIndex = 2

		TextButton6.Name = "TextButton6"
		TextButton6.Parent = _6
		TextButton6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton6.BackgroundTransparency = 1.000
		TextButton6.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton6.BorderSizePixel = 0
		TextButton6.Size = UDim2.new(1, 0, 1, 0)
		TextButton6.ZIndex = 3
		TextButton6.Font = Enum.Font.FredokaOne
		TextButton6.Text = ""
		TextButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton6.TextScaled = true
		TextButton6.TextSize = 10.000
		TextButton6.TextWrapped = true

		Front6.Name = "Front6"
		Front6.Parent = TextButton6
		Front6.AnchorPoint = Vector2.new(0.5, 0.5)
		Front6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Front6.BackgroundTransparency = 1.000
		Front6.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Front6.BorderSizePixel = 0
		Front6.Position = UDim2.new(0.5, 0, 0.5, 0)
		Front6.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		Front6.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Front6.ZIndex = 4
		Front6.Image = "rbxassetid://112068843495830"

		UIC666.Name = "UIC666"
		UIC666.Parent = Front6

		Background6.Name = "Background6"
		Background6.Parent = TextButton6
		Background6.AnchorPoint = Vector2.new(0.5, 0.5)
		Background6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background6.BackgroundTransparency = 1.000
		Background6.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Background6.BorderSizePixel = 0
		Background6.Position = UDim2.new(0.5, 0, 0.5, 0)
		Background6.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Background6.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Background6.ZIndex = 3
		Background6.Image = "rbxassetid://138110752460865"

		UIC66.Name = "UIC66"
		UIC66.Parent = Background6

		UIC6.Name = "UIC6"
		UIC6.Parent = _6

		_7.Name = "7"
		_7.Parent = WhereTheButtons
		_7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		_7.BackgroundTransparency = 0.700
		_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_7.BorderSizePixel = 0
		_7.LayoutOrder = 7
		_7.Size = UDim2.new(0.125, 0, 1, 0)
		_7.ZIndex = 2

		TextButton7.Name = "TextButton7"
		TextButton7.Parent = _7
		TextButton7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton7.BackgroundTransparency = 1.000
		TextButton7.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton7.BorderSizePixel = 0
		TextButton7.Size = UDim2.new(1, 0, 1, 0)
		TextButton7.ZIndex = 3
		TextButton7.Font = Enum.Font.FredokaOne
		TextButton7.Text = ""
		TextButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton7.TextScaled = true
		TextButton7.TextSize = 10.000
		TextButton7.TextWrapped = true

		Front7.Name = "Front7"
		Front7.Parent = TextButton7
		Front7.AnchorPoint = Vector2.new(0.5, 0.5)
		Front7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Front7.BackgroundTransparency = 1.000
		Front7.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Front7.BorderSizePixel = 0
		Front7.Position = UDim2.new(0.5, 0, 0.5, 0)
		Front7.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		Front7.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Front7.ZIndex = 4
		Front7.Image = "rbxassetid://112068843495830"

		UIC777.Name = "UIC777"
		UIC777.Parent = Front7

		Background7.Name = "Background7"
		Background7.Parent = TextButton7
		Background7.AnchorPoint = Vector2.new(0.5, 0.5)
		Background7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background7.BackgroundTransparency = 1.000
		Background7.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Background7.BorderSizePixel = 0
		Background7.Position = UDim2.new(0.5, 0, 0.5, 0)
		Background7.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Background7.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Background7.ZIndex = 3
		Background7.Image = "rbxassetid://138110752460865"

		UIC77.Name = "UIC77"
		UIC77.Parent = Background7

		UIC7.Name = "UIC7"
		UIC7.Parent = _7

		_8.Name = "8"
		_8.Parent = WhereTheButtons
		_8.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		_8.BackgroundTransparency = 0.700
		_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_8.BorderSizePixel = 0
		_8.LayoutOrder = 8
		_8.Size = UDim2.new(0.125, 0, 1, 0)
		_8.ZIndex = 2

		TextButton8.Name = "TextButton8"
		TextButton8.Parent = _8
		TextButton8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton8.BackgroundTransparency = 1.000
		TextButton8.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton8.BorderSizePixel = 0
		TextButton8.Size = UDim2.new(1, 0, 1, 0)
		TextButton8.ZIndex = 3
		TextButton8.Font = Enum.Font.FredokaOne
		TextButton8.Text = ""
		TextButton8.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton8.TextScaled = true
		TextButton8.TextSize = 10.000
		TextButton8.TextWrapped = true

		Front8.Name = "Front8"
		Front8.Parent = TextButton8
		Front8.AnchorPoint = Vector2.new(0.5, 0.5)
		Front8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Front8.BackgroundTransparency = 1.000
		Front8.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Front8.BorderSizePixel = 0
		Front8.Position = UDim2.new(0.5, 0, 0.5, 0)
		Front8.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		Front8.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Front8.ZIndex = 4
		Front8.Image = "rbxassetid://112068843495830"

		UIC888.Name = "UIC888"
		UIC888.Parent = Front8

		Background8.Name = "Background8"
		Background8.Parent = TextButton8
		Background8.AnchorPoint = Vector2.new(0.5, 0.5)
		Background8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Background8.BackgroundTransparency = 1.000
		Background8.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Background8.BorderSizePixel = 0
		Background8.Position = UDim2.new(0.5, 0, 0.5, 0)
		Background8.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Background8.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Background8.ZIndex = 3
		Background8.Image = "rbxassetid://138110752460865"

		UIC88.Name = "UIC88"
		UIC88.Parent = Background8

		UIC8.Name = "UIC8"
		UIC8.Parent = _8

		ListingLayouts.Name = "ListingLayouts"
		ListingLayouts.Parent = WhereTheButtons
		ListingLayouts.FillDirection = Enum.FillDirection.Horizontal
		ListingLayouts.SortOrder = Enum.SortOrder.LayoutOrder
		ListingLayouts.VerticalAlignment = Enum.VerticalAlignment.Center
		ListingLayouts.HorizontalAlignment = Enum.HorizontalAlignment.Left
		ListingLayouts.Padding = UDim.new(0, 5)

		WhereButtonPadding.Name = "WhereButtonPadding"
		WhereButtonPadding.Parent = WhereTheButtons
		WhereButtonPadding.PaddingBottom = UDim.new(0, 5)
		WhereButtonPadding.PaddingLeft = UDim.new(0, 5)
		WhereButtonPadding.PaddingRight = UDim.new(0, 5)
		WhereButtonPadding.PaddingTop = UDim.new(0, 5)

		UIAspectRatioConstraint.Parent = Holder
		UIAspectRatioConstraint.AspectRatio = 9.000

		Name.Name = "Name"
		Name.Parent = Holder
		Name.AnchorPoint = Vector2.new(0.5, 1)
		Name.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Name.BackgroundTransparency = 0.250
		Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Name.BorderSizePixel = 0
		Name.Position = UDim2.new(0.5, 0, 1.29999995, 5)
		Name.Size = UDim2.new(1, 0, 0.300000012, 0)

		NameTextbox.Name = "NameTextbox"
		NameTextbox.Parent = Name
		NameTextbox.AnchorPoint = Vector2.new(0.5, 0.5)
		NameTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NameTextbox.BackgroundTransparency = 1.000
		NameTextbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NameTextbox.BorderSizePixel = 0
		NameTextbox.Position = UDim2.new(0.5, 0, 0.5, 0)
		NameTextbox.Size = UDim2.new(1, 0, 1, 0)
		NameTextbox.Font = Enum.Font.FredokaOne
		NameTextbox.Text = "Some Emote Name"
		NameTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
		NameTextbox.TextScaled = true
		NameTextbox.TextSize = 14.000
		NameTextbox.TextWrapped = true

		NameUIT.Name = "NameUIT"
		NameUIT.Parent = NameTextbox
		NameUIT.MaxTextSize = 30
		NameUIT.MinTextSize = 10

		NameUIC.Name = "NameUIC"
		NameUIC.Parent = Name

		local Images = {
			{ name = "Locked", renderImage = "rbxassetid://103241825392940" },
			{ name = "LethalCompany", renderImage = "rbxassetid://89769371017185" },
			{ name = "Headbanger", renderImage = "rbxassetid://126222345373558" },
			{ name = "SoRetro", renderImage = "rbxassetid://129885437120707" },
			{ name = "AICatDance", renderImage = "rbxassetid://93387041641721" },
			{ name = "SubjectThree", renderImage = "rbxassetid://83639505456623" },
			{ name = "Subterfuge", renderImage = "rbxassetid://71165177698139" },
			{ name = "Griddy", renderImage = "rbxassetid://71748174857033" },
			{ name = "Prince", renderImage = "rbxassetid://125197961882771" },
			{ name = "MissTheQuiet", renderImage = "rbxassetid://86125219137797" },
			{ name = "Hero", renderImage = "rbxassetid://78969991165860" },
			{ name = "PYT", renderImage = "rbxassetid://121927033287000" },
			{ name = "Wait", renderImage = "rbxassetid://106561882302009" },
			{ name = "No", renderImage = "rbxassetid://101973569734115" },
			{ name = "Konton", renderImage = "rbxassetid://135343313057075" },
			{ name = "TickTock", renderImage = "rbxassetid://112068843495830" },
			{ name = "Dio", renderImage = "rbxassetid://78716828045407" },
			{ name = "Shucks", renderImage = "rbxassetid://139634009593796" },
			{ name = "ThePhone", renderImage = "rbxassetid://91657126735088" },
			{ name = "Skeleton", renderImage = "rbxassetid://94678300716216" },
			{ name = "Insanity", renderImage = "rbxassetid://79579234154217" },
			{ name = "HakariDance", renderImage = "rbxassetid://124587965197013" },
			{ name = "SillyBilly", renderImage = "rbxassetid://96660516353249" },
			{ name = "Hotdog", renderImage = "rbxassetid://70514684116327" },
			{ name = "DistractionDance", renderImage = "rbxassetid://110811886859354" },
			{ name = "CaliforniaGirls", renderImage = "rbxassetid://127260772788474" },
			{ name = "AolGuy", renderImage = "rbxassetid://81493512531467" },
			{ name = "Eggrolled", renderImage = "rbxassetid://75402218293560" },
			{ name = "BagUp", renderImage = "rbxassetid://135883870615399" },
			{ name = "Poisoned", renderImage = "rbxassetid://92399495788269" },
			{ name = "Wave", renderImage = "rbxassetid://132063131763271" },
		}

		local buttons = {
			TextButton1,
			TextButton2,
			TextButton3,
			TextButton4,
			TextButton5,
			TextButton6,
			TextButton7,
			TextButton8,
		}

		local function GetEmoteList()
			local player = game:GetService("Players").LocalPlayer
			local emotes = player:FindFirstChild("PlayerData")
					and player.PlayerData:FindFirstChild("Equipped")
					and player.PlayerData.Equipped:FindFirstChild("Emotes")
					and player.PlayerData.Equipped.Emotes.Value
				or ""
			local emoteList = {}
			for i, emote in ipairs(string.split(emotes, "|")) do
				local EmoteImage = ""
				for _, image in ipairs(Images) do
					if image.name == emote then
						EmoteImage = image.renderImage
						break
					end
				end
				table.insert(emoteList, { index = i, name = emote, renderImage = EmoteImage })
			end
			return emoteList
		end

		local emoteList = GetEmoteList()

		local function SetImages()
			for i, button in ipairs(buttons) do
				local emote = emoteList[i]
				if emote and emote.renderImage ~= "" then
					button:FindFirstChild("Front" .. i).Image = emote.renderImage
				else
					button.Text = ""
					for _, child in ipairs(button:GetChildren()) do
						if child:IsA("ImageLabel") then
							child:Destroy()
						end
					end
				end
			end
		end

		SetImages()

		for i, button in ipairs(buttons) do
			button.MouseEnter:Connect(function()
				local emote = emoteList[i]
				if emote and emote.name ~= "" then
					NameTextbox.Text = emote.name
				end
			end)
		end

		local TweenServiceSigma = game:GetService("TweenService")

		local Blur = Instance.new("BlurEffect", game:GetService("Lighting"))
		Blur.Size = 0
		Blur.Name = "FartHubBlur"

		local tweenInfoSigmaBlur = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
		local tweenSigmaBlur = TweenServiceSigma:Create(Blur, tweenInfoSigmaBlur, { Size = 0 })
		tweenSigmaBlur:Play()

		local tweeninfoholdersize = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
		local tweenholdersize =
			TweenServiceSigma:Create(Holder, tweeninfoholdersize, { Size = UDim2.new(0.8 * 0.8, 0, 0.15 * 0.8, 0) })
		tweenholdersize:Play()

		for i, button in ipairs(buttons) do
			button.Activated:Connect(function()
				local PlayThingText = emoteList[i].name

				local ohString1 = "PlayEmote"
				local ohString2 = "Animations"
				local ohString3 = "TickTock"
				game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent
					:FireServer(ohString1, ohString2, PlayThingText)

				local TweenService = game:GetService("TweenService")

				local originalSize = Holder.Size
				local DestinationSize = UDim2.new(0, 0, 0, 0)

				local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
				local tween = TweenService:Create(Holder, tweenInfo, { Size = DestinationSize })
				local tweenblurinfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
				local tweenblur = TweenService:Create(Blur, tweenblurinfo, { Size = 0 })

				tweenblur:Play()
				tween:Play()
				task.wait(0.25)
				FartHubEmoteGUI:Destroy()
			end)
		end
	end

	local function Aimbot(Dur)
		if not Dur then
			return
		end
		local Char, CharacterGender = GetCharAndFold()
		if not Char or not CharacterGender then
			return
		end

		local Me = game.Players.LocalPlayer
		local MeButCharacter = Me.Character
		if not MeButCharacter or not MeButCharacter:FindFirstChild("HumanoidRootPart") then
			return
		end

		local HornyFolder = workspace:FindFirstChild("Players")
			and workspace.Players:FindFirstChild(CharacterGender == "Killers" and "Survivors" or "Killers")
		if not HornyFolder then
			return
		end

		local function FindClosestPerson()
			local ClosestTarget, ClosestDistance = nil, math.huge
			local MyPosition = MeButCharacter.HumanoidRootPart.Position

			for _, v in pairs(HornyFolder:GetChildren()) do
				if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
					local distance = (v.HumanoidRootPart.Position - MyPosition).Magnitude
					if distance < ClosestDistance then
						ClosestDistance = distance
						ClosestTarget = v
					end
				end
			end
			return ClosestTarget
		end

		local target = FindClosestPerson()
		task.spawn(function()
			pcall(function()
				local success, err = pcall(function()
					if SmoothShiftLock ~= "Unavailable" and not SmoothShiftLock.Enabled then
						SmoothShiftLock:ToggleShiftLock()
					else
						if not game:GetService("UserInputService").MouseBehavior == Enum.MouseBehavior.LockCenter then
							local ShiftlockKeybindEnum =
								game:GetService("Players").LocalPlayer.PlayerData.Settings.Keybinds.ShiftLock.Value
							-- get keycode of shiftlock
							local ShiftlockKeyCode = Enum.KeyCode[ShiftlockKeybindEnum]
							VIM:SendKeyEvent(
								true,
								ShiftlockKeyCode,
								false,
								game:GetService("Players").LocalPlayer.PlayerGui
							)
							VIM:SendKeyEvent(
								false,
								ShiftlockKeyCode,
								false,
								game:GetService("Players").LocalPlayer.PlayerGui
							)
						end
					end
				end)

				if not success then
					return
				end
			end)
		end)

		task.spawn(function()
			local startTime = tick()
			local UserInputService = game:GetService("UserInputService")
			UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
			local basePredictionTime = PredictionMultiplier -- Base prediction time in seconds
			local minPredictionTime = (PredictionMultiplier / 3) -- Minimum prediction time for very close targets
			local maxPredictionTime = (PredictionMultiplier * 3) -- Maximum prediction time for very distant targets

			while tick() - startTime < Dur do
				if target and target:FindFirstChild("HumanoidRootPart") then
					local wawa = MeButCharacter.HumanoidRootPart
					local targetHRP = target.HumanoidRootPart
					local targetVelocity = targetHRP.AssemblyLinearVelocity

					local distanceToTarget = (targetHRP.Position - wawa.Position).magnitude

					local scaledPredictionTime = math.clamp(
						basePredictionTime * (1 - math.min(distanceToTarget / 100, 1)),
						minPredictionTime,
						maxPredictionTime
					)

					local predictedPosition = targetHRP.Position + targetVelocity * scaledPredictionTime

					local directionToTarget = (predictedPosition - wawa.Position).unit

					local Camera = game.Workspace.CurrentCamera
					local targetCFrame = CFrame.lookAt(
						Camera.CFrame.Position,
						Camera.CFrame.Position
							+ Vector3.new(directionToTarget.X, directionToTarget.Y, directionToTarget.Z)
					)

					game:GetService("TweenService")
						:Create(Camera, TweenInfo.new(AimSmoothnes, Enum.EasingStyle.Linear), { CFrame = targetCFrame })
						:Play()
				end
				task.wait()
			end

			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		end)
	end

	local function WatchPizzaTower(state)
		if not state then
			for _, connection in ipairs(pizzaConnections) do
				connection:Disconnect()
			end
			table.clear(pizzaConnections)
			return
		end

		local function onChildAdded(child)
			if child.Name == "Pizza" or child.Name == "Milk" then
				local player = game.Players.LocalPlayer
				local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if hrp then
					child.CFrame = hrp.CFrame
				end
			end
		end

		local function watchFolder()
			local ingameFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")
			if ingameFolder then
				table.insert(pizzaConnections, ingameFolder.ChildAdded:Connect(onChildAdded))
			else
				table.insert(
					pizzaConnections,
					workspace.ChildAdded:Connect(function(child)
						if child.Name == "Map" then
							table.insert(
								pizzaConnections,
								child.ChildAdded:Connect(function(subChild)
									if subChild.Name == "Ingame" then
										table.insert(pizzaConnections, subChild.ChildAdded:Connect(onChildAdded))
									end
								end)
							)
						end
					end)
				)
			end
		end

		watchFolder()
	end

	local function AutoCoinFlip()
		while CoinFlipping do
			local reroll
			repeat
				local success, result = pcall(function()
					return game
						:GetService("Players")
						.LocalPlayer
						.PlayerGui
						:WaitForChild("MainUI", 9999) -- skibdidiidiidiidididiididiididid topi9elrtlr3kvjwrfqedvhjklvjqfhkwdegvhjqvjwhdfvjkhlqwdvjhjvhkdwqjvjk
						:WaitForChild("AbilityContainer", 9991)
						:WaitForChild("Reroll", 9991)
				end)
				if success then
					reroll = result
				else
					task.wait(1)
				end
			until reroll

			if tonumber(reroll:WaitForChild("Charges").Text) < WantedChrges then
				MainRemoteEvent:FireServer("UseActorAbility", "CoinFlip")
			end
			task.wait(1)
		end
	end

	local function HandleFartContainer(LKFVJNWEFLKJWNEFLKJWNEF) -- evil mode activated 😈
		local Me = game.Players.LocalPlayer
		local LastSkibidi, LastSkebede = GetCharAndFold()

		if fart.characterChange then
			fart.characterChange:Disconnect()
		end

		fart.characterChange = Me:GetPropertyChangedSignal("Character"):Connect(function()
			task.wait(0.1)
			local newCharacter, newTeam = GetCharAndFold()

			if newCharacter ~= LastSkibidi or newTeam ~= LastSkebede then
				LastSkibidi, LastSkebede = newCharacter, newTeam
				JanitorModeEnabled(fart.abilities)
				HandleFartContainer(true)
			end
		end)

		if not LKFVJNWEFLKJWNEFLKJWNEF then
			JanitorModeEnabled(fart.abilities)
			return
		end

		local AbilityContainer =
			game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainUI"):WaitForChild("AbilityContainer")

		local function EvilEmoji(lol)
			local CharacterGender, Wowzaer = GetCharAndFold()
			if not SkibidiPomniOhioList[Wowzaer] or not SkibidiPomniOhioList[Wowzaer][CharacterGender] then
				return
			end

			local sigmaboy = lol.LayoutOrder
			local DDDDDDDurationm = "Duration" .. sigmaboy
			local VeryLongDuration = SkibidiPomniOhioList[Wowzaer][CharacterGender][DDDDDDDurationm]

			if VeryLongDuration then
				local IsSkibidiToiletMode = false
				local CONNECTOR
				if CharacterGender ~= "Chance" then
					CONNECTOR = lol:WaitForChild("CooldownTime", 0.2)
						:GetPropertyChangedSignal("Text")
						:Connect(function()
							if not IsSkibidiToiletMode and lol.CooldownTime.Text ~= "" then
								IsSkibidiToiletMode = true

								if CharacterGender == "Dusekkar" then
									local originalsmooth = AimSmoothnes
									AimSmoothnes = 0.03
									task.spawn(Aimbot, VeryLongDuration)
									AimSmoothnes = originalsmooth
								else
									task.spawn(Aimbot, VeryLongDuration)
								end

								task.spawn(function()
									repeat
										task.wait()
									until not lol.Parent or lol:WaitForChild("CooldownTime", 0.2).Text == ""
									task.wait(0.1)
									IsSkibidiToiletMode = false
								end)
							end
						end)
					table.insert(fart.abilities, CONNECTOR)
				end
			end

			local function onFlintlockTransparencyChange()
				local Flintlock = Players.LocalPlayer.Character:FindFirstChild("FlintlockGun")
					or Players.LocalPlayer.Character:FindFirstChild("Flintlock")
				if Flintlock then
					local function checkTransparency()
						if Flintlock.Transparency == 0 then
							task.spawn(Aimbot, VeryLongDuration)
						end
					end
					table.insert(
						fart.abilities,
						Flintlock:GetPropertyChangedSignal("Transparency"):Connect(checkTransparency)
					)
					checkTransparency()
				end
			end

			onFlintlockTransparencyChange()
		end

		for _, blahblahblah in ipairs(AbilityContainer:GetChildren()) do
			if blahblahblah:IsA("Frame") and blahblahblah:FindFirstChild("CooldownTime") then
				EvilEmoji(blahblahblah)
			end
		end

		for _, grrrrrr in pairs(AbilityContainer:GetChildren()) do
			if (grrrrrr:IsA("TextButton") or grrrrrr:IsA("ImageButton")) and grrrrrr:FindFirstChild("CooldownTime") then
				EvilEmoji(grrrrrr)
			end
		end

		table.insert(
			fart.abilities,
			AbilityContainer.ChildAdded:Connect(function(child)
				if (child:IsA("TextButton") or child:IsA("ImageButton")) and child:FindFirstChild("CooldownTime") then
					EvilEmoji(child)
				end
			end)
		)
	end

	local function GetAssetList()
		local url = "https://api.github.com/repos/ivannetta/ShitScripts/git/trees/main?recursive=1"
		local assetList = {}

		local success, errorMessage = pcall(function()
			local Request = http_request or syn.request or request
			if Request then
				local response = Request({
					Url = url,
					Method = "GET",
					Headers = { ["Content-Type"] = "application/json" },
				})

				if response and response.Body then
					local data = game:GetService("HttpService"):JSONDecode(response.Body)
					for _, item in ipairs(data.tree) do
						if
							item.path:match("^Assets/.+%.png$")
							or item.path:match("^Assets/.+%.mp4$")
							or item.path:match("Assets/(.+)%.mp3$")
						then
							local rawUrl = "https://raw.githubusercontent.com/ivannetta/ShitScripts/main/" .. item.path
							table.insert(assetList, rawUrl)

							local name = item.path:match("Assets/(.+)%.png$") or item.path:match("Assets/(.+)%.mp4$")
							if name then
								table.insert(NameProtectNames, name)
							end
						end
					end
				end
			end
		end)

		if not success then
			Rayfield:Notify({ Title = "Error", Content = errorMessage, Duration = 5 })
		end
		return assetList
	end

	local function DownloadBallers(url, path)
		if not isfile(path) then
			local suc, res = pcall(function()
				return game:HttpGet(url, true)
			end)
			if not suc or res == "404: Not Found" then
				Rayfield:Notify({ Title = "Error", Content = "erm not found", Duration = 5 })
			end
			writefile(path, res)
		end
	end
	local function CheckIfFartsDownloaded()
		local assetList = GetAssetList()
		local basePath = "FartHub/Assets/"
		if not isfolder("FartHub") then
			makefolder("FartHub")
		end
		if not isfolder(basePath) then
			makefolder(basePath)
		end
		for _, url in ipairs(assetList) do
			local filePath = basePath .. url:match("Assets/(.+)")
			if filePath then
				local newFilePath =
					filePath:gsub("%.png$", ".png.Fart"):gsub("%.mp4$", ".mp4.Fart4"):gsub("%.mp3$", ".mp3")
				if not isfile(newFilePath) then
					local folderPath = newFilePath:match("(.*/)")
					if folderPath and not isfolder(folderPath) then
						makefolder(folderPath)
					end
					DownloadBallers(url, newFilePath)
					Rayfield:Notify({ Title = "Downloaded", Content = newFilePath, Duration = 1, Image = "download" })
				end
			end
		end
	end

	task.delay(5, function()
		pcall(function()
			if math.random(1, 100) == 69 then
				local KingVon = Instance.new("ScreenGui", game:GetService("CoreGui"))
				local Lhbwdqk = Instance.new("Frame")
				Lhbwdqk.Parent = KingVon
				Lhbwdqk.Size = UDim2.new(1, 100, 1, 0)
				Lhbwdqk.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				local Vid = Instance.new("VideoFrame", Lhbwdqk)
				Vid.Parent = Lhbwdqk
				Vid.Size = UDim2.new(1, 0, 1, 0)
				Vid.ZIndex = 999
				Vid.Video = getcustomasset("FartHub/Assets/KingVon.mp4.Fart4")
				Vid.Playing = true
				Vid.Looped = false
				task.wait(17)
				KingVon:Destroy()
			end
		end)
	end)

	local function LoadAsset(assetName)
		local basePath = "FartHub/Assets/"
		local assetPath = basePath .. assetName

		if isfile(assetPath) then
			return getcustomasset(assetPath)
		else
			return nil
		end
	end

	local function ToggleFatMan(state)
		if state then
			WowWhatTheZestIsThis = Instance.new("ScreenGui", game:GetService("CoreGui"))
			WowWhatTheZestIsThis.Name = "FatMan"
			WowWhatTheZestIsThis.ResetOnSpawn = false
			WowWhatTheZestIsThis.DisplayOrder = 999999999

			local Frame = Instance.new("Frame", WowWhatTheZestIsThis)
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame.Name = "YAPPING"
			Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame.Size = UDim2.new(0, 100, 0, 100)

			local VideoFrame = Instance.new("VideoFrame", Frame)
			VideoFrame.Size = UDim2.new(1, 0, 1, 0)
			VideoFrame.Video = LoadAsset("FatMan.mp4.Fart4")
			VideoFrame.Looped = true
			VideoFrame.Playing = true

			local TweenService = game:GetService("TweenService")
			local screenSize = game:GetService("Workspace").CurrentCamera.ViewportSize

			local direction = Vector2.new(math.random(-1, 1), math.random(-1, 1)).Unit
			local speed = 5

			local function bounce()
				local newPos = Frame.Position
					+ UDim2.new(direction.X * speed / screenSize.X, 0, direction.Y * speed / screenSize.Y, 0)
				if newPos.X.Scale < 0 or newPos.X.Scale > 1 then
					direction = Vector2.new(-direction.X, direction.Y)
				end
				if newPos.Y.Scale < 0 or newPos.Y.Scale > 1 then
					direction = Vector2.new(direction.X, -direction.Y)
				end

				local success, mousePos = pcall(function()
					return game:GetService("UserInputService"):GetMouseLocation()
				end)
				if not success then
					mousePos = Vector2.new(-1, -1)
				end

				local framePos = Frame.AbsolutePosition
				local frameSize = Frame.AbsoluteSize
				if
					mousePos.X >= framePos.X
					and mousePos.X <= framePos.X + frameSize.X
					and mousePos.Y >= framePos.Y
					and mousePos.Y <= framePos.Y + frameSize.Y
				then
					direction = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(
						framePos.X + frameSize.X / 2,
						framePos.Y + frameSize.Y / 2
					)).Unit
					direction = -direction
				end

				local tweenInfo = TweenInfo.new(0.01, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local tween = TweenService:Create(Frame, tweenInfo, {
					Position = Frame.Position
						+ UDim2.new(direction.X * speed / screenSize.X, 0, direction.Y * speed / screenSize.Y, 0),
					Rotation = Frame.Rotation + 10,
				})
				tween:Play()
				tween.Completed:Connect(bounce)
			end

			bounce()
		else
			if WowWhatTheZestIsThis then
				WowWhatTheZestIsThis:Destroy()
			end
		end
	end

	local function LastStandingReplacement(state)
		ReplaceStandingMusic = state
		local LastStandingFolder = workspace.Themes
		if ReplaceStandingMusic then
			if LastStandingFolder then
				local connection = LastStandingFolder.ChildAdded:Connect(function(child)
					if child:IsA("Sound") and child.Name == "LastSurvivor" then
						child.SoundId = getcustomasset("FartHub/Assets/LastStandingMusic/" .. tostring(CurrentSound))
						child.TimePosition = 0
					end
				end)
				table.insert(MusicConnections, connection)
			end
		else
			if LastStandingFolder and LastStandingFolder.ChildAdded then
				Rayfield:Notify({
					Title = "Disabled Music Replace",
					Content = "Music Will Go Back To Normal Next Round",
					Duration = 10,
					Image = "music",
				}) -- 😭😭😭😭😭😭
				for _, connection in ipairs(MusicConnections) do
					connection:Disconnect()
				end
			end
		end
	end

	local function ChangeMusic(music)
		local LastStandingFolder = workspace.Themes
		if LastStandingFolder then
			for _, child in ipairs(LastStandingFolder:GetChildren()) do
				if child:IsA("Sound") and child.Name == "LastSurvivor" then
					child.SoundId = getcustomasset("FartHub/Assets/LastStandingMusic/" .. tostring(music))
					child.TimePosition = 0
				end
			end
		end
	end

	local function MoveMePlease()
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local KillerModel =
			workspace:FindFirstChild("Players"):FindFirstChild("Killers"):FindFirstChildWhichIsA("Model")
		if KillerModel then
			local KillerHRP = KillerModel:FindFirstChild("HumanoidRootPart")
			if KillerHRP then
				local PlayerHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				if PlayerHRP then
					local distance = (KillerHRP.Position - PlayerHRP.Position).magnitude
					if distance > 30 then
						return
					end
					PlayerHRP.CFrame = CFrame.lookAt(PlayerHRP.Position, KillerHRP.Position)
					local VelocityThing = Instance.new("BodyVelocity")
					VelocityThing.MaxForce = Vector3.new(9e9, 9e9, 9e9)
					VelocityThing.Velocity = (KillerHRP.Position - PlayerHRP.Position).unit
						* distance
						* VectoryMultipliery
					VelocityThing.Parent = PlayerHRP
					game.Debris:AddItem(VelocityThing, 0.25)
				end
			end
		end
	end

	local function WalkSkib(Toilet)
		local connection
		walkflinging = true
		local startTime = tick()

		connection = RunService.Heartbeat:Connect(function()
			if tick() - startTime >= Toilet then
				walkflinging = false
				connection:Disconnect()
				return
			end

			local character = game:GetService("Players").LocalPlayer.Character
			local root = character and character:FindFirstChild("HumanoidRootPart")
			local vel, movel = nil, 0.1

			while not (character and character.Parent and root and root.Parent) do
				RunService.Heartbeat:Wait()
				character = game:GetService("Players").LocalPlayer.Character
				root = character and character:FindFirstChild("HumanoidRootPart")
			end

			vel = root.Velocity
			root.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)

			RunService.RenderStepped:Wait()
			if character and character.Parent and root and root.Parent then
				root.Velocity = vel
			end

			RunService.Stepped:Wait()
			if character and character.Parent and root and root.Parent then
				root.Velocity = vel + Vector3.new(0, movel, 0)
				movel = movel * -1
			end
		end)
	end

	local function SheddyFlingy(state)
		if SheddyEnabled == state then
			return
		end
		SheddyEnabled = state
		if state then
			task.spawn(function()
				local lastCooldown = ""
				while SheddyEnabled do
					task.wait(0.1)
					local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
					local mainUI = playerGui and playerGui:FindFirstChild("MainUI")
					local abilityContainer = mainUI and mainUI:FindFirstChild("AbilityContainer")
					local slashAbility = abilityContainer
						and abilityContainer:FindFirstChild("Slash")
						and abilityContainer.Slash:FindFirstChild("CooldownTime")

					if slashAbility then
						local currentCooldown = slashAbility.Text
						if currentCooldown ~= "" and currentCooldown ~= lastCooldown then
							MoveMePlease()
							WalkSkib(2)
							local waitTime = tonumber(currentCooldown)
							if waitTime then
								task.wait(waitTime + 2)
							end
						end
						lastCooldown = currentCooldown
					end
				end
			end)
		end
	end

	local function NameProtect(state)
		local function updateNames()
			local CurrentSurvivors = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
				and game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI:FindFirstChild("PlayerInfo")
				and game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI.PlayerInfo
					:FindFirstChild("CurrentSurvivors")
			if CurrentSurvivors then
				local indices = {}
				for index in pairs(NameProtectNames) do
					table.insert(indices, index)
				end
				for i = #indices, 2, -1 do
					local j = math.random(i)
					indices[i], indices[j] = indices[j], indices[i]
				end
				for _, People in pairs(CurrentSurvivors:GetChildren()) do
					if People:IsA("Frame") then
						local name
						local success = false
						repeat
							name = NameProtectNames[indices[math.random(#indices)]]
							local asset = LoadAsset(name .. ".png.Fart")
							if asset then
								People.Icon.Image = asset
								success = true
							end
						until success
						People.Username.Text = name
					end
				end
			end
		end

		if state then
			local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
			local function setupConnections()
				local TemporaryUI = PlayerGui:WaitForChild("TemporaryUI", math.huge)
				local PlayerInfo = TemporaryUI:WaitForChild("PlayerInfo", math.huge)

				PlayerGui.ChildAdded:Connect(function(child)
					if child.Name == "TemporaryUI" then
						updateNames()
					end
				end)
				TemporaryUI.ChildAdded:Connect(function(child)
					if child.Name == "PlayerInfo" then
						updateNames()
					end
				end)
				PlayerInfo.ChildAdded:Connect(function(child)
					if child.Name == "CurrentSurvivors" then
						updateNames()
					end
				end)
			end

			setupConnections()
			updateNames()

			if PlayerGui.MainUI.PlayerListHolder then
				PlayerGui.MainUI.PlayerListHolder:Destroy()
			end
			if PlayerGui.MainUI.Spectate.Username then
				PlayerGui.MainUI.Spectate.Username.Visible = false
			end
		end
	end

	Rayfield:Notify({
		Title = supportedExecutors[executorname] and executorname .. " Executor Supported"
			or executorname .. " Executor Not Supported",
		Content = supportedExecutors[executorname] and executorname .. " No Errors Expected"
			or executorname .. " Errors Expected",
		Image = supportedExecutors[executorname] and "check" or "ban",
		Duration = 5,
	})

	local highlightingEnabled, SkibidiStaminaLoop, running, ItemFartsEnabled, Do1x1PopupsLoop, SkibidiWait, LopticaWaitTime, SkibidiRandomness =
		false, false, false, false, false, 2.5, 2, 0
	local generatorHighlightColor, survivorHighlightColor, killerHighlightColor, itemHighlightColor =
		Color3.fromRGB(173, 162, 236),
		Color3.fromRGB(0, 255, 255),
		Color3.fromRGB(255, 100, 100),
		Color3.fromRGB(255, 255, 0)

	local Items = { "Medkit", "BloxyCola" }

	local function LoadSigmaData()
		pcall(function()
			local HttpService = game:GetService("HttpService")
			local data = HttpService:JSONDecode(readfile("FartHub.json"))
			generatorHighlightColor = data.ColorOptions.Generator and Color3.fromHex(data.ColorOptions.Generator)
				or Color3.fromRGB(255, 0, 0)
			survivorHighlightColor = data.ColorOptions.Survivor and Color3.fromHex(data.ColorOptions.Survivor)
				or Color3.fromRGB(0, 255, 0)
			killerHighlightColor = data.ColorOptions.Killer and Color3.fromHex(data.ColorOptions.Killer)
				or Color3.fromRGB(0, 0, 255)
			itemHighlightColor = data.ColorOptions.Item and Color3.fromHex(data.ColorOptions.Item)
				or Color3.fromRGB(255, 255, 0)
			JoinedSigmaServer = data.Info.JoinedSigmaServer or false
			SigmaData = data
		end)
	end

	local function WriteSigmaData()
		local HttpService = game:GetService("HttpService")
		SigmaData.ColorOptions = {
			Generator = generatorHighlightColor:ToHex(),
			Survivor = survivorHighlightColor:ToHex(),
			Killer = killerHighlightColor:ToHex(),
			Item = itemHighlightColor:ToHex(),
		}
		SigmaData.Info = SigmaData.Info or {}
		SigmaData.Info.JoinedSigmaServer = JoinedSigmaServer

		writefile("FartHub.json", HttpService:JSONEncode(SigmaData))
	end

	LoadSigmaData()

	local function CreateGeneratorBillboard(generator)
		if LopticaGenBill then
			local billboard = Instance.new("BillboardGui", generator)
			billboard.Size = UDim2.new(0, 100, 0, 50)
			billboard.StudsOffset = Vector3.new(0, 2, 0)
			billboard.AlwaysOnTop = true

			local textLabel = Instance.new("TextLabel", billboard)
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.TextColor3 = Color3.new(1, 1, 1)
			textLabel.TextStrokeTransparency = 0
			textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
			textLabel.Text = string.format("%d%% Completed", generator.Progress.Value)

			generator.Progress.Changed:Connect(function()
				textLabel.Text = string.format("%d%% Completed", generator.Progress.Value)
			end)
			generator.Destroying:Connect(function()
				billboard:Destroy()
			end)
		end
	end

	-- Toggle ESP
	local function ToggleFarts(state)
		highlightingEnabled = state
		local localPlayer = game.Players.LocalPlayer
		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("Highlight") or obj:IsA("BillboardGui") then
				obj:Destroy()
			end
		end
		if not state then
			return
		end
		local function AddFart(object, color)
			if
				object:IsA("Model")
				and object ~= localPlayer.Character
				and not object:FindFirstChildOfClass("Highlight")
			then
				local h = Instance.new("Highlight", object)
				h.FillColor, h.FillTransparency, h.OutlineTransparency = color, 0.7, 0.6
			end
		end
		for _, folder in ipairs({ workspace.Players.Survivors, workspace.Players.Killers }) do
			for _, obj in ipairs(folder:GetChildren()) do
				AddFart(obj, folder.Name == "Survivors" and survivorHighlightColor or killerHighlightColor)
				local billboard = Instance.new("BillboardGui", obj:WaitForChild("Head"))
				billboard.Name = "FartHubBillboard"
				billboard.Size = UDim2.new(0, 100, 0, 50)
				billboard.StudsOffset = Vector3.new(0, 2, 0)
				local textLabel = Instance.new("TextLabel", billboard)
				textLabel.Size = UDim2.new(1, 0, 1, 0)
				textLabel.Text = obj:GetAttribute("Username") and obj.Name
				textLabel.TextColor3 = Color3.new(1, 1, 1)
				textLabel.TextStrokeTransparency = 0
				textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
				billboard.AlwaysOnTop = true
				textLabel.BackgroundTransparency = 1
			end
			folder.ChildAdded:Connect(function(child)
				if highlightingEnabled then
					AddFart(child, folder.Name == "Survivors" and survivorHighlightColor or killerHighlightColor)
					local billboard = Instance.new("BillboardGui", child:WaitForChild("Head"))
					billboard.Name = "FartHubBillboard"
					billboard.Size = UDim2.new(0, 100, 0, 50)
					billboard.StudsOffset = Vector3.new(0, 2, 0)
					local textLabel = Instance.new("TextLabel", billboard)
					textLabel.TextColor3 = Color3.new(1, 1, 1)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.Text = child:GetAttribute("Username") and child.Name
					billboard.AlwaysOnTop = true
					textLabel.BackgroundTransparency = 1
				end
			end)
		end

		local function SetupSigmaListener()
			local ingameFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")
			if not ingameFolder then
				return
			end
			local mapFolder = ingameFolder:FindFirstChild("Map")
			if not mapFolder then
				return
			end
			for _, g in ipairs(mapFolder:GetChildren()) do
				if g.Name == "Generator" then
					AddFart(g, generatorHighlightColor)
					CreateGeneratorBillboard(g)
				end
			end
			mapFolder.ChildAdded:Connect(function(child)
				if highlightingEnabled and child.Name == "Generator" then
					AddFart(child, generatorHighlightColor)
					CreateGeneratorBillboard(child)
				end
			end)
		end
		SetupSigmaListener()
		workspace.Map.ChildAdded:Connect(function(child)
			if highlightingEnabled then
				SetupSigmaListener()
			end
		end)
		workspace.Map.Ingame.ChildAdded:Connect(function(child)
			if highlightingEnabled then
				SetupSigmaListener()
			end
		end)
	end

	local function Do1x1x1x1Popups()
		while true do
			if Do1x1PopupsLoop then
				local player = game:GetService("Players").LocalPlayer
				local popups = player.PlayerGui.TemporaryUI:GetChildren()

				for _, i in ipairs(popups) do
					if i.Name == "1x1x1x1Popup" then
						local centerX = i.AbsolutePosition.X + (i.AbsoluteSize.X / 2)
						local centerY = i.AbsolutePosition.Y + (i.AbsoluteSize.Y / 2) + 50
						VIM:SendMouseButtonEvent(
							centerX,
							centerY,
							Enum.UserInputType.MouseButton1.Value,
							true,
							player.PlayerGui,
							1
						)
						VIM:SendMouseButtonEvent(
							centerX,
							centerY,
							Enum.UserInputType.MouseButton1.Value,
							false,
							player.PlayerGui,
							1
						)
					end
				end
			end
			task.wait(0.1)
		end
	end

	local function SetupSurfers(PuzzlesUi)
		local Container = PuzzlesUi:WaitForChild("Container")
		local GridHolder = Container:WaitForChild("GridHolder")
		local Surfers = Instance.new("VideoFrame", GridHolder)
		Surfers.Size = UDim2.new(1, -20, 1, -20)
		Surfers.AnchorPoint = Vector2.new(0.5, 0.5)
		Surfers.Position = UDim2.new(0.5, 0, 0.5, 0)

		Surfers.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Surfers.Video = LoadAsset(FunnyVideo)
		Surfers.Looped = true
		Surfers.Playing = true

		for _, silly in ipairs(GridHolder.Grid:GetChildren()) do
			if silly:IsA("Frame") then
				silly.Transparency = 0.6
				silly.Button.BackgroundTransparency = 0.6
			end
		end
	end

	local function SkibidiGenerator(shouldLoop)
		while shouldLoop and running do
			loopty = true
			local PuzzleUI = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PuzzleUI", 9999)

			task.wait(SkibidiWait + math.random(0, SkibidiRandomness))

			local FartNapFolder = workspace:FindFirstChild("Map")
				and workspace.Map:FindFirstChild("Ingame")
				and workspace.Map.Ingame:FindFirstChild("Map")
			if FartNapFolder then
				local closestGenerator, closestDistance = nil, math.huge
				local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				for _, g in ipairs(FartNapFolder:GetChildren()) do
					if g.Name == "Generator" and g.Progress.Value < 100 then
						local distance = (g.Main.Position - playerPosition).Magnitude
						if distance < closestDistance then
							closestDistance = distance
							closestGenerator = g
						end
					end
				end
				if closestGenerator then
					closestGenerator.Remotes.RE:FireServer()
				end
			end
		end
		loopty = false
	end

	local function GeneratorOnce()
		local FartIngameFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")
		local FartNapFolder = FartIngameFolder and FartIngameFolder:FindFirstChild("Map")
		if FartNapFolder then
			for _, g in ipairs(FartNapFolder:GetChildren()) do
				if g.Name == "Generator" and g.Progress.Value < 100 then
					g.Remotes.RE:FireServer()
				end
			end
		end
	end

	local function TpDoGenerator()
		local wasloopty = loopty
		if loopty then
			task.spawn(SkibidiGenerator(false))
		end
		local Geneators = workspace:WaitForChild("Map")
			and workspace.Map:WaitForChild("Ingame")
			and workspace.Map.Ingame:WaitForChild("Map")
		local lastPosition = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		local function findGenerators()
			local folder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")
			local map = folder and folder:FindFirstChild("Map")
			local generators = {}
			if map then
				for _, g in ipairs(map:GetChildren()) do
					if g.Name == "Generator" and g.Progress.Value < 100 then
						local playersNearby = false
						for _, player in ipairs(game.Players:GetPlayers()) do
							if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local distance = (player.Character.HumanoidRootPart.Position - g.Main.Position).Magnitude
								if distance < 25 then
									playersNearby = true
									break
								end
							end
						end
						if not playersNearby then
							table.insert(generators, g)
						end
					end
				end
			end
			if wasloopty then
				SkibidiGenerator(true)
			end
			return generators
		end

		while true do
			local generators = findGenerators()
			if #generators == 0 then
				break
			end
			for _, g in ipairs(generators) do
				local player = game.Players.LocalPlayer
				local generatorPosition = g.Instances.Generator.Progress.CFrame.Position
				local generatorDirection = (g.Instances.Generator.Cube.CFrame.Position - generatorPosition).Unit
				player.Character.HumanoidRootPart.CFrame = CFrame.new(
					generatorPosition + Vector3.new(0, 0.5, 0),
					generatorPosition + Vector3.new(generatorDirection.X, 0, generatorDirection.Z)
				)
				task.wait(LopticaWaitTime / 2)
				fireproximityprompt(g.Main:WaitForChild("Prompt", 1))
				for _ = 1, 6 do
					task.wait(2.5)
					g.Remotes.RE:FireServer()
				end
				task.wait(LopticaWaitTime / 5)
				g.Remotes.RF:InvokeServer("leave")
			end
		end

		if lastPosition then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lastPosition
		end
	end

	local function NotifyFartsakeners(Player)
		local character = Player.Character
		local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
		local temporaryUI = playerGui:FindFirstChild("TemporaryUI")
		local playerInfo = temporaryUI and temporaryUI:FindFirstChild("PlayerInfo")
		local currentSurvivors = playerInfo and playerInfo:FindFirstChild("CurrentSurvivors")

		if
			not table.find(CheckedPlayers, Player.Name)
			and Player.Name ~= game:GetService("Players").LocalPlayer.Name
		then
			Rayfield:Notify({
				Title = "Another Fartsaken User!",
				Content = (Player.Name .. " Is Also Using Fartsaken!"),
				Duration = 10,
				Image = "snail",
			})
			table.insert(CheckedPlayers, Player.Name)
		end

		if character and currentSurvivors then
			for _, survivor in pairs(currentSurvivors.Parent:GetDescendants()) do
				if survivor:FindFirstChild("Username") and survivor.Username.Text == Player.Name then
					survivor.Username.TextColor3 = Color3.fromRGB(170, 255, 127)
				end
			end
		end
	end

	task.spawn(function()
		while true do
			for _, player in ipairs(game.Players:GetPlayers()) do
				local success, err = pcall(function()
					local Pronouns = player
						:WaitForChild("PlayerData")
						:WaitForChild("Settings")
						:WaitForChild("Accessibility")
						:WaitForChild("Pronouns")
					if Pronouns.Value == "Fart/Hub" then
						NotifyFartsakeners(player)
					end
				end)

				if not success then
					warn(err)
				end
			end
			task.wait(5)
		end
	end)

	local function HawkTuah()
		if not BlockEnabled then
			return
		end

		local lastActionTime = 0
		local cooldown = 2

		if Runners then
			return
		end

		Runners = true

		local success, err = pcall(function()
			local BabyShark = workspace:WaitForChild("Players"):FindFirstChild("Killers")
			local Killer = BabyShark and BabyShark:GetChildren()[1] or nil
			local KillerHumanoid = Killer and Killer:FindFirstChildOfClass("Humanoid") or nil
			local KillerHRP = Killer and Killer:FindFirstChild("HumanoidRootPart") or nil
			local Player = game.Players.LocalPlayer
			local HRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") or nil

			if KillerHumanoid and KillerHRP and HRP then
				local animationTrack = nil
				KillerHumanoid.Animator.AnimationPlayed:Connect(function(track)
					if track.Animation and track.Priority == Enum.AnimationPriority.Action then
						animationTrack = track
					end
				end)

				game:GetService("RunService").Heartbeat:Connect(function()
					if not animationTrack or not BlockEnabled then
						return
					end

					local currentTime = tick()
					if currentTime - lastActionTime < cooldown then
						return
					end

					local distance = (HRP.Position - KillerHRP.Position).Magnitude

					if distance < SkibidiDistance and (animationTrack.Length - animationTrack.TimePosition) > 0.5 then
						MainRemoteEvent:FireServer("UseActorAbility", "Block")
						lastActionTime = currentTime

						if distance < SkibidiDistance - 1 then
							local humanoid = Player.Character:FindFirstChild("Humanoid")
							if humanoid and humanoid.Animator then
								task.wait(0.2)
								for _, track in pairs(humanoid.Animator:GetPlayingAnimationTracks()) do
									if track.Name == "rbxassetid://72722244508749" then
										Aimbot(0.5)
										MainRemoteEvent:FireServer("UseActorAbility", "Punch")
										break
									end
								end
							end
						end
					end
					task.wait(0.1)
				end)
			end
		end)

		Runners = false

		if not success then
			Rayfield:Notify({ Title = "An error occurred!", Content = err, Duration = 10 })
			return
		end
	end

	local function FlingKiller()
		local MyHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local KillerHRP =
			workspace.Players:FindFirstChild("Killers"):GetChildren()[1]:FindFirstChild("HumanoidRootPart")

		if not MyHRP or not KillerHRP then
			return
		end

		local originalPosition = MyHRP.CFrame

		WalkSkib(2)

		local connection
		local startTime = tick()
		connection = game:GetService("RunService").Heartbeat:Connect(function()
			if tick() - startTime >= 2 then
				connection:Disconnect()
				return
			end
			MyHRP.CFrame = KillerHRP.CFrame
		end)

		MyHRP.CFrame = originalPosition
	end

	local function testiclegod12()
		local killers = workspace.Players:WaitForChild("Killers")
		local survivors = workspace.Players:WaitForChild("Survivors")

		local function resetBlock()
			task.wait(5)
			Runners = false
			HawkTuah()
		end

		for _, folder in ipairs({ killers, survivors }) do
			folder.ChildAdded:Connect(resetBlock)
			folder.ChildRemoved:Connect(resetBlock)
		end
	end

	game.Players.PlayerAdded:Connect(function()
		testiclegod12()
	end)

	if game.Players.LocalPlayer then
		testiclegod12()
	end

	game:GetService("Players").ChildAdded:Connect(function(child)
		if not BlockEnabled then
			return
		end
		local success, err = pcall(function()
			if child.Name == "Killers" then
				HawkTuah()
			end
		end)
		if not success then
			Rayfield:Notify({ Title = "An error occured!", Content = err, Duration = 10, Image = "ban" })
		end
	end)

	game:GetService("Players").ChildRemoved:Connect(function(child)
		if not BlockEnabled then
			return
		end
		local success, err = pcall(function()
			if child.Name == "Killers" then
				HawkTuah()
			end
		end)
		if not success then
			Rayfield:Notify({ Title = "An error occured!", Content = err, Duration = 10, Image = "ban" })
		end
	end)

	local function ToggleFart(state)
		SkibidiStaminaLoop = state
		local success, SkibidiSprinting = pcall(function()
			return require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
		end)

		if not success then
			Rayfield:Notify({
				Title = "Error",
				Content = "Your executor doesn't support this.",
				Duration = 5,
				Image = "ban",
			})
			task.wait(5)
			return
		end

		local connection
		connection = game:GetService("RunService").Heartbeat:Connect(function()
			if not SkibidiStaminaLoop then
				connection:Disconnect()
				SkibidiSprinting.StaminaLossDisabled = nil
				return
			end
			SkibidiSprinting.StaminaLossDisabled = function() end
		end)
	end

	local function PlayBoing(Path)
		local sound = Instance.new("Sound", game:GetService("Players").LocalPlayer.Character)
		sound.SoundId = getcustomasset(Path)
		sound.PlaybackSpeed = math.random() + 0.6
		sound:Play()
	end

	local function SetProximity()
		local success, err = pcall(function()
			for _, obj in ipairs(workspace:GetDescendants()) do
				if obj:IsA("ProximityPrompt") then
					obj.HoldDuration = 0
				end
			end
		end)
		if not success then
			Rayfield:Notify({ Title = "Error", Content = err, Duration = 5 })
		end
	end

	local function ToggleSigmaItemsHighlights(state)
		ItemFartsEnabled = state
		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("Highlight") and table.find(Items, obj.Parent.Name) then
				task.wait(0.1)
				obj:Destroy()
			end
		end
		if not state then
			return
		end
		local function AddLopticaHighlight(object, color)
			if
				object:IsA("BasePart")
				and object.Parent:IsA("Model")
				and not object:FindFirstChildOfClass("Highlight")
			then
				local h = Instance.new("Highlight", object)
				h.FillColor, h.FillTransparency, h.OutlineTransparency = color, 0.7, 0.6
			end
		end
		for _, item in ipairs(Items) do
			for _, obj in ipairs(workspace.Map.Ingame:GetDescendants()) do
				if obj:IsA("Model") and obj.Name == item then
					for _, child in ipairs(obj:GetChildren()) do
						if child:IsA("BasePart") then
							AddLopticaHighlight(child, itemHighlightColor)
						end
					end
				end
			end
		end
		workspace.Map.Ingame.DescendantAdded:Connect(function(descendant)
			if ItemFartsEnabled and descendant:IsA("Model") and table.find(Items, descendant.Name) then
				for _, child in ipairs(descendant:GetChildren()) do
					if child:IsA("BasePart") then
						AddLopticaHighlight(child, itemHighlightColor)
					end
				end
			end
		end)
	end

	local function UpdateFarts()
		ToggleFarts(false)
		ToggleFarts(true)
		ToggleSigmaItemsHighlights(false)
		ToggleSigmaItemsHighlights(true)
		WriteSigmaData()
	end

	local function FortniteFlips()
		if FlipCooldown then
			return
		end

		PlayBoing("FartHub/Assets/Boing.mp3")

		FlipCooldown = true
		local character = game:GetService("Players").LocalPlayer.Character
		local hrp = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
		if not hrp or not humanoid then
			FlipCooldown = false
			return
		end

		local savedTracks = {}

		if animator then
			for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
				savedTracks[#savedTracks + 1] = { track = track, time = track.TimePosition }
				track:Stop(0)
			end
		end

		humanoid:ChangeState(Enum.HumanoidStateType.Physics)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)

		local duration = 0.45
		local steps = 120
		local startCFrame = hrp.CFrame
		local forwardVector = startCFrame.LookVector
		local upVector = Vector3.new(0, 1, 0)
		task.spawn(function()
			local startTime = tick()
			for i = 1, steps do
				local t = i / steps
				local height = 4 * (t - t ^ 2) * 10
				local nextPos = startCFrame.Position + forwardVector * (35 * t) + upVector * height
				local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)

				hrp.CFrame = CFrame.new(nextPos) * rotation
				local elapsedTime = tick() - startTime
				local expectedTime = (duration / steps) * i
				local waitTime = expectedTime - elapsedTime
				if waitTime > 0 then
					task.wait(waitTime)
				end
			end

			hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * 35) * startCFrame.Rotation
			humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
			humanoid:ChangeState(Enum.HumanoidStateType.Running)

			if animator then
				for _, data in ipairs(savedTracks) do
					local track = data.track
					track:Play()
					track.TimePosition = data.time
				end
			end
			task.wait(0.25)
			FlipCooldown = false
		end)
	end

	local function InitializeButtonGUI()
		local visible = true
		local sausageHolder =
			game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame").UnibarMenu["2"]
		local originalSize = sausageHolder.Size.X.Offset
		sausageHolder.Size = UDim2.new(0, originalSize + 144, 0, sausageHolder.Size.Y.Offset)

		for i = 1, 3 do
			local buttonFrame = Instance.new("Frame", sausageHolder)
			buttonFrame.Name = i .. "-ButtonFrame"
			buttonFrame.Size = UDim2.new(0, 44, 0, 44)
			buttonFrame.BackgroundTransparency = 1
			buttonFrame.BorderSizePixel = 0
			buttonFrame.Position = UDim2.new(0, sausageHolder.Size.X.Offset - (48 * (4 - i)), 0, 0)
			buttonFrames[i] = buttonFrame

			local imageButton = Instance.new("ImageButton", buttonFrame)
			imageButton.Name = i .. "-imageButtonFart"
			imageButton.BackgroundTransparency = 1
			imageButton.BorderSizePixel = 0
			imageButton.Size = UDim2.new(0, 32, 0, 32)
			imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
			imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
			imageButtons[i] = imageButton
		end

		local imageButton1, imageButton2, imageButton3 = imageButtons[1], imageButtons[2], imageButtons[3]

		local function toggleGUI()
			--visible = not visible
			--Rayfield:SetVisibility(visible, false)
			--sausageHolder.Size = UDim2.new(0, originalSize + (visible and 48 or 0), 0, sausageHolder.Size.Y.Offset)

			local Lighting = game:GetService("Lighting")
			local CoreGui = game:GetService("CoreGui")

			local EmoteGUI = CoreGui:FindFirstChild("FartHubEmoteGUI")
			local BlurEffect = Lighting:FindFirstChild("FartHubBlur")

			if EmoteGUI then
				LopticaCooldown = true
				local Holder = EmoteGUI:FindFirstChild("Holder")
				if Holder then
					local BlurTweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
					local TweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

					if BlurEffect then
						local blurTween = TweenService:Create(BlurEffect, BlurTweenInfo, { Size = 0 })
						blurTween:Play()
					end

					local guiTween = TweenService:Create(Holder, TweenInfo, { Size = UDim2.new(0, 0, 0, 0) })
					guiTween:Play()

					task.wait(0.25)

					if BlurEffect then
						BlurEffect:Destroy()
					end
					EmoteGUI:Destroy()
				end

				task.delay(1, function()
					LopticaCooldown = false
				end)
			else
				WHATTHEFUCKISTHISSHITCODEKLDOWQNDJQW() -- Open the UI
			end
		end

		local function Tooltip(button, desc)
			if button:FindFirstChild("Tooltip") then
				return
			end

			local tooltip = Instance.new("Frame")
			tooltip.Name = "Tooltip"
			tooltip.Size = UDim2.new(0, 0, 0, 0)
			tooltip.Position = UDim2.new(0.5, 0, 1.5, 18)
			tooltip.AnchorPoint = Vector2.new(0.5, 0.5)
			tooltip.BackgroundTransparency = 0.08
			tooltip.BackgroundColor3 = Color3.fromRGB(18, 18, 21)
			tooltip.Parent = button

			local tooltipUIC = Instance.new("UICorner")
			tooltipUIC.CornerRadius = UDim.new(1, 0)
			tooltipUIC.Parent = tooltip

			local text = Instance.new("TextLabel")
			text.Name = desc
			text.TextSize = 15
			text.Text = desc
			text.Size = UDim2.new(1, 0, 1, 0)
			text.BackgroundTransparency = 1
			text.TextColor3 = Color3.fromRGB(255, 255, 255)
			text.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
			text.Parent = tooltip

			local tween = game:GetService("TweenService"):Create(
				tooltip,
				TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ Size = UDim2.new(0, 150, 0, 44) }
			)
			tween:Play()
		end

		local function editAll()
			if imageButton1 then
				imageButton1.Image = "http://www.roblox.com/asset/?id=111190623546159"
				imageButton1.Activated:Connect(toggleGUI)
				imageButton1.MouseEnter:Connect(function()
					Tooltip(imageButton1, "AnimationUI.")
				end)
				imageButton1.MouseLeave:Connect(function()
					local tooltip = imageButton1:FindFirstChild("Tooltip")
					if tooltip then
						tooltip:Destroy()
					end
				end)
			end
			if imageButton2 then
				imageButton2.Image = "http://www.roblox.com/asset/?id=112297625224060"
				imageButton2.Activated:Connect(FortniteFlips)
				imageButton2.MouseEnter:Connect(function()
					Tooltip(imageButton2, "Frontflip.")
				end)
				imageButton2.MouseLeave:Connect(function()
					local tooltip = imageButton2:FindFirstChild("Tooltip")
					if tooltip then
						tooltip:Destroy()
					end
				end)
			end
			if imageButton3 then
				imageButton3.Image = "http://www.roblox.com/asset/?id=95210015051364"
				imageButton3.Activated:Connect(function()
					if CoolDownBlockers then
						return
					end
					CoolDownBlockers = true
					local function FakeBlock()
						if Players.LocalPlayer.Character.Humanoid then
							local humanoid = Players.LocalPlayer.Character.Humanoid
							local animator = humanoid:FindFirstChildOfClass("Animator")
								or humanoid:WaitForChild("Animator")
							if animator then
								local animation = Instance.new("Animation")
								animation.AnimationId = "rbxassetid://72722244508749"
								local animTrack = animator:LoadAnimation(animation)
								animTrack:Play()
							end
						end
					end
					PlayBoing("FartHub/Assets/Limbus.mp3")
					FakeBlock()
					task.wait(2)
					CoolDownBlockers = false
				end)
				imageButton3.MouseEnter:Connect(function()
					Tooltip(imageButton3, "FakeBlock.")
				end)
				imageButton3.MouseLeave:Connect(function()
					local tooltip = imageButton3:FindFirstChild("Tooltip")
					if tooltip then
						tooltip:Destroy()
					end
				end)
			end
		end

		task.spawn(function()
			pcall(editAll)
		end)

		sausageHolder:GetPropertyChangedSignal("Size"):Connect(function()
			if sausageHolder.Size.X.Offset == originalSize then
				sausageHolder.Size = UDim2.new(0, originalSize + 144, 0, sausageHolder.Size.Y.Offset)
			end
		end)
	end

	local function CreateSigmaFrame()
		local visible = true
		local topBarApp = game:GetService("CoreGui"):FindFirstChild("TopBarApp")
		local leftFrame = topBarApp:WaitForChild("TopBarFrame"):WaitForChild("LeftFrame")

		local sigmaFrame = Instance.new("Frame", leftFrame)
		sigmaFrame.Name = "SigmaFrame"
		sigmaFrame.Size = UDim2.new(0, 32, 0, 32)
		sigmaFrame.Position = UDim2.new(0, 0, 1, 0)
		sigmaFrame.BackgroundTransparency = 1
		sigmaFrame.LayoutOrder = 5

		local background = Instance.new("ImageLabel", sigmaFrame)
		background.Name = "Background"
		background.Size = UDim2.new(0, 32, 0, 32)
		background.Position = UDim2.new(0, 0, 0, 0)
		background.Image = "rbxasset://textures/ui/TopBar/iconBase.png"
		background.BackgroundTransparency = 1

		local icon = Instance.new("ImageButton", background)
		icon.Name = "Icon"
		icon.Size = UDim2.new(0, 36, 0, 36)
		icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		icon.AnchorPoint = Vector2.new(0.5, 0.5)
		icon.Image = "http://www.roblox.com/asset/?id=131523679474566"
		icon.BackgroundTransparency = 1

		local function toggleGUI()
			visible = not visible
			Rayfield:show(visible)
		end
		icon.Activated:Connect(toggleGUI)
	end

	local function MakeButton()
		pcall(function()
			if
				game:GetService("CoreGui"):FindFirstChild("TopBarApp")
				and game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame")
			then
				InitializeButtonGUI()
			else
				CreateSigmaFrame()
			end
		end)
	end

	local function InitializeGUI()
		GeneratorTab = GUI:CreateTab("Generators", "siren")
		VisualsTab = GUI:CreateTab("Visuals", "eye")
		PlayerTab = GUI:CreateTab("Player", "user")
		MiscTab = GUI:CreateTab("Misc", "ghost")
		BlatantTab = GUI:CreateTab("Blatant", "angry")
		AnimationsTab = GUI:CreateTab("Animations", "drama")

		--GUI:Credit({ Name = "ivannetta", Description = "meowzer", Discord = "ivannetta" })

		Rayfield:Notify({
			Title = "NOTE: Highlights Not Working Fix.",
			Content = "Reset Your Bloxtrap Settings.",
			Duration = 3.6,
			Image = "layout-grid",
		})

		Rayfield:Notify({
			Title = "Made by ivannetta",
			Content = "I feel so silly!",
			Duration = 7.2,
			Image = "disc-3",
		})

		-- Visuals Tab
		local VisualsSection = VisualsTab:CreateSection("Highlights For Things.")

		local GeneratorColor = VisualsTab:CreateColorPicker({
			Name = "Generator Color",
			Color = generatorHighlightColor,
			Callback = function(Value)
				generatorHighlightColor = Value
				UpdateFarts()
			end,
		})

		local SurvivorColor = VisualsTab:CreateColorPicker({
			Name = "Survivor Highlight Color",
			Color = survivorHighlightColor,
			Callback = function(Value)
				survivorHighlightColor = Value
				UpdateFarts()
			end,
		})

		local KillerColor = VisualsTab:CreateColorPicker({
			Name = "Killer Highlight Color",
			Color = killerHighlightColor,
			Callback = function(Value)
				killerHighlightColor = Value
				UpdateFarts()
			end,
		})

		local ItemColor = VisualsTab:CreateColorPicker({
			Name = "Item Highlight Color",
			Color = itemHighlightColor,
			Callback = function(Value)
				itemHighlightColor = Value
				UpdateFarts()
			end,
		})

		local VisuialsDivider = VisualsTab:CreateDivider()

		local VisualsToggle = VisualsTab:CreateToggle({
			Name = "Highlight Objects",
			CurrentValue = false,
			Callback = function(state)
				ToggleFarts(state)
				ToggleSigmaItemsHighlights(state)
			end,
		})

		PlayerTab:CreateSection("Funny.")

		local FortniteFlipKeybind = PlayerTab:CreateKeybind({
			Name = "Frontflip",
			CurrentKeybind = "P",
			Callback = function()
				FortniteFlips()
			end,
		})

		-- Player Tab
		local PlayerSection = PlayerTab:CreateSection("Player Related Stuff.")

		local QuickPromptsButton = PlayerTab:CreateButton({
			Name = "Quick Proximity Prompts",
			Description = "Make Proximity Prompts Finish Instantly.",
			Callback = function()
				SetProximity()
			end,
		})

		-- local CoolKidAimbotToggle = PlayerTab:CreateToggle({
		-- Name = "C00lkid Aimbot",
		-- CurrentValue = false,
		-- Callback = function(state)
		-- game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent
		-- :FireServer("SetDevice", state and "Mobile" or "PC")
		-- end,
		-- })

		local BringMePizza = PlayerTab:CreateToggle({
			Name = "Tp Elliot Pizza",
			CurrentValue = false,
			Callback = function(state)
				task.spawn(function()
					WatchPizzaTower(state)
				end)
			end,
		})

		local Do1x1x1x1PopupToggle = PlayerTab:CreateToggle({
			Name = "Auto 1x4 Popups",
			CurrentValue = false,
			Callback = function(state)
				Do1x1PopupsLoop = state
				if state then
					task.spawn(Do1x1x1x1Popups)
				end
			end,
		})

		local FovSlider = PlayerTab:CreateSlider({
			Name = "Field of View",
			Range = { 20, 120 },
			Increment = 5,
			Suffix = "Degrees",
			CurrentValue = wowzers.Value,
			Flag = "FieldOfView",
			Callback = function(value)
				game:GetService("Players").LocalPlayer.PlayerData.Settings.Game.FieldOfView.Value = value
			end,
		})

		PlayerTab:CreateDivider()

		local JumpPowerSlider = PlayerTab:CreateSlider({
			Name = "Jump Power",
			Range = { 0, 20 },
			Increment = 1,
			Suffix = "Jump Power",
			CurrentValue = 10,
			Flag = "JumpPower",
			Callback = function(value)
				game.Players.LocalPlayer.Character.Humanoid.JumpPower = value * 3
			end,
		})

		PlayerTab:CreateSection("This Might Not Work On Free Executors.")

		local DisableStaminaDrainSigmaToggle = PlayerTab:CreateToggle({
			Name = "Disable Stamina Drain",
			CurrentValue = false,
			Callback = function(state)
				task.spawn(function()
					ToggleFart(state)
				end)
			end,
		})

		PlayerTab:CreateSection("Character Specific.")

		local CFToggle = PlayerTab:CreateToggle({
			Name = "Auto Chance Coinflip",
			CurrentValue = false,
			Callback = function(state)
				CoinFlipping = state
				if state then
					task.spawn(function()
						AutoCoinFlip()
					end)
				end
			end,
		})

		local CFSlider = PlayerTab:CreateSlider({
			Name = "How many charges you want",
			Range = { 1, 3 },
			Increment = 1,
			Suffix = "Charges",
			CurrentValue = 2,
			Flag = "CoinflipSpeed",
			Callback = function(value)
				WantedChrges = value
			end,
		})

		-- Generator Tab
		local GeneratorSection = GeneratorTab:CreateSection("Solves The Puzzle For You.")

		local QuickNewGens = GeneratorTab:CreateToggle({
			Name = "Quick Generators",
			CurrentValue = false,
			Callback = function(state)
				running = state
				if state then
					task.spawn(function()
						SkibidiGenerator(true)
					end)
				end
			end,
		})

		GeneratorTab:CreateDivider()

		local GeneratorKeybind = GeneratorTab:CreateKeybind({
			Name = "Do Current Generator.",
			CurrentKeybind = "T",
			Callback = function(keybind)
				if not GeneratorKeybindCooldown then
					GeneratorOnce()
					GeneratorKeybindCooldown = true
					task.wait(2.5)
					GeneratorKeybindCooldown = false
				end
			end,
		})

		local GeneratorSpeedSlider = GeneratorTab:CreateSlider({
			Name = "Generator Speed",
			Range = { 2.5, 10 },
			Increment = 0.5,
			Suffix = "Seconds",
			CurrentValue = 2.5,
			Flag = "GeneratorSpeed",
			Callback = function(value)
				SkibidiWait = value
			end,
		})

		local GeneratorRandomness = GeneratorTab:CreateSlider({
			Name = "Generator Speed Randomness",
			Range = { 0, 10 },
			Increment = 0.1,
			Suffix = "Seconds",
			CurrentValue = 0,
			Flag = "GeneratorSpeedRand",
			Callback = function(value)
				SkibidiRandomness = value
			end,
		})

		-- Blatant Tab
		BlatantTab:CreateSection("Main.")

		local AimbotToggle = BlatantTab:CreateToggle({
			Name = "Aimbot",
			CurrentValue = false,
			Callback = function(state)
				HandleFartContainer(state)
			end,
		})

		local AutoBlockToggle = BlatantTab:CreateToggle({
			Name = "Auto Block (Experimental)",
			CurrentValue = false,
			Callback = function(state)
				BlockEnabled = state
				local success, err = pcall(function()
					if BlockEnabled then
						HawkTuah()
					end
				end)
				if not success then
					Rayfield:Notify({ Title = "An error occured!", Text = err, Duration = 10, Image = "ban" })
				end
			end,
		})

		local DistanceSlider = BlatantTab:CreateSlider({
			Name = "Auto Block Distance",
			Range = { 1, 20 },
			Increment = 1,
			Suffix = "Studs",
			CurrentValue = 6,
			Flag = "AutoBlockDistance",
			Callback = function(value)
				SkibidiDistance = value
			end,
		})

		local DistanceSlider = BlatantTab:CreateSlider({
			Name = "Smoothness Slider",
			Range = { 0.03, 0.3 },
			Increment = 0.01,
			Suffix = "Seconds",
			CurrentValue = 0.1,
			Flag = "SmoothnessSlider",
			Callback = function(value)
				AimSmoothnes = value
			end,
		})

		local PredictionSlider = BlatantTab:CreateSlider({
			Name = "Prediction Slider",
			Range = { 0.2, 1 },
			Increment = 0.01,
			Suffix = "Seconds",
			CurrentValue = 0.1,
			Flag = "Prediction Slider",
			Callback = function(value)
				PredictionMultiplier = value
			end,
		})

		BlatantTab:CreateDivider()

		local BlockKeybind = BlatantTab:CreateKeybind({
			Name = "Fake Block Keybind",
			CurrentKeybind = "Y",
			Callback = function(keybind)
				if CoolDownBlockers then
					return
				end
				CoolDownBlockers = true
				local function FakeBlock()
					if Players.LocalPlayer.Character.Humanoid then
						local humanoid = Players.LocalPlayer.Character.Humanoid
						local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
						if animator then
							local animation = Instance.new("Animation")
							animation.AnimationId = "rbxassetid://72722244508749"
							local animTrack = animator:LoadAnimation(animation)
							animTrack:Play()
						end
					end
				end
				PlayBoing("FartHub/Assets/Limbus.mp3")
				FakeBlock()
				task.wait(2)
				CoolDownBlockers = false
			end,
		})

		BlatantTab:CreateDivider()

		local SheddyFlingyToggle = BlatantTab:CreateToggle({
			Name = "Shedletsky Fling Sword ( Experimental )",
			CurrentValue = false,
			Callback = function(state)
				SheddyFlingy(state)
			end,
		})

		local SheddyVelocitySlider = BlatantTab:CreateSlider({
			Name = "Shedletsky Movement Velocity",
			Range = { 0.5, 5 },
			Increment = 0.1,
			Suffix = "Studs",
			CurrentValue = 2,
			Flag = "ShedletskyVelocitySlider",
			Callback = function(value)
				VectoryMultipliery = value
			end,
		})

		local FlingKillerButton = BlatantTab:CreateButton({
			Name = "Fling Killer",
			Description = "Self Explanatory. ( Killer Needs To Stand Still )",
			Callback = function()
				FlingKiller()
			end,
		})

		BlatantTab:CreateSection("Generator Farm.")

		-- commented out because its shit

		--local AutoFarmGeneratorsButton = BlatantTab:CreateButton({
		--	Name = "AutoFarm Generators",
		--	Description = "Serverhops, Does Generators, Forever and ever.",
		--	Callback = function()
		--		Rayfield:Notify({ Title = "Loading", Content = "pls wait stinky boy", Duration = 20, Image = "check" })
		--		loadstring(
		--			game:HttpGet("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/AutoSigma.lua", true)
		--		)()
		--	end,
		--})

		local DoAllGeneratorsButton = BlatantTab:CreateButton({
			Name = "Do ALL Generators",
			Description = "Teleport to all generators and do them.",
			Callback = function()
				TpDoGenerator()
			end,
		})

		local DoAllGenSpeedSlider = BlatantTab:CreateSlider({
			Name = "Do ALL Generators Speed",
			Range = { 3, 10 },
			Increment = 0.1,
			Suffix = "Seconds",
			CurrentValue = 3,
			Flag = "DoAllGeneratorsSpeed",
			Callback = function(value)
				LopticaWaitTime = value
			end,
		})

		-- Misc Tab
		local MiscTitle = MiscTab:CreateSection("Funny Things.")

		local FatManToggle = MiscTab:CreateToggle({
			Name = "Toggle FatMan",
			CurrentValue = false,
			Callback = function(state)
				ToggleFatMan(state)
			end,
		})

		local LowSpanModeButton = MiscTab:CreateButton({
			Name = "Low Attention Span Mode",
			Description = "Activate Low Attention Span Mode",
			Callback = function()
				if not _G.LowAttentionSpanModeActivated then
					_G.LowAttentionSpanModeActivated = true
					PlayerGui.ChildAdded:Connect(function(child)
						if child.Name == "PuzzleUI" then
							SetupSurfers(child)
						end
					end)
				else
					Rayfield:Notify({
						Title = "bro",
						Content = "its already on",
						Duration = 3,
						Image = "ban",
					})
				end
			end,
		})

		local LopticaDropdown = MiscTab:CreateDropdown({
			Name = "Background Video.",
			Options = {
				"Subway Surfers",
				"Minecraft Parkour",
				"Family Guy",
				"CS2",
				"Smily",
				"Necromancy",
				"HairyTwinkle",
				"PistonDoor",
				"Oh My Boy",
				"Kendrake",
				"Total Extermination",
				"Random",
			},
			CurrentOption = { "Subway Surfers" },
			MultipleOptions = false,
			Callback = function(Options)
				local videos = {
					["Subway Surfers"] = "SubwaySurfers.mp4.Fart4",
					["Minecraft Parkour"] = "Minecraft.mp4.Fart4",
					["Family Guy"] = "FamilyGuy.mp4.Fart4",
					["CS2"] = "CS2.mp4.Fart4",
					["Smily"] = "SibidiToiletRizz.mp4.Fart4",
					["Necromancy"] = "Necromancy.mp4.Fart4",
					["HairyTwinkle"] = "HairyTwinkle.mp4.Fart4",
					["PistonDoor"] = "PistonDoor.mp4.Fart4",
					["Kendrake"] = "SomethingScary.mp4.Fart4",
					["Oh My Boy"] = "OhMyBoy.mp4.Fart4",
					["Total Extermination"] = "EvilFight.mp4.Fart4",
				}

				local videoKeys = {}
				for key in pairs(videos) do
					table.insert(videoKeys, key)
				end

				FunnyVideo = videos[Options[1]] or FunnyVideo

				if Options[1] == "Random" then
					task.spawn(function()
						local index = 1
						while Options[1] == "Random" do
							FunnyVideo = videos[videoKeys[index]]
							index = index + 1
							if index > #videoKeys then
								index = 1
							end
							task.wait(3)
						end
					end)
				end
			end,
		})

		MiscTab:CreateSection("Useful Things.")

		local NameProtectActivated = false
		local NameProtectButton = MiscTab:CreateButton({
			Name = "NameProtect",
			Description = "Replaces everyone's names and images with pmoon.",
			Callback = function()
				if not NameProtectActivated then
					NameProtect(true)
					NameProtectActivated = true
				else
					Rayfield:Notify({
						Title = "Already Activated",
						Content = "NameProtect is already activated.",
						Duration = 5,
						Image = "ban",
					})
				end
			end,
		})

		MiscTab:CreateSection("Music Replacement.")

		local MusicDropdown = MiscTab:CreateDropdown({
			Name = "Music List",
			Options = {
				"RottenGirl",
				":3",
				"GODDESS OF INDIFERENCE",
				"Canto 3 Boss Battle",
				"Sigma Boy Phonk",
				"McMental",
				"GrassSkirt",
			},
			CurrentOption = { "RottenGirl" },
			MultipleOptions = false,
			Callback = function(Options)
				CurrentSound = MusicList[Options[1]]
				if ReplaceStandingMusic then
					ChangeMusic(CurrentSound)
				end
			end,
		})

		local MusicToggle = MiscTab:CreateToggle({
			Name = "Replace Last Standing Music",
			CurrentValue = false,
			Callback = function(state)
				LastStandingReplacement(state)
				if ReplaceStandingMusic then
					ChangeMusic(CurrentSound)
				end
			end,
		})

		AnimationsTab:CreateSection("You can emote as killer using this.")

		local AnimationsTabKeybindGUI = AnimationsTab:CreateKeybind({
			Name = "Emote As Killer GUI",
			CurrentKeybind = "J",
			Callback = function(keybind)
				if LopticaCooldown then
					return
				end

				local Lighting = game:GetService("Lighting")
				local CoreGui = game:GetService("CoreGui")

				local EmoteGUI = CoreGui:FindFirstChild("FartHubEmoteGUI")
				local BlurEffect = Lighting:FindFirstChild("FartHubBlur")

				if EmoteGUI then
					LopticaCooldown = true
					local Holder = EmoteGUI:FindFirstChild("Holder")
					if Holder then
						local BlurTweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
						local TweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

						if BlurEffect then
							local blurTween = TweenService:Create(BlurEffect, BlurTweenInfo, { Size = 0 })
							blurTween:Play()
						end

						local guiTween = TweenService:Create(Holder, TweenInfo, { Size = UDim2.new(0, 0, 0, 0) })
						guiTween:Play()

						task.wait(0.25)

						if BlurEffect then
							BlurEffect:Destroy()
						end
						EmoteGUI:Destroy()
					end

					task.delay(1, function()
						LopticaCooldown = false
					end)
				else
					WHATTHEFUCKISTHISSHITCODEKLDOWQNDJQW() -- Open the UI
				end
			end,
		})

		-- dead cuz no longer mercury lib
		--if not JoinedSigmaServer then
		--	GUI:Prompt({
		--		Title = "Join Fart Hub discord server?",
		--		Text = "It would help alot, and you can get early access to features!!!",
		--		Buttons = {
		--			["Ya :3"] = function()
		--				setclipboard("https://discord.gg/AC4usvpwVY")
		--				GUI:Notification({ Title = "Discord Link Copied", Text = "i love you", Duration = 10 })
		--				JoinedSigmaServer = true
		--				WriteSigmaData()
		--			end,
		--			["No i hate you"] = function()
		--				GUI:Notification({ Title = "Ok :(", Text = "I understand.", Duration = 10 })
		--				WriteSigmaData()
		--			end,
		--		},
		--	})
		--end
	end

	local function CheckAndDeleteAssets()
		local basePath = "FartHub/Assets/"
		local sigmaFilePath = "FartHub/Sigma.txt"

		if not isfile(sigmaFilePath) then
			if isfolder(basePath) then
				for _, file in ipairs(listfiles(basePath)) do
					delfile(file)
				end
				delfolder(basePath)
			end
			writefile(sigmaFilePath, "Sigma file created.")
		end
	end

	pcall(CheckAndDeleteAssets)
	task.spawn(function()
		pcall(CheckIfFartsDownloaded)
	end)

	InitializeGUI()
	MakeButton()
end

FartHubLoad()
