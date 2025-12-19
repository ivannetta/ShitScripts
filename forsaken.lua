--!nocheck
--!nolint

if string.split(identifyexecutor() or "None", " ")[1] == "Xeno" then
	getgenv().WebSocket = nil
end

local scripturl = "https://api.luarmor.net/files/v3/loaders/80b606551d4b7075eb3e229d6f68e4df.lua"
local repo: string = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local showGUI = true

if not isfolder("Fartsaken") then
    makefolder("Fartsaken")
end

if isfile("Fartsaken/key.txt") then
    local file = readfile("Fartsaken/key.txt")
    if file == "syruppy" then
        loadstring(game:HttpGet(scripturl))()
        showGUI = false
    end
end

if showGUI then
    local Obsidian: any = loadstring(game:HttpGet(repo .. "Library.lua"))()

    local Window = Obsidian:CreateWindow({
        Title = "Fartsaken",
        Footer = "hi",
        ToggleKeybind = Enum.KeyCode.F8,
        SetMobileButtonSide = "Left",
        DisableSearch = true,
        ShowCustomCursor = false,
        Icon = 130021590670149,
        IconSize = UDim2.fromOffset(40, 40),
        Size = UDim2.fromOffset(400, 300),
        Center = true,
        AutoShow = true
    })

    local Tabs = {
        KeyTab = Window:AddKeyTab("Key", "key"),
    }

    Tabs.KeyTab:AddLabel({
        Text = "Fartsaken Key System",
        DoesWrap = true,
        Size = 20,
    })

    Tabs.KeyTab:AddLabel({
        Text = "Get key from discord.gg/fartsaken",
        DoesWrap = true,
        Size = 17,
    })

    Tabs.KeyTab:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            setclipboard("discord.gg/fartsaken")
            Obsidian:Notify("Copied to clipboard!", 10)
        end
    })

    Tabs.KeyTab:AddKeyBox(function(ReceivedKey)
        if ReceivedKey == "syruppy" then
            writefile("Fartsaken/key.txt", ReceivedKey)
            Obsidian:Unload()
            loadstring(game:HttpGet(scripturl))()
        else
            Obsidian:Notify("Wrong key.", 5)
        end
    end)
end
