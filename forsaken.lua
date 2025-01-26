--if getgenv then
--    getgenv().DebugNotifications = false -- Use this only if you need to
--end

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local DebugNotifications = getgenv and getgenv().DebugNotifications or false
local VirtualBallsManager = game:GetService('VirtualInputManager')
local BlockRemote = game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent
local RunService = game:GetService("RunService")
local SigmaData, JoinedSigmaServer = {}, false
local HttpService = game:GetService("HttpService")
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()
local GUI = Mercury:Create{ Name = "FartSaken", Size = UDim2.fromOffset(600, 400), Theme = Mercury.Themes.Dark, Link = "https://github.com/ivannetta/ShitScripts/Forsaken" }
local PlayerTab, VisualsTab, GeneratorTab, BlatantTab, MiscTab = nil, nil, nil, nil, nil
local BabyShark, KillerFartPart, HRP = nil, nil, nil
local SkibidiDistance, BlockEnabled = 6, false
local executorname = (pcall(function() return getexecutorname() end) and getexecutorname()) or (pcall(function() return identifyexecutor() end) and identifyexecutor()) or "Unknown"
local supportedExecutors = { AWP = true, Wave = true, Nihon = true, ["Synapse Z"] = true, Swift = true }
local SoundList = {"rbxassetid://112809109188560", "rbxassetid://101199185291628", "rbxassetid://102228729296384", "rbxassetid://140242176732868"}
local CurrentFartsActive = {}
local NameProtectNames = {}
local aimbotActive = false
local skibussy


local function ToggleFatMan(state)
    if state then
        skibussy = game:GetService("Players").LocalPlayer.PlayerGui
        skibussy = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer.PlayerGui)
        skibussy.Name = "FatMan"
        skibussy.ResetOnSpawn = false
        skibussy.DisplayOrder = 999999999

        local Frame = Instance.new("Frame", skibussy)
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BackgroundTransparency = 1.000
        Frame.AnchorPoint = Vector2.new(1, 0.5)
        Frame.Name = "YAPPING"
        Frame.Position = UDim2.new(1, 0, 0.5, 0)
        Frame.Size = UDim2.new(0, 150, 0, 150)

        local VideoFrame = Instance.new("VideoFrame", Frame)
        VideoFrame.Size = UDim2.new(1, 0, 1, 0)
        VideoFrame.Video = getcustomasset("FartHub/Assets/FatMan.mp4")
        VideoFrame.Looped = true
        VideoFrame.Playing = true
    else
        skibussy:Destroy()
    end
end

local function GetBigBallsList()
    local url = "https://api.github.com/repos/ivannetta/ShitScripts/git/trees/main?recursive=1"
    local assetList = {}

    local success, errorMessage =
        pcall(
        function()
            local Request = http_request or syn.request or request
            if Request then
                local response =
                    Request(
                    {
                        Url = url,
                        Method = "GET",
                        Headers = {["Content-Type"] = "application/json"}
                    }
                )

                if response and response.Body then
                    local data = game:GetService("HttpService"):JSONDecode(response.Body)
                    for _, item in ipairs(data.tree) do
                        if item.path:match("^Assets/.+%.png$") or item.path:match("^Assets/.+%.mp4$") then
                            local rawUrl = "https://raw.githubusercontent.com/ivannetta/ShitScripts/main/" .. item.path
                            table.insert(assetList, rawUrl)

                            local name = item.path:match("Assets/(.+)%.png$")
                            if name then
                                table.insert(NameProtectNames, name)
                            end
                        end
                    end
                end
            end
        end
    )

    if not success then
        GUI:Notification{Title = "An error occurred", Text = errorMessage, Duration = 5}
    end
    return assetList
end

local function DownloadBallers(url, path)
    if not isfile(path) then
        local suc, res = pcall(function()
            return game:HttpGet(url, true)
        end)
        if not suc or res == '404: Not Found' then
            GUI:Notification{Title = "Error", Text = res, Duration = 5}
        end
        writefile(path, res)
    end
end

local function CheckIfFartsDownloaded()
    local assetList = GetBigBallsList()
    local basePath = "FartHub/Assets/"

    if not isfolder("FartHub") then
        makefolder("FartHub")
    end

    if not isfolder(basePath) then
        makefolder(basePath)
    end

    for _, url in ipairs(assetList) do
        local filePath = basePath .. url:match("Assets/(.+)")
        filePath = filePath

        if not isfile(filePath) then
            DownloadBallers(url, filePath)
            task.wait(.3)
            GUI:Notification{Title = "Downloaded", Text = filePath, Duration = 3}
        end
    end
end

CheckIfFartsDownloaded()

local function NameProtect(state)
    local function updateNames()
        local CurrentSurvivors = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
            and game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI:FindFirstChild("PlayerInfo")
            and game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI.PlayerInfo:FindFirstChild("CurrentSurvivors")
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
                    local randomIndex = indices[math.random(#indices)]
                    local name = NameProtectNames[randomIndex]
                    People.Icon.Image = getcustomasset("/FartHub/Assets/" .. name .. ".png")
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
            local CurrentSurvivors = PlayerInfo:WaitForChild("CurrentSurvivors", math.huge)
            PlayerGui.ChildAdded:Connect(function(child) if child.Name == "TemporaryUI" then updateNames() end end)
            TemporaryUI.ChildAdded:Connect(function(child) if child.Name == "PlayerInfo" then updateNames() end end)
            PlayerInfo.ChildAdded:Connect(function(child) if child.Name == "CurrentSurvivors" then updateNames() end end)
            PlayerGui.ChildRemoved:Connect(function(child) if child.Name == "TemporaryUI" then setupConnections() end end)
            TemporaryUI.ChildRemoved:Connect(function(child) if child.Name == "PlayerInfo" then setupConnections() end end)
            PlayerInfo.ChildRemoved:Connect(function(child) if child.Name == "CurrentSurvivors" then setupConnections() end end)
            game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function(child) if child.Name == "EndScreen" then child.Main.PlayerStats.Header.PlayerDropdown:Destroy() end end)
        end
        setupConnections()
        updateNames()
        if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.PlayerListHolder then game:GetService("Players").LocalPlayer.PlayerGui.MainUI.PlayerListHolder:Destroy() end
        if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Spectate.Username then game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Spectate.Username.Visible = false end
    end
end

GUI:Notification{
    Title = supportedExecutors[executorname] and "Executor Supported" or "Executor Not Supported",
    Text = supportedExecutors[executorname] and "No Errors Expected" or "Errors Expected",
    Duration = 5
}

local highlightingEnabled, SkibidiStaminaLoop, running, ItemFartsEnabled, Do1x1PopupsLoop, SkibidiWait, LopticaWaitTime = false, false, false, false, false, 0.1, 0.5
local generatorHighlightColor, survivorHighlightColor, killerHighlightColor, itemHighlightColor = Color3.fromRGB(173, 162, 236), Color3.fromRGB(0, 255, 255), Color3.fromRGB(255, 100, 100), Color3.fromRGB(255, 255, 0)

local Items = {"Medkit", "BloxyCola", "Bunny", "Mafioso1", "Mafioso2", "Mafioso3", "Shockwave"}

local function LoadSigmaData()
    pcall(function()
        local HttpService = game:GetService("HttpService")
        local data = HttpService:JSONDecode(readfile("FartHub.json"))
        generatorHighlightColor = data.ColorOptions.Generator and Color3.fromHex(data.ColorOptions.Generator) or Color3.fromRGB(255, 0, 0)
        survivorHighlightColor = data.ColorOptions.Survivor and Color3.fromHex(data.ColorOptions.Survivor) or Color3.fromRGB(0, 255, 0)
        killerHighlightColor = data.ColorOptions.Killer and Color3.fromHex(data.ColorOptions.Killer) or Color3.fromRGB(0, 0, 255)
        itemHighlightColor = data.ColorOptions.Item and Color3.fromHex(data.ColorOptions.Item) or Color3.fromRGB(255, 255, 0)
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
        Item = itemHighlightColor:ToHex()
    }
    SigmaData.Info = SigmaData.Info or {}
    SigmaData.Info.JoinedSigmaServer = JoinedSigmaServer

    writefile("FartHub.json", HttpService:JSONEncode(SigmaData))
end


LoadSigmaData()

-- Toggle ESP
local function ToggleFarts(state)
    highlightingEnabled = state
    local localPlayer = game.Players.LocalPlayer
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Highlight") or obj:IsA("BillboardGui") then
            if DebugNotifications then GUI:Notification{Title = "Highlight deleted", Text = (pcall(function() return obj:GetFullName() end) and obj:GetFullName() or "Deleted"), Duration = 3} else end
            obj:Destroy()
        end
    end
    if not state then return end
    local function AddFart(object, color)
        if object:IsA("Model") and object ~= localPlayer.Character and not object:FindFirstChildOfClass("Highlight") then
            local h = Instance.new("Highlight", object)
            if DebugNotifications then GUI:Notification{Title = "Highlight added", Text  = (pcall(function() return h:GetFullName() end) and h:GetFullName() or "Deleted"), Duration = 3} else end
            h.FillColor, h.FillTransparency, h.OutlineTransparency = color, 0.7, 0.6
        end
    end
    for _, folder in ipairs({workspace.Players.Survivors, workspace.Players.Killers}) do
        for _, obj in ipairs(folder:GetChildren()) do
            AddFart(obj, folder.Name == "Survivors" and survivorHighlightColor or killerHighlightColor)
            local billboard = Instance.new("BillboardGui", obj.Head)
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
                local billboard = Instance.new("BillboardGui", child.Head)
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
        if not ingameFolder then return end
        local mapFolder = ingameFolder:FindFirstChild("Map")
        if not mapFolder then return end
        for _, g in ipairs(mapFolder:GetChildren()) do
            if g.Name == "Generator" then AddFart(g, generatorHighlightColor) end
        end
        mapFolder.ChildAdded:Connect(function(child)
            if highlightingEnabled and child.Name == "Generator" then
                AddFart(child, generatorHighlightColor)
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

local function ToggleSigmaItemsHighlights(state)
    ItemFartsEnabled = state
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Highlight") and table.find(Items, obj.Parent.Name) then
            if DebugNotifications then GUI:Notification{Title = "Highlight deleted", Text = (pcall(function() return obj:GetFullName() end) and obj:GetFullName() or "Deleted"), Duration = 3} else end
            task.wait(.1)
            obj:Destroy()
        end
    end
    if not state then return end
    local function AddLopticaHighlight(object, color)
        if object:IsA("BasePart") and object.Parent:IsA("Model") and not object:FindFirstChildOfClass("Highlight") then
            local h = Instance.new("Highlight", object)
            h.FillColor, h.FillTransparency, h.OutlineTransparency = color, 0.7, 0.6
            if DebugNotifications then GUI:Notification{Title = "Highlight added", Text = (pcall(function() return h:GetFullName() end) and h:GetFullName() or "Added"), Duration = 3} else end
        end
    end
    for _, item in ipairs(Items) do
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and obj.Name == item then
                for _, child in ipairs(obj:GetChildren()) do
                    if child:IsA("BasePart") then
                        AddLopticaHighlight(child, itemHighlightColor)
                    end
                end
            end
        end
    end
    workspace.DescendantAdded:Connect(function(descendant)
        if ItemFartsEnabled and descendant:IsA("Model") and table.find(Items, descendant.Name) then
            for _, child in ipairs(descendant:GetChildren()) do
                if child:IsA("BasePart") then
                    AddLopticaHighlight(child, itemHighlightColor)
                end
            end
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
                    local centerY = i.AbsolutePosition.Y + (i.AbsoluteSize.Y / 2)
                    if DebugNotifications then GUI:Notification{Title = "1x1x1x1 Popup Closed", Text = (pcall(function() return i:GetFullName() end) and i:GetFullName() or "Closed"), Duration = 3} else end
                    VirtualBallsManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, true, player.PlayerGui, 1)
                    VirtualBallsManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, false, player.PlayerGui, 1)
                end
            end
        end
        task.wait(0.1)
    end
end

local function SetupSurfers(PuzzlesUi)
    task.wait(.5)
    local Container = PuzzlesUi:WaitForChild("Container")
    local GridHolder = Container:WaitForChild("GridHolder")
    Container:WaitForChild("UIAspectRatioConstraint"):Destroy()
    Container.Size = UDim2.new(1, 0, 1, 0)
    GridHolder.Size = UDim2.new(0.625, 0, 0.625, 0)
    GridHolder.Position = UDim2.new(0.25, 0, 0.5, 0)

    local Surfers = Instance.new("VideoFrame", Container)
    Surfers.Size = UDim2.new(0.625, 0, 0.625, 0)
    Surfers.Position = UDim2.new(0.75, 0, 0.5, 0)
    Surfers.AnchorPoint = Vector2.new(0.5, 0.5)
    Surfers.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Surfers.SizeConstraint = Enum.SizeConstraint.RelativeYY
    Surfers.Video = getcustomasset("FartHub/Assets/SubwaySurfers.mp4")
    Surfers.Looped = true
    Surfers.Playing = true
end

local function SkibidiGenerator(shouldLoop)
    repeat
        if not running then break end
        local FartIngameFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")
        local FartNapFolder = FartIngameFolder and FartIngameFolder:FindFirstChild("Map")
        if FartNapFolder then
            for _, g in ipairs(FartNapFolder:GetChildren()) do
                if g.Name == "Generator" and g.Progress.Value < 100 then
                    g.Remotes.RE:FireServer()
                    if DebugNotifications then
                        GUI:Notification{Title = "Generator Done", Text = (pcall(function() return g:GetFullName() end) and g:GetFullName() or "Generator Done"), Duration = 3}
                    end
                end
            end
        end
        if shouldLoop then task.wait(SkibidiWait) end
    until not shouldLoop
end


local function TpDoGenerator()
    local lastPosition = Players.LocalPlayer.Character.HumanoidRootPart.CFrame

    local function findGenerators()
        local folder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")
        local map = folder and folder:FindFirstChild("Map")
        local generators = {}
        if map then
            for _, g in ipairs(map:GetChildren()) do
                if g.Name == "Generator" and g.Progress.Value < 100 then
                    table.insert(generators, g)
                end
            end
        end
        return generators
    end

    while true do
        local generators = findGenerators()
        if #generators == 0 then break end
        for _, g in ipairs(generators) do
            local player = game.Players.LocalPlayer
            local generatorPosition = g.Instances.Generator.Progress.CFrame.Position
            local generatorDirection = (g.Instances.Generator.Cube.CFrame.Position - generatorPosition).Unit
            player.Character.HumanoidRootPart.CFrame = CFrame.new(generatorPosition + Vector3.new(0, 0.5, 0), generatorPosition + Vector3.new(generatorDirection.X, 0, generatorDirection.Z))
            task.wait(LopticaWaitTime / 2)
            fireproximityprompt(g.Main:WaitForChild("Prompt", 1))
            task.wait(LopticaWaitTime / 2)
            if DebugNotifications then
                GUI:Notification{Title = "Teleported to Generator", Text = (pcall(function() return g:GetFullName() end) and g:GetFullName() or "Teleported"), Duration = 3}
            end
            for _ = 1, 6 do
                task.wait(LopticaWaitTime / 5)
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

local function InjectRobux(sound)
    while sound.Parent and BlockEnabled do
        local success, err = pcall(function()
            HRP = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if HRP and KillerFartPart and KillerFartPart.Parent then
                local killerHRP = KillerFartPart.Parent:FindFirstChild("HumanoidRootPart")
                if killerHRP then
                    local directionToPlayer = (HRP.Position - killerHRP.Position).Unit
                    local killerLookVector = killerHRP.CFrame.LookVector
                    local dotProduct = directionToPlayer:Dot(killerLookVector)
                    if dotProduct > 0.5 then
                        local distance = (KillerFartPart.Position - HRP.Position).Magnitude
                        if distance < SkibidiDistance then
                            BlockRemote:FireServer("UseActorAbility", "Block")
                            return
                        end
                    end
                end
            end
        end)
        if not success then GUI:Notification{Title = "An error occurred!", Text = err, Duration = 10} end
        task.wait(0.1)
    end
    CurrentFartsActive[sound] = nil
end


local function HawkTuah()
    if not BlockEnabled then return end
    local success, err = pcall(function()
        BabyShark = workspace:WaitForChild("Players"):FindFirstChild("Killers")
        BabyShark = BabyShark and BabyShark:GetChildren()[1] or nil
        KillerFartPart = BabyShark and BabyShark:FindFirstChild("HumanoidRootPart") or nil
    end)
    if not success then GUI:Notification{Title = "An error occured!", Text = err, Duration = 10} end
    
    if KillerFartPart then
        KillerFartPart.ChildAdded:Connect(function(descendant)
            if not BlockEnabled then return end
            local success, err = pcall(function()
                if descendant:IsA("Sound") and table.find(SoundList, descendant.SoundId) then
                    if not CurrentFartsActive[descendant] then
                        CurrentFartsActive[descendant] = true
                        task.spawn(InjectRobux, descendant)
                    end
                end
            end)
            if not success then GUI:Notification{Title = "An error occured!", Text = err, Duration = 10} end
        end)
    end
end

game:GetService("Players").ChildAdded:Connect(function(child)
    if not BlockEnabled then return end
    local success, err = pcall(function()
        if child.Name == "Killers" then HawkTuah() end
    end)
    if not success then GUI:Notification{Title = "An error occured!", Text = err, Duration = 10} end
end)

game:GetService("Players").ChildRemoved:Connect(function(child)
    if not BlockEnabled then return end
    local success, err = pcall(function()
        if child.Name == "Killers" then HawkTuah() end
    end)
    if not success then GUI:Notification{Title = "An error occured!", Text = err, Duration = 10} end
end)

local function ToggleFart(state)
    SkibidiStaminaLoop = state
    local success, SkibidiSprinting = pcall(function() return require(game.ReplicatedStorage.Systems.Character.Game.Sprinting) end)

    if not success then
        if DebugNotifications then
            GUI:Notification{
                Title = "Error",
                Text = "Your executor doesn't support this.",
                Duration = 5
            }
        end
        return
    end

    while SkibidiStaminaLoop do
        SkibidiSprinting.StaminaLossDisabled = function() end
        task.wait(1)
    end

    SkibidiSprinting.StaminaLossDisabled = nil
end

local function SetProximity()
    local success, err = pcall(function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                obj.HoldDuration = 0
            end
        end
    end)
    if not success and DebugNotifications then
        GUI:Notification{Title = "Error", Text = err, Duration = 5}
    end
end

local function ToggleSigmaItemsHighlights(state)
    ItemFartsEnabled = state
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Highlight") and table.find(Items, obj.Parent.Name) then
            if DebugNotifications then GUI:Notification{Title = "Highlight deleted", Text = (pcall(function() return obj:GetFullName() end) and obj:GetFullName() or "Deleted"), Duration = 3} else end
            task.wait(.1)
            obj:Destroy()
        end
    end
    if not state then return end
    local function AddLopticaHighlight(object, color)
        if object:IsA("BasePart") and object.Parent:IsA("Model") and not object:FindFirstChildOfClass("Highlight") then
            local h = Instance.new("Highlight", object)
            h.FillColor, h.FillTransparency, h.OutlineTransparency = color, 0.7, 0.6
            if DebugNotifications then GUI:Notification{Title = "Highlight added", Text = (pcall(function() return h:GetFullName() end) and h:GetFullName() or "Added"), Duration = 3} else end
        end
    end
    for _, item in ipairs(Items) do
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and obj.Name == item then
                for _, child in ipairs(obj:GetChildren()) do
                    if child:IsA("BasePart") then
                        AddLopticaHighlight(child, itemHighlightColor)
                    end
                end
            end
        end
    end
    workspace.DescendantAdded:Connect(function(descendant)
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
end

local function InitializeGUI()
    GeneratorTab = GUI:Tab{Name = "Generators", Icon = "rbxassetid://12549056837"}
    VisualsTab = GUI:Tab{Name = "Visuals", Icon = "rbxassetid://129972183138590"}
    PlayerTab = GUI:Tab{Name = "Player", Icon = "rbxassetid://86412006218107"}
    BlatantTab = GUI:Tab{Name = "Blatant", Icon = "rbxassetid://17183582911"}
    MiscTab = GUI:Tab{Name = "Misc", Icon = "rbxassetid://17106470268"}

    GUI:Credit{Name = "ivannetta", Description = "meowzer", Discord = "ivannetta"}
    GUI:Notification{Title = "NOTE: Default Keybinds:", Text = "DEL to minimize.", Duration = 10}
    GUI:Notification{Title = "NOTE: Auto Block Is In BETA!!!:", Text = "This has NOT been tested much so DONT rely on it.", Duration = 10}
    GUI:Notification{Title = "NOTE: Highlights Not Working Fix.", Text = "Reset ur bloxtrap settings.", Duration = 10}
    GUI:Notification{Title = "Made by ivannetta", Text = "Like on rbxscripts or rscripts plssssssss 🥺", Duration = 60}

    VisualsTab:ColorPicker{
        Style = Mercury.ColorPickerStyles.Legacy,
        Callback = function(color ) generatorHighlightColor = color UpdateFarts() end,
        Name = "Generator Highlight Color",
        Default = generatorHighlightColor
    }

    VisualsTab:ColorPicker{
        Style = Mercury.ColorPickerStyles.Legacy,
        Callback = function(color) survivorHighlightColor = color UpdateFarts() end,
        Name = "Survivor Highlight Color",
        Default = survivorHighlightColor
    }

    VisualsTab:ColorPicker{
        Style = Mercury.ColorPickerStyles.Legacy,
        Callback = function(color) killerHighlightColor = color UpdateFarts() end,
        Name = "Killer Highlight Color",
        Default = killerHighlightColor
    }

    VisualsTab:ColorPicker{
        Style = Mercury.ColorPickerStyles.Legacy,
        Callback = function(color) itemHighlightColor = color UpdateFarts() end,
        Name = "Item Highlight Color",
        Default = itemHighlightColor
    }

    VisualsTab:Toggle{
        Name = "Highlight Objects",
        Description = "Toggle highlights for objects in-game.",
        StartingState = false,
        Callback = function(state) ToggleFarts(state) ToggleSigmaItemsHighlights(state) end
    }

    PlayerTab:Button{
        Name = "Quick Proximity Prompts",
        Description = "Make Proximity Prompts Finish Instantly.",
        Callback = function() SetProximity() end
    }

    PlayerTab:Toggle{
        Name = "C00lkid Aimbot",
        Description = "Tell the game that ur on mobile so u get aimbot for free",
        StartingState = false,
        Callback = function(state) running = state game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer("SetDevice", state and "Mobile" or "PC") end
    }

    GeneratorTab:Toggle{
        Name = "Quick Generators",
        Description = "Do generators at pro speed.",
        StartingState = false,
        Callback = function(state)
            running = state
            if state then
                task.spawn(function() SkibidiGenerator(true) end)
            end
        end
    }

    GeneratorTab:Keybind{
        Name = "Do Current Generator.",
        Key = Enum.KeyCode.RightControl,
        Callback = function()
            task.spawn(function() SkibidiGenerator(false) end)
        end
    }

    PlayerTab:Toggle{
        Name = "Disable Stamina Drain",
        Description = "Disable stamina drain for sprinting.",
        StartingState = false,
        Callback = function(state) task.spawn(function() ToggleFart(state) end) end
    }

    PlayerTab:Toggle{
        Name = "Do 1x1x1x1 Popups",
        Description = "Does popups on its own.",
        StartingState = false,
        Callback = function(state) Do1x1PopupsLoop = state if state then task.spawn(Do1x1x1x1Popups) end end
    }

    GeneratorTab:Slider{
        Name = "Generator Speed",
        Description = "Change the speed of the generator.",
        Default = 0.5,
        Min = 0.1,
        Max = 10,
        Value = 0.5,
        Callback = function(value)
            SkibidiWait = value
        end
    }

    BlatantTab:Toggle{ -- Credit to R3mii cuz i was lazy to make this 🤣
    Name = "Aimbot for Killer",
    Description = "Automatically aims towards the killer, toggles upon key press",
    StartingState = false,
    Callback = function(state)
        aimbotActive = state
        if aimbotActive then
            local function activateAimbot()
                local killersFolder = workspace.Players:FindFirstChild("Killers")
                if killersFolder then
                    local killer = nil
                    for _, model in pairs(killersFolder:GetChildren()) do
                        if model:IsA("Model") then
                            killer = model
                            break
                        end
                    end

                    if killer then
                        local torso = killer:FindFirstChild("Torso")
                        if torso then
                            local character = game.Players.LocalPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                local humanoidRootPart = character.HumanoidRootPart
                                local connection
                                connection = game:GetService("RunService").RenderStepped:Connect(function()
                                    if not aimbotActive then
                                        connection:Disconnect()
                                        return
                                    end
                                    local torsoPosition = torso.Position
                                    local horizontalDirection = Vector3.new(torsoPosition.X, humanoidRootPart.Position.Y, torsoPosition.Z)
                                    humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, horizontalDirection)
                                    local camera = game.Workspace.CurrentCamera
                                    camera.CFrame = CFrame.lookAt(camera.CFrame.Position, horizontalDirection)
                                end)
                                task.delay(3, function()
                                    connection:Disconnect()
                                end)
                            end
                        end
                    end
                end
            end

            game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                if not gameProcessed and input.KeyCode == Enum.KeyCode[game:GetService("Players").LocalPlayer.PlayerData.Settings.Keybinds.AltAbility2.Value] then
                    task.spawn(activateAimbot)
                end
            end)
        else
            local camera = game.Workspace.CurrentCamera
            camera.CameraType = Enum.CameraType.Custom
        end
    end
    }

    BlatantTab:Toggle{
        Name = "Auto Block",
        Description = "Automatically Use Block On Guest 1337, Currently only working on M1",
        StartingState = false,
        Callback = function(state)
            BlockEnabled = state
            local success, err = pcall(function()
                if BlockEnabled then
                    HawkTuah()
                end
            end)
            if not success then GUI:Notification{Title = "An error occured!", Text = err, Duration = 10} end
        end
    }

    MiscTab:Toggle{
        Name = "Toggle FatMan",
        Description = "Toggle FatMan, Very Blatant Feature, Use At Own Risk.",
        StartingState = false,
        Callback = function(state) ToggleFatMan(state) end
    }

    BlatantTab:Button{
        Name = "Do ALL Generators",
        Description = "Teleport to all generators and do them.",
        Callback = function() TpDoGenerator() end
    }

    BlatantTab:Slider{
        Name = "Do ALL Generators Speed",
        Description = "Change the speed of how fast to teleport to the generator.",
        Default = 0.1,
        Min = 0.1,
        Max = 10,
        Callback = function(value)
            LopticaWaitTime = value
        end
    }

    BlatantTab:Slider{
        Name = "Auto Block Distance",
        Description = "Change Treshold Of Magnitude To Block Killer, Change if you know what ur doing.",
        Default = 6,
        Min = 1,
        Max = 20,
        Callback = function(value)
            SkibidiDistance = value
        end
    }

    MiscTab:Button{
        Name = "NameProtect",
        Description = "Replaces everyones names and images with pmoon.",
        Callback = function() NameProtect(true) end
    }

    MiscTab:Button{
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
                GUI:Notification{Title = "Already Activated", Text = "Low Attention Span Mode is already activated.", Duration = 3}
            end
        end
    }

    if not JoinedSigmaServer then
        GUI:Prompt{
            Title = "Join Fart Hub discord server?",
            Text = "w-would you like to join our discord server? it would be very nice and sigma",
            Buttons = {
                Yes = function()
                    setclipboard("https://discord.gg/AC4usvpwVY")
                    GUI:Notification{Title = "Copied!", Text = "Discord link copied.", Duration = 3}
                    JoinedSigmaServer = true
                    WriteSigmaData()
                end,
                No = function() end
            }
        }
    end
end

InitializeGUI()
