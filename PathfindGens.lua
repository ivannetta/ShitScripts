--!nocheck
if getgenv and tonumber(getgenv().LoadTime) then
	task.wait(tonumber(getgenv().LoadTime))
else
	repeat
		task.wait()
	until game:IsLoaded()
end

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local DCWebhook = (getgenv and getgenv().DiscordWebhook) or false
local GenTime = tonumber(getgenv and getgenv().GeneratorTime) or 2.5

-- local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
-- if queueteleport then
-- 	queueteleport([[
--         if getgenv then getgenv().DiscordWebhook = "]] .. tostring(DCWebhook) .. [[" end
--         loadstring(game:HttpGet('https://raw.githubusercontent.com/ivannetta/ShitScripts/main/PathfindGens.lua'))()
--     ]])
-- end

local NotificationUI: ScreenGui
local NotificationsTable: { Instance: Frame } = {}
local ProfilePicture: string = ""
local SprintingModule: any

if DCWebhook == "" then
	DCWebhook = false
end

local function CreateNotificationUI()
	if NotificationUI then
		return NotificationUI
	end

	NotificationUI = Instance.new("ScreenGui")
	NotificationUI.Name = "NotificationUI"
	NotificationUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	NotificationUI.Parent = game:GetService("CoreGui")

	return NotificationUI
end

local function MakeNotif(title, message, duration, color)
	local ui = CreateNotificationUI()

	title = title or "Notification"
	message = message or ""
	duration = duration or 5
	color = color or Color3.fromRGB(255, 200, 0)

	local notification = Instance.new("Frame")
	notification.Name = "Notification"
	notification.Size = UDim2.new(0, 250, 0, 80)
	notification.Position = UDim2.new(1, 50, 1, 10)
	notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	notification.BorderSizePixel = 0
	notification.Parent = ui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = notification

	local SIGMABERFIOENEW = Instance.new("TextLabel")
	SIGMABERFIOENEW.Name = "Title"
	SIGMABERFIOENEW.Size = UDim2.new(1, -25, 0, 25)
	SIGMABERFIOENEW.Position = UDim2.new(0, 15, 0, 5)
	SIGMABERFIOENEW.Font = Enum.Font.SourceSansBold
	SIGMABERFIOENEW.Text = title
	SIGMABERFIOENEW.TextSize = 18
	SIGMABERFIOENEW.TextColor3 = color
	SIGMABERFIOENEW.BackgroundTransparency = 1
	SIGMABERFIOENEW.TextXAlignment = Enum.TextXAlignment.Left
	SIGMABERFIOENEW.Parent = notification

	local messageLabel = Instance.new("TextLabel")
	messageLabel.Name = "Message"
	messageLabel.Size = UDim2.new(1, -25, 0, 50)
	messageLabel.Position = UDim2.new(0, 15, 0, 30)
	messageLabel.Font = Enum.Font.SourceSans
	messageLabel.Text = message
	messageLabel.TextSize = 16
	messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	messageLabel.BackgroundTransparency = 1
	messageLabel.TextXAlignment = Enum.TextXAlignment.Left
	messageLabel.TextWrapped = true
	messageLabel.Parent = notification

	local colorBar = Instance.new("Frame")
	colorBar.Name = "ColorBar"
	colorBar.Size = UDim2.new(0, 5, 1, 0)
	colorBar.Position = UDim2.new(0, 0, 0, 0)
	colorBar.BackgroundColor3 = color
	colorBar.BorderSizePixel = 0
	colorBar.Parent = notification

	local barCorner = Instance.new("UICorner")
	barCorner.CornerRadius = UDim.new(0, 8)
	barCorner.Parent = colorBar

	local offsit = 0
	for _, notif in pairs(NotificationsTable) do
		if notif.Instance and notif.Instance.Parent then
			offsit = offsit + notif.Instance.Size.Y.Offset + 10
		end
	end

	local tagit = UDim2.new(1, -270, 1, -90 - offsit)

	table.insert(NotificationsTable, {
		Instance = notification,
		ExpireTime = os.time() + duration,
	})

	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	local ok = game:GetService("TweenService"):Create(notification, tweenInfo, { Position = tagit })
	ok:Play()

	task.spawn(function()
		task.wait(duration)

		local tweenOut = game:GetService("TweenService"):Create(
			notification,
			TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
			{ Position = UDim2.new(1, 50, notification.Position.Y.Scale, notification.Position.Y.Offset) }
		)

		tweenOut:Play()
		tweenOut.Completed:Wait()

		for i, notif in pairs(NotificationsTable) do
			if notif.Instance == notification then
				table.remove(NotificationsTable, i)
				break
			end
		end

		notification:Destroy()

		task.wait()
		local currentOffset = 0
		for _, notif in pairs(NotificationsTable) do
			if notif.Instance and notif.Instance.Parent then
				game:GetService("TweenService")
					:Create(
						notif.Instance,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Position = UDim2.new(1, -270, 1, -90 - currentOffset) }
					)
					:Play()

				currentOffset = currentOffset + notif.Instance.Size.Y.Offset + 10
			end
		end
	end)

	return notification
end

task.spawn(function()
	while task.wait(1) do
		local currentTime = os.time()
		local reposition = false

		for i = #NotificationsTable, 1, -1 do
			local notif = NotificationsTable[i]
			if currentTime > notif.ExpireTime and notif.Instance and notif.Instance.Parent then
				notif.Instance:Destroy()
				table.remove(NotificationsTable, i)
				reposition = true
			end
		end

		if reposition then
			local currentOffset = 0
			for _, notif in pairs(NotificationsTable) do
				if notif.Instance and notif.Instance.Parent then
					notif.Instance.Position = UDim2.new(1, -270, 1, -90 - currentOffset)
					currentOffset = currentOffset + notif.Instance.Size.Y.Offset + 10
				end
			end
		end
	end
end)

MakeNotif("Gen Pathfinding Shit", "It Loaded!", 5, Color3.fromRGB(115, 194, 89))

local function GetProfilePicture()
	local PlayerID = game:GetService("Players").LocalPlayer.UserId
	local request = request or http_request or syn.request
	local response = request({
		Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
			.. PlayerID
			.. "&size=180x180&format=png",
		Method = "GET",
	})
	local urlStart, urlEnd = string.find(response.Body, "https://[%w-_%.%?%.:/%+=&]+")
	if urlStart and urlEnd then
		ProfilePicture = string.sub(response.Body, urlStart, urlEnd)
	else
		ProfilePicture = "https://cdn.sussy.dev/bleh.jpg"
	end
end

if DCWebhook then
	GetProfilePicture()
end

local function SendWebhook(Title, Description, Color, ProfilePicture, Footer)
	if not DCWebhook then
		return
	end
	local request = request or http_request or syn.request
	if not request then
		return
	end

	local success, errorMessage = pcall(function()
		local response = request({
			Url = DCWebhook,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = game:GetService("HttpService"):JSONEncode({
				username = game:GetService("Players").LocalPlayer.DisplayName,
				avatar_url = ProfilePicture,
				embeds = {
					{
						title = Title,
						description = Description,
						color = Color,
						footer = { text = Footer },
					},
				},
			}),
		})
		if response and response.Body then
			print(response.Body)
		end
	end)

	MakeNotif("PathfindGens", "Sent webhook: " .. Title .. "\n" .. Description, 5, Color3.fromRGB(115, 194, 89))
	if not success then
		print("Error: " .. errorMessage)
	end
end

task.spawn(function()
	pcall(function()
		game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer(
			"UpdateSettings",
			game:GetService("Players").LocalPlayer.PlayerData.Settings.Game.MaliceDisabled,
			true
		)
	end)
end)

if _G.CancelPathEvent then
	_G.CancelPathEvent:Fire()
end

_G.CancelPathEvent = Instance.new("BindableEvent")

pcall(function()
	local Controller = require(LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
	Controller:Disable()
end)

local function TpRandom()
	local Counter = 0
	local MaxRetry = 10
	local RetryingDelays = 10

	if request then
		local url = "https://games.roblox.com/v1/games/18687417158/servers/Public?sortOrder=Asc&limit=100"

		while Counter < MaxRetry do
			local success, response = pcall(function()
				return request({
					Url = url,
					Method = "GET",
					Headers = { ["Content-Type"] = "application/json" },
				})
			end)

			if success and response and response.Body then
				local data = HttpService:JSONDecode(response.Body)
				if data and data.data and #data.data > 0 then
					local server = data.data[math.random(1, #data.data)]
					if server.id then
						MakeNotif(
							"Teleporting...",
							"Attempting to teleport to server: " .. server.id,
							5,
							Color3.fromRGB(115, 194, 89)
						)
						task.wait(0.25)
						TeleportService:TeleportToPlaceInstance(18687417158, server.id, Players.LocalPlayer)
						return
					end
				end
			end

			Counter = Counter + 1
			MakeNotif(
				"PathfindGens",
				"Retrying to get a server... Attempt " .. Counter .. "/" .. MaxRetry,
				5,
				Color3.fromRGB(255, 0, 0)
			)
			task.wait(RetryingDelays)
		end
	end
end

task.delay(2.5, function()
	pcall(function()
		local timer = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("RoundTimer").Main.Time.ContentText
		local minutes, seconds = timer:match("(%d+):(%d+)")
		local totalSeconds = tonumber(minutes) * 60 + tonumber(seconds)
		print(totalSeconds .. " Left till round end.")
		MakeNotif("PathfindGens", "Round ends in " .. totalSeconds .. " seconds.", 5, Color3.fromRGB(115, 194, 89))
		if totalSeconds > 50 then
			TpRandom()
		end
	end)
end)

local function FindGen()
	local folder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")
	local map = folder and folder:FindFirstChild("Map")
	local generators = {}
	if map then
		for _, g in ipairs(map:GetChildren()) do
			if g.Name == "Generator" and g.Progress.Value < 100 then
				local playersNearby = false
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= Players.LocalPlayer and player:DistanceFromCharacter(g:GetPivot().Position) <= 25 then
						playersNearby = true
					end
				end
				if not playersNearby then
					table.insert(generators, g)
				end
			end
		end
	end

	table.sort(generators, function(a, b)
		local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
		if not killersFolder then
			return false
		end

		local killers = killersFolder:GetChildren()
		if #killers == 0 then
			return false
		end

		local killer = killers[1]
		if not killer or not killer:FindFirstChild("HumanoidRootPart") then
			return false
		end

		local killerPosition = killer.HumanoidRootPart.Position
		local aPosition = a:IsA("Model") and a:GetPivot().Position or a.Position
		local bPosition = b:IsA("Model") and b:GetPivot().Position or b.Position
		return (aPosition - killerPosition).Magnitude > (bPosition - killerPosition).Magnitude
	end)

	return generators
end

local function VisualizePivot(model)
	local pivot = model:GetPivot()

	for i, dir in ipairs({
		{ pivot.LookVector, Color3.fromRGB(0, 255, 0), "Front" },
		{ -pivot.LookVector, Color3.fromRGB(255, 0, 0), "Back" },
		{ pivot.RightVector, Color3.fromRGB(255, 255, 0), "Right" },
		{ -pivot.RightVector, Color3.fromRGB(0, 0, 255), "Left" },
	}) do
		local part = Instance.new("Part")
		part.Size = Vector3.new(1, 1, 1)
		part.Anchored = true
		part.CanCollide = false
		part.Color = dir[2]
		part.Name = dir[3]
		part.Position = pivot.Position + dir[1] * 5
		part.Parent = workspace
	end
end

local function InGenerator()
	for i, v in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI:GetChildren()) do
		print(v.Name)
		if string.sub(v.Name, 1, 3) == "Gen" then
			print("not in generator")
			return false
		end
	end
	print("didnt find frame")
	return true
end

local function PathFinding(generator)
	pcall(function()
		SprintingModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
		SprintingModule.StaminaLossDisabled = true
	end)

	local activeNodes = {}

	local function createNode(position)
		local part = Instance.new("Part")
		part.Size = Vector3.new(0.6, 0.6, 0.6)
		part.Shape = Enum.PartType.Ball
		part.Material = Enum.Material.Neon
		part.Color = Color3.fromRGB(248, 255, 150)
		part.Transparency = 0.5
		part.Anchored = true
		part.CanCollide = false
		part.Position = position + Vector3.new(0, 1.5, 0)
		part.Parent = workspace
		table.insert(activeNodes, part)
		game:GetService("Debris"):AddItem(part, 15)
	end

	local acidContainer = workspace:FindFirstChild("Map")
		and workspace.Map:FindFirstChild("Ingame")
		and workspace.Map.Ingame:FindFirstChild("Map")
		and workspace.Map.Ingame.Map:FindFirstChild("AcidContainer")
		and workspace.Map.Ingame.Map.AcidContainer:FindFirstChild("AcidDirt")
	if acidContainer then
		for _, part in ipairs(acidContainer:GetChildren()) do
			if part.Name == "Dirt" and part.Size.Y < 12 then
				part.Size = Vector3.new(part.Size.X, 13, part.Size.Z)
			end
		end
	end

	if not generator or not generator.Parent then
		return false
	end
	if not Players.LocalPlayer.Character or not Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return false
	end

	local humanoid = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	local rootPart = Players.LocalPlayer.Character.HumanoidRootPart
	if not humanoid then
		return false
	end

	local targetPosition = generator:GetPivot().Position + generator:GetPivot().LookVector * 3
	if not targetPosition then
		return false
	end

	VisualizePivot(generator)

	local path = game:GetService("PathfindingService"):CreatePath({
		AgentRadius = 2.5,
		AgentHeight = 1,
		AgentCanJump = false,
	})

	local success, errorMessage = pcall(function()
		path:ComputeAsync(rootPart.Position, targetPosition)
	end)

	if not success or path.Status ~= Enum.PathStatus.Success then
		print("Path computation failed:", errorMessage)
		return false
	end

	local waypoints = path:GetWaypoints()

	if #waypoints <= 1 then
		return false
	end

	for i, waypoint in ipairs(waypoints) do
		createNode(waypoint.Position)
		humanoid:MoveTo(waypoint.Position)
		SprintingModule.IsSprinting = true
		LocalPlayer.Character.SpeedMultipliers.Sprinting.Value = 2.15

		local reachedWaypoint = false
		local startTime = tick()
		while not reachedWaypoint and tick() - startTime < 5 do
			local distance = (rootPart.Position - waypoint.Position).Magnitude
			if distance < 5 then
				reachedWaypoint = true
				break
			end
			RunService.Heartbeat:Wait()
		end

		if not reachedWaypoint then
			return false
		end
	end

	for _, node in ipairs(activeNodes) do
		node:Destroy()
	end

	return true
end

local function DoAllGenerators()
	for _, g in ipairs(FindGen()) do
		local pathStarted = false
		for attempt = 1, 3 do
			-- dont need cuz im sigma mafiza boy
			-- local playersNearby = false
			-- for _, player in ipairs(Players:GetPlayers()) do
			-- 	if player ~= Players.LocalPlayer and player:DistanceFromCharacter(g:GetPivot().Position) <= 25 then
			-- 		playersNearby = true
			-- 		break
			-- 	end
			-- end

			if (Players.LocalPlayer.Character:GetPivot().Position - g:GetPivot().Position).Magnitude > 500 then
				break
			end

			-- if not playersNearby and g:FindFirstChild("Progress") and g.Progress.Value < 100 then
			-- g:GetPivot()
			-- end

			pathStarted = PathFinding(g)
			if pathStarted then
				break
			else
				task.wait(1)
			end
		end
		if pathStarted then
			task.wait(0.5)
			local prompt = g:FindFirstChild("Main") and g.Main:FindFirstChild("Prompt")
			if prompt then
				fireproximityprompt(prompt)
				task.wait(0.5)
				if not InGenerator() then
					local positions = {
						g:GetPivot().Position - g:GetPivot().RightVector * 3,
						g:GetPivot().Position + g:GetPivot().RightVector * 3,
					}
					for i, pos in ipairs(positions) do
						print("Trying position", i)
						Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
						task.wait(0.25)
						fireproximityprompt(prompt)
						if InGenerator() then
							break
						end
					end
				end
			end
			for i = 1, 6 do
				if g.Progress.Value < 100 and g:FindFirstChild("Remotes") and g.Remotes:FindFirstChild("RE") then
					g.Remotes.RE:FireServer()
				end
				if i < 6 and g.Progress.Value < 100 then
					task.wait(GenTime)
				end
			end
		else
			return
		end
	end
	SendWebhook(
		"Generator Autofarm thing",
		"Finished all generators, Current Balance: "
			.. game:GetService("Players").LocalPlayer.PlayerData.Stats.Currency.Money.Value
			.. "\nTime Played: "
			.. (function()
				local seconds = game:GetService("Players").LocalPlayer.PlayerData.Stats.General.TimePlayed.Value
				local days = math.floor(seconds / (60 * 60 * 24))
				seconds = seconds % (60 * 60 * 24)
				local hours = math.floor(seconds / (60 * 60))
				seconds = seconds % (60 * 60)
				local minutes = math.floor(seconds / 60)
				seconds = seconds % 60
				return string.format("%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
			end)(),
		0x00FF00,
		ProfilePicture,
		".gg/fartsaken | <3"
	)
	task.wait(1)
	TpRandom()
end

local function AmIInGameYet()

	if LocalPlayer.Character.Parent == workspace.Players.Survivors then
		DoAllGenerators()
	end

	workspace.Players.Survivors.ChildAdded:Connect(function(child)
		task.wait(1)
		if child == game:GetService("Players").LocalPlayer.Character then
			task.wait(4)
			DoAllGenerators()
		end
	end)
end

local function DidiDie()
	while task.wait(0.5) do
		if Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
			if Players.LocalPlayer.Character.Humanoid.Health == 0 then
				SendWebhook(
					"Generator Autofarm",
					"THIS STUPID KILLER KILLED ME IM SO ANGRY OMG \nCurrent Balance: "
						.. game:GetService("Players").LocalPlayer.PlayerData.Stats.Currency.Money.Value
						.. "\nTime Played: "
						.. (function()
							local seconds =
								game:GetService("Players").LocalPlayer.PlayerData.Stats.General.TimePlayed.Value
							local days = math.floor(seconds / (60 * 60 * 24))
							seconds = seconds % (60 * 60 * 24)
							local hours = math.floor(seconds / (60 * 60))
							seconds = seconds % (60 * 60)
							local minutes = math.floor(seconds / 60)
							seconds = seconds % 60
							return string.format("%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
						end)(),
					0xFF0000,
					ProfilePicture,
					".gg/fartsaken | <3"
				)
				task.wait(0.5)
				TpRandom()
				break
			end
		end
	end
end

pcall(task.spawn(DidiDie))
AmIInGameYet()
