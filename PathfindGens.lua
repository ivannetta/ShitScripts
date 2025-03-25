task.wait(5)
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local DCWebhook = (getgenv and getgenv().DiscordWebhook) or false
local GenTime = tonumber(getgenv and getgenv().GeneratorTime) or 2.5
if DCWebhook == "" then
	DCWebhook = false
end
local ProfilePicture = ""

-- local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
-- if queueteleport then
-- 	queueteleport([[
--         if getgenv then getgenv().DiscordWebhook = "]] .. tostring(DCWebhook) .. [[" end
--         loadstring(game:HttpGet('https://raw.githubusercontent.com/ivannetta/ShitScripts/main/PathfindGens.lua'))()
--     ]])
-- end

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "PathfindGens",
	Text = "Sigma Loaded 2",
	Duration = 30,
})

local function GetProfilePicture()
	local PlayerID = game:GetService("Players").LocalPlayer.UserId
	local request = request or http_request or syn.request
	local response = request({
		Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
			.. PlayerID
			.. "&size=180x180&format=png",
		Method = "GET",
		Headers = {
			["User-Agent"] = "Mozilla/5.0",
		},
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

local Controller =
	require(game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
Controller:Disable()

local function teleportToRandomServer()
	local Counter = 0
	local MaxRetry = 10
	local RetryingDelays = 10

	local Request = http_request or syn.request or request
	if Request then
		local url = "https://games.roblox.com/v1/games/18687417158/servers/Public?sortOrder=Asc&limit=100"

		while Counter < MaxRetry do
			local success, response = pcall(function()
				return Request({
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
						TeleportService:TeleportToPlaceInstance(18687417158, server.id, Players.LocalPlayer)
						return
					end
				end
			end

			Counter = Counter + 1
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Grahh",
				Text = "Serverhop got ratelimited im angry",
				Duration = 11,
			})
			task.wait(RetryingDelays)
		end
	end
end

task.delay(5, function()
	pcall(function()
		local timer = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("RoundTimer").Main.Time.ContentText
		local minutes, seconds = timer:match("(%d+):(%d+)")
		local totalSeconds = tonumber(minutes) * 60 + tonumber(seconds)
		print(totalSeconds .. " Left till round end.")
		if totalSeconds > 90 then
			teleportToRandomServer()
		end
	end)
end)

local function findGenerators()
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
		local player = Players.LocalPlayer
		local character = player.Character
		if not character or not character:FindFirstChild("HumanoidRootPart") then
			return false
		end
		local rootPart = character:FindFirstChild("HumanoidRootPart")
		local aPosition = a:IsA("Model") and a:GetPivot().Position or a.Position
		local bPosition = b:IsA("Model") and b:GetPivot().Position or b.Position
		return (aPosition - rootPart.Position).Magnitude < (bPosition - rootPart.Position).Magnitude
	end)

	return generators
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
	local success, SkibidiSprinting = pcall(function()
		local a = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
		a.StaminaLossDisabled = true
	end)

	local activeNodes = {}

	local function createNode(position)
		local part = Instance.new("Part")
		part.Size = Vector3.new(.6, .6, .6)
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

	if not generator or not generator.Parent then return false end
	if not Players.LocalPlayer.Character or not Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return false end

	local humanoid = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	local rootPart = Players.LocalPlayer.Character.HumanoidRootPart
	if not humanoid then
		return false
		end

	local targetPosition = generator:GetPivot().Position
	if not targetPosition then
		return false
	end

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
	for _, g in ipairs(findGenerators()) do
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
				task.wait(0.2)
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
	teleportToRandomServer()
end

local function AmIInGameYet()
	workspace.Players.Survivors.ChildAdded:Connect(function(child)
		task.wait(1)
		if child == game:GetService("Players").LocalPlayer.Character then
			task.wait(4)
			local VIMVIM = game:GetService("VirtualInputManager")
			VIMVIM:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, nil)
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
			        		local seconds = game:GetService("Players").LocalPlayer.PlayerData.Stats.General.TimePlayed.Value
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
				task.wait(.5)
				teleportToRandomServer()
				break
			end
		end
	end
end

pcall(task.spawn(DidiDie))
AmIInGameYet()
