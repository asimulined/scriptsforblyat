
local Players: Players = game:GetService("Players")
local UserInputService: UserInputService = game:GetService("UserInputService")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService: TeleportService = game:GetService("TeleportService")

local LocalPlayer: Player = Players.LocalPlayer
local PlayerMouse: PlayerMouse = LocalPlayer:GetMouse()

--#endregion
-- library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))();
-- windows
local Window = Library.CreateLib("Vibe hugs | v1", "Ocean")
-- tabs
local Tab = Window:NewTab("Main")
local Tps = Window:NewTab("Tps")
local Player = Window:NewTab("Player")
-- sections
local TpsSection = Tps:NewSection("Tps")
local MainSection = Tab:NewSection("Main")
local PlayerSection = Player:NewSection("Player")

local function RandomCapitalization(txt)
    local str = ""
    for i = 1, string.len(txt), 1 do
        if math.random(1, 2) == 1 then
            str = str .. string.upper(string.sub(txt, i, i))
        else
            str = str .. string.lower(string.sub(txt, i, i))
        end
    end
    return str
end

MainSection:NewButton("Rejoin", "Rejoin the place.", function()
    local PlaceId = game.PlaceId
    local JobId = game.JobId

    return TeleportService:TeleportToPlaceInstance(PlaceId, JobId, LocalPlayer)
end)

MainSection:NewButton("Admin ui ", "Credits to EMPLIC 9999", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/offperms/Vibe-hugs/main/Admin%20UI"))()
end)


MainSection:NewSlider("WalkSpeed", "Change your movement magnitude.", 250, 16, function(WalkSpeed: number?)
    local Character = LocalPlayer.Character
    if Character then
        local Humanoid: Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
        if Humanoid then
            Humanoid.WalkSpeed = WalkSpeed
        end
    end
end)

PlayerSection:NewButton("Naked","No clothes for you",function()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    		if v:IsA("Clothing") or v:IsA("ShirtGraphic") then
    			v:Destroy()
    		end
    	end
    end)

MainSection:NewSlider("JumpPower", "Change your initial jump velocity.", 250, 50, function(JumpPower: number?)
    local Character = LocalPlayer.Character
    if Character then
        local Humanoid: Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
        if Humanoid then
            Humanoid.JumpPower = JumpPower
        end
    end
end)

MainSection:NewButton("Reset Character", "Reset your player character to the last location.", function()
    local Character = LocalPlayer.Character
    if Character then
        local Humanoid: Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
        if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
            local LastCoordinateFrame = Humanoid.RootPart.CFrame
            task.wait(Character:BreakJoints())
            repeat
                task.wait(0)
            until LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):GetState() ~= Enum.HumanoidStateType.Dead
            LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RootPart.CFrame = LastCoordinateFrame
            return
        end
    end
end)

MainSection:NewButton("Spam the Chat", "Spam the chat with a randomized capitalization quote.", function()
    local DefaultChatSystemChatEvents: Folder = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents", math.huge)
    if DefaultChatSystemChatEvents and typeof(DefaultChatSystemChatEvents) == "Instance" and DefaultChatSystemChatEvents:IsA("Folder") then
        local SayMessageRequest: RemoteEvent = DefaultChatSystemChatEvents:WaitForChild("SayMessageRequest", math.huge)
        if SayMessageRequest and typeof(SayMessageRequest) == "Instance" and SayMessageRequest:IsA("RemoteEvent") then
            for i = 1, 7, 1 do
                SayMessageRequest:FireServer(RandomCapitalization("hello"), require(game:GetService("Chat").ClientChatModules.ChatSettings).GeneralChannelName)
            end
        end
    end
end)

MainSection:NewButton("Kill Everyone", "Credits to shawnjbragdon#0001", function()
    task.spawn(function()
        local CoordinateFrame = CFrame.new(-8.65939236, 22.2416039, 51.2895126)
        local Character = game:GetService("Players").LocalPlayer.Character
        local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
        
        Humanoid.RootPart.CFrame = CoordinateFrame
        local Tool = Character:FindFirstChildWhichIsA("Tool") or Character:WaitForChild("Sword")
        local Handle = Tool:WaitForChild("Handle")

        for i = 1, 7, 1 do
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("shawnjbragdon 0001 " .. string.rep(".", math.random(1, 3)), "All")
        end
        
        while true do
            if Tool:IsDescendantOf(Character) then
                for _, Player in pairs(game:GetService("Players"):GetPlayers()) do
                    if Player ~= game:GetService("Players").LocalPlayer then
                        pcall(function()
                            Player.Character:FindFirstChildWhichIsA("Humanoid").RootPart.CFrame = Handle.CFrame * CFrame.new(math.random() / 8, math.random() / 8, math.random() / 8)
                        end)
                    end
                end
                Tool:Activate()
            end
            task.wait(0)
        end
    end)
end)
MainSection:NewButton("FE Emote GUI", "Loads up a FE Emote gui", function() if _G.emotegui then return end _G.emotegui = true return loadstring(game:HttpGet("https://pastebin.com/raw/DjsEQMxQ"))(); end)
MainSection:NewButton("Infinite Yield FE", "Load Infinite Yield FE.", function() return loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))(); end)
MainSection:NewButton("FE Nullware Hub", "Loads up the FE Nullware Hub.", function() if _G.nullwareloaded then return end _G.nullwareloaded = true loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/dabc2500988785fbec1ce7c7aaee105d/raw/hVQJXfF4sR6yqSfJ"))() end)
MainSection:NewButton("Buy 30+ Cookies(Requires 50+ Cash)", "Give yourself an absurd number of cookies.", function() return loadstring(game:HttpGet("https://raw.githubusercontent.com/offperms/cokies/main/sc"))(); end)
MainSection:NewButton("Spam Buy Cookies (Requires 50+ Cash)", "Credits to EMPLIC 9999", function()
    while true do
     wait()
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "BuyItem",
    [2] = "Cookie"
}

game:GetService("ReplicatedStorage").RE:FireServer(unpack(args))
local args = {
    [1] = "BuyItem",
    [2] = "Cookie"
}

game:GetService("ReplicatedStorage").RE:FireServer(unpack(args))

end
end)
MainSection:NewButton("Invisible Script", "", function() return loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/bd62009d461c948d466222f4f9333f9420130fbb/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))(); end)
MainSection:NewButton("Big Head (Rthro Head Required)", "Rthro head, From the packages, like danny.", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/sysGhost-aka-BiKode/BigHeadV2/main/BigHeadV2-r15", true))(); end)
PlayerSection:NewButton("Run Flying Script (E)", "Press (E) to use.", function() if _G.flyscriptenabled then return; end; _G.flyscriptenabled = true; return loadstring(game:HttpGet("https://raw.githubusercontent.com/offperms/fly/main/lmao"))(); end)
LocalPlayer.CharacterAdded:Connect(function() _G.flyscriptenabled = false; end)

PlayerSection:NewButton("Korblox", "Applies the Korblox\'s RightLeg descendant.", function()
    local AccessoryEvent: RemoteEvent = ReplicatedStorage:WaitForChild("AccessoryEvent", math.huge)
    if AccessoryEvent and typeof(AccessoryEvent) == "Instance" and AccessoryEvent:IsA("RemoteEvent") then
        return AccessoryEvent:FireServer("Korblox")
    end
end)

PlayerSection:NewButton("Headless", "Applies the Headless Horseman\'s Head descendant.", function()
    local AccessoryEvent: RemoteEvent = ReplicatedStorage:WaitForChild("AccessoryEvent", math.huge)
    if AccessoryEvent and typeof(AccessoryEvent) == "Instance" and AccessoryEvent:IsA("RemoteEvent") then
        return AccessoryEvent:FireServer("Headless")
    end
end)

local TeleportToLocation; TeleportToLocation = function(CoordinateFrame: CFrame)
    local Character = LocalPlayer.Character
    if Character then
        local Humanoid: Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
        if Humanoid and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
            Humanoid.RootPart.CFrame = CoordinateFrame
        end
    end
end

--#region

TpsSection:NewButton("Teleport @ Living Room", "tp", function()
    return TeleportToLocation(CFrame.new(-77, 4, 52))
end)

TpsSection:NewButton("Teleport @ Shop", "tp", function()
    return TeleportToLocation(CFrame.new(-108, 4, 53))
end)

TpsSection:NewButton("Teleport @ Hidden Area", "tp", function()
    return TeleportToLocation(CFrame.new(-133, 4, 53))
end)

TpsSection:NewButton("Teleport @ SpawnLocation", "tp", function()
    return TeleportToLocation(CFrame.new(-113, 4, 98))
end)

TpsSection:NewButton("Teleport @ Bed", "tp", function()
    return TeleportToLocation(CFrame.new(-43, 4, 17))
end)

TpsSection:NewButton("Teleport @ Desktop", "tp", function()
    return TeleportToLocation(CFrame.new(-30, 4, 86))
end)

TpsSection:NewButton("Teleport @ Outdoors", "tp", function()
    return TeleportToLocation(CFrame.new(-55, 19, 53))
end)

TpsSection:NewButton("Teleport @ Pool", "tp", function()
    return TeleportToLocation(CFrame.new(-107, 19, 123))
end)

TpsSection:NewButton("Teleport @ Group\'s Hidden Area", "tp", function()
    return TeleportToLocation(CFrame.new(-127, 4, 121))
end)

TpsSection:NewButton("Teleport @ Sword Area", "tp", function()
    return TeleportToLocation(CFrame.new(-10,20,60))
end)

--#endregion

game:GetService("StarterGui"):SetCore("SendNotification", {
    ["Title"] = "Thanks for using.",
    ["Text"] = string.format("Created by %s & %s", "\"shawnjbragdon#0001\"", "\"! EMPLIC#9999\""),
    ["Duration"] = 10,
})
