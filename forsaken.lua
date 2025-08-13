setclipboard("discord.gg/fartsaken | https://imperium.mysellauth.com")
local P = game.Players.LocalPlayer
local PG = P:WaitForChild("PlayerGui")

local SG = Instance.new("ScreenGui", PG)
local FR = Instance.new("Frame", SG)
FR.Size = UDim2.new(1, 0, 1, 0)
FR.Position = UDim2.new(0, 0, 0, 0)
FR.BackgroundColor3 = Color3.new(0, 0, 0)

local TL = Instance.new("TextLabel", FR)
TL.Size = UDim2.new(1, 0, 1, 0)
TL.Position = UDim2.new(0, 0, 0, 0)
TL.BackgroundTransparency = 1
TL.TextColor3 = Color3.new(1, 1, 1)
TL.TextScaled = true
TL.Font = Enum.Font.SourceSans
TL.Text = "Unfortunately, I haven't been making enough money from fartsaken to pay for luarmor. If you want to keep using the script, you will have to either wait for me to get money, or buy a key for $1 a week or $6 lifetime.\n\nSorry. \n discord.gg/fartsaken copied to clipboard the discord invite and shop link"

task.wait(25)
P:Kick("gn")
