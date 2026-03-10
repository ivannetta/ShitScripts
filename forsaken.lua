--!nocheck
--!nolint

if string.split(identifyexecutor() or "None", " ")[1] == "Xeno" then
	getgenv().WebSocket = nil
end

local ScriptUrl: string = "https://api.luarmor.net/files/v3/loaders/80b606551d4b7075eb3e229d6f68e4df.lua"
local Repo: string = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local ShowGui: boolean = true

if not isfolder("FartHub") then
    makefolder("FartHub")
end

if isfile("FartHub/Agreed.txt") then
    local FileContent: string = readfile("FartHub/Agreed.txt")
    if string.lower(FileContent) == "agree" then
        loadstring(game:HttpGet(ScriptUrl))()
        ShowGui = false
    end
end

if ShowGui then
    local Obsidian: any = loadstring(game:HttpGet(Repo .. "Library.lua"))()

    local Window: any = Obsidian:CreateWindow({
        Title = "FartHub",
        Footer = "Terms of Use",
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

    local Tabs: any = {
        TermsTab = Window:AddKeyTab("Terms", "shield"),
    }

    Tabs.TermsTab:AddLabel({
        Text = "Liability & Hold Harmless Agreement",
        DoesWrap = true,
        Size = 20,
    })

    Tabs.TermsTab:AddLabel({
        Text = "Everything is provided strictly AS-IS. By executing this, you accept 100% of the risk. We hold ZERO liability for any consequences, including game bans, account terminations, hardware bans, or legal action.",
        DoesWrap = true,
        Size = 14,
    })

    Tabs.TermsTab:AddLabel({
        Text = "Type 'agree' below to accept the terms.",
        DoesWrap = true,
        Size = 16,
    })

    Tabs.TermsTab:AddKeyBox(function(ReceivedInput: string)
        if string.lower(ReceivedInput) == "agree" then
            writefile("FartHub/Agreed.txt", "agree")
            Obsidian:Unload()
            loadstring(game:HttpGet(ScriptUrl))()
        else
            Obsidian:Notify("You must type 'agree' to continue.", 5)
        end
    end)
end
