if string.split(identifyexecutor() or "None", " ")[1] == "Xeno" then
	getgenv().WebSocket = nil
end
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/80b606551d4b7075eb3e229d6f68e4df.lua"))()
