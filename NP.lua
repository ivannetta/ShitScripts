local HttpService = game:GetService("HttpService")
local players = game:GetService('Players')

if not getgenv().Config then
    getgenv().Config = {
        Headless = false,
        FakeDisplayName = "Stupid Fart",
        FakeName = "gayboy",
        FakeId = 39348582,
    }
end

function disguisechar(char, id)
	task.spawn(function()
        print('called')
		if not char then
			return
		end
		local hum = char:FindFirstChildOfClass('Humanoid')
		char:WaitForChild("Head")
		local desc
		if desc == nil then
			local suc = false
			repeat
				suc = pcall(function()
					desc = players:GetHumanoidDescriptionFromUserId(id)
				end)
				task.wait(1)
			until suc
		end
		desc.HeightScale = hum:WaitForChild("HumanoidDescription").HeightScale
		char.Archivable = true
		local disguiseclone = char:Clone()
		disguiseclone.Name = "disguisechar"
		disguiseclone.Parent = workspace
		for i, v in pairs(disguiseclone:GetChildren()) do
			if v:IsA("Accessory") or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") then
				v:Destroy()
			end
		end
		disguiseclone.Humanoid:ApplyDescriptionClientServer(desc)
		for i, v in pairs(char:GetChildren()) do
			if (v:IsA("Accessory") and v:GetAttribute("InvItem") == nil and v:GetAttribute("ArmorSlot") == nil) or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then
				v.Parent = game
			end
		end
		char.ChildAdded:Connect(function(v)
			if ((v:IsA("Accessory") and v:GetAttribute("InvItem") == nil and v:GetAttribute("ArmorSlot") == nil) or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors")) and v:GetAttribute("Disguise") == nil then
				repeat
					task.wait()
					v.Parent = game
				until v.Parent == game
			end
		end)
		for i, v in pairs(disguiseclone:WaitForChild("Animate"):GetChildren()) do
			v:SetAttribute("Disguise", true)
			local real = char.Animate:FindFirstChild(v.Name)
			if v:IsA("StringValue") and real then
				real.Parent = game
				v.Parent = char.Animate
			end
		end
		for i, v in pairs(disguiseclone:GetChildren()) do
			v:SetAttribute("Disguise", true)
			if v:IsA("Accessory") then
				for i2, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("Weld") and v2.Part1 then
						v2.Part1 = char[v2.Part1.Name]
					end
				end
				v.Parent = char
			elseif v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then
				v.Parent = char
			elseif v.Name == "Head" and v:FindFirstChildOfClass('SpecialMesh') then
				char.Head:FindFirstChildOfClass('SpecialMesh').MeshId = v:FindFirstChildOfClass('SpecialMesh').MeshId
			end
		end
		local localface = char:FindFirstChild("face", true)
		local cloneface = disguiseclone:FindFirstChild("face", true)
		if localface and cloneface then
			localface.Parent = game
			cloneface.Parent = char.Head
		end
		char.Humanoid.HumanoidDescription:SetEmotes(desc:GetEmotes())
		char.Humanoid.HumanoidDescription:SetEquippedEmotes(desc:GetEquippedEmotes())
		disguiseclone:Destroy()
	end)
end

lp = game:GetService("Players").LocalPlayer
oldUserId = tostring(lp.UserId)
oldName = lp.Name
oldDisplayName = lp.DisplayName

local function fatty(len)
	local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
	local s = ""
	for i = 1, len do
		local rand = math.random(1, #charset)
		s = s .. charset:sub(rand, rand)
	end
	return s
end

local Gay = {}

for _, player in ipairs(players:GetPlayers()) do
	game:GetService("Players").LocalPlayer.NameDisplayDistance = 1
	if player ~= lp then
		local fake = fatty(#player.DisplayName)
		Gay[player.Name] = fatty(#player.Name)
		Gay[player.DisplayName] = fake

		pcall(function()
			player.DisplayName = fake
		end)
	end
end

task.spawn(function()
	while task.wait() do
		game:GetService("Players").LocalPlayer.NameDisplayDistance = 0
		game:GetService("Players").LocalPlayer.NameDisplayDistance = 1
	end
end)

players.PlayerAdded:Connect(function(player)
	if player ~= lp then
		player.CharacterAdded:Connect(function()
			local fake = fatty(#player.DisplayName)
			Gay[player.Name] = fatty(#player.Name)
			Gay[player.DisplayName] = fake

			pcall(function()
				player.DisplayName = fake
			end)
		end)
	end
end)


local function processtext(text)
	if not text or type(text) ~= "string" then
		return ""
	end

	text = text:gsub(oldName, Config.FakeName)
	text = text:gsub(oldUserId, tostring(Config.FakeId))
	text = text:gsub(oldDisplayName, Config.FakeDisplayName)

	for realName, fakeName in pairs(Gay) do
		text = text:gsub(realName, fakeName)
	end

	return text
end

for i,v in next, game:GetDescendants() do
    if v:IsA("TextBox") or v:IsA("TextLabel") or v:IsA("TextButton") then
        v.Text = processtext(v.Text)
        v.Name = processtext(v.Name)
        v.Changed:Connect(function(property)
            v.Text = processtext(v.Text)
            v.Name = processtext(v.Name)
        end)
    end
end
game.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("TextBox") or descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
        descendant.Text = processtext(descendant.Text)
        descendant.Name = processtext(descendant.Name)
        descendant.Changed:Connect(function()
            descendant.Text = processtext(descendant.Text)
            descendant.Name = processtext(descendant.Name)
        end)
    end
end)
lp.DisplayName = Config.FakeDisplayName
lp.CharacterAppearanceId = Config.FakeId

if Config.Headless == true then
    task.spawn(function()
   while wait() do
        local char = lp.Character or lp.CharacterAdded:wait()
        char:WaitForChild("Head").Transparency = 1
        if char:WaitForChild("Head"):FindFirstChildOfClass("Decal") then
            char.Head:FindFirstChildOfClass("Decal"):Destroy()
        end
    end
    end)
end

pcall(function()
   disguisechar(lp.Character,getgenv().Config.FakeId)
end)

lp.CharacterAdded:Connect(function()
      disguisechar(lp.Character,getgenv().Config.FakeId)
end)
