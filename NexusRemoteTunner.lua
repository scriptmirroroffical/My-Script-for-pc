-- ==========================================
-- NEXUS ADVANCED REMOTE TUNER v2.5 (Spy, Block & SS Scan)
-- ==========================================
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local selectedRemote = nil
local cachedRemotes = {}
local blockedRemotes = {}
local isSpying = false

local backdoorKeywords = {"execute", "run", "loadstring", "serverside", "console", "f_exec", "backdoor", "nexus_ss", "metability"}

local guiParent = (pcall(function() return CoreGui.Name end) and CoreGui) or player:WaitForChild("PlayerGui")
if guiParent:FindFirstChild("NexusAdvanced") then guiParent.NexusAdvanced:Destroy() end

-- Helper: Xem nội dung Table
local function serializeTable(val)
    if type(val) == "table" then
        local res = "{"
        for k, v in pairs(val) do
            res = res .. tostring(k) .. "=" .. serializeTable(v) .. ","
        end
        return res:sub(1, #res - 1) .. "}"
    end
    return tostring(val)
end

-- ==========================================
-- 1. UI SETUP
-- ==========================================
local screenGui = Instance.new("ScreenGui", guiParent)
screenGui.Name = "NexusAdvanced"
screenGui.ResetOnSpawn = false

local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0, 650, 0, 500)
main.Position = UDim2.new(0.5, -325, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Active = true
main.Draggable = true
main.ClipsDescendants = true 
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)

-- Header
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -110, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "NEXUS ADVANCED v2.5 [SS SCAN]"
title.TextColor3 = Color3.fromRGB(0, 255, 170)
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundTransparency = 1

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", closeBtn)

-- Container
local container = Instance.new("Frame", main)
container.Size = UDim2.new(1, 0, 0, 460) 
container.Position = UDim2.new(0, 0, 0, 40)
container.BackgroundTransparency = 1

-- Left Panel
local searchBox = Instance.new("TextBox", container)
searchBox.Size = UDim2.new(0.4, -70, 0, 30)
searchBox.Position = UDim2.new(0, 10, 0, 10)
searchBox.PlaceholderText = "Search..."
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
searchBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", searchBox)

local scanBtn = Instance.new("TextButton", container)
scanBtn.Size = UDim2.new(0, 60, 0, 30)
scanBtn.Position = UDim2.new(0.4, -55, 0, 10)
scanBtn.Text = "SCAN SS"
scanBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
scanBtn.TextColor3 = Color3.new(1, 1, 1)
scanBtn.Font = Enum.Font.GothamBold
scanBtn.TextSize = 10
Instance.new("UICorner", scanBtn)

local listScroll = Instance.new("ScrollingFrame", container)
listScroll.Size = UDim2.new(0.4, 0, 1, -60)
listScroll.Position = UDim2.new(0, 10, 0, 50)
listScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
listScroll.BorderSizePixel = 0
Instance.new("UICorner", listScroll)
local listLayout = Instance.new("UIListLayout", listScroll)

-- Right Panel
local consoleFrame = Instance.new("Frame", container)
consoleFrame.Size = UDim2.new(0.6, -20, 1, -20)
consoleFrame.Position = UDim2.new(0.4, 10, 0, 10)
consoleFrame.BackgroundTransparency = 1

local targetDisplay = Instance.new("TextLabel", consoleFrame)
targetDisplay.Size = UDim2.new(0.7, -5, 0, 30)
targetDisplay.Text = "TARGET: None"
targetDisplay.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
targetDisplay.TextColor3 = Color3.fromRGB(255, 165, 0)
Instance.new("UICorner", targetDisplay)

local spyToggleBtn = Instance.new("TextButton", consoleFrame)
spyToggleBtn.Size = UDim2.new(0.3, 0, 0, 30)
spyToggleBtn.Position = UDim2.new(0.7, 5, 0, 0)
spyToggleBtn.Text = "SPY: OFF"
spyToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
spyToggleBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", spyToggleBtn)

local argBox = Instance.new("TextBox", consoleFrame)
argBox.Size = UDim2.new(1, 0, 0, 120)
argBox.Position = UDim2.new(0, 0, 0, 40)
argBox.MultiLine = true
argBox.Text = "print('Nexus Connected')"
argBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
argBox.TextColor3 = Color3.fromRGB(0, 255, 0)
argBox.Font = Enum.Font.Code
argBox.TextXAlignment = 0
argBox.TextYAlignment = 0
Instance.new("UICorner", argBox)

local logScroll = Instance.new("ScrollingFrame", consoleFrame)
logScroll.Size = UDim2.new(1, 0, 0, 170)
logScroll.Position = UDim2.new(0, 0, 0, 170)
logScroll.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
logScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instance.new("UICorner", logScroll)
local logLayout = Instance.new("UIListLayout", logScroll)

local fireBtn = Instance.new("TextButton", consoleFrame)
fireBtn.Size = UDim2.new(0.5, -5, 0, 40)
fireBtn.Position = UDim2.new(0, 0, 1, -40)
fireBtn.Text = "EXECUTE"
fireBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
fireBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", fireBtn)

local blockBtn = Instance.new("TextButton", consoleFrame)
blockBtn.Size = UDim2.new(0.5, -5, 0, 40)
blockBtn.Position = UDim2.new(0.5, 5, 1, -40)
blockBtn.Text = "BLOCK"
blockBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
blockBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", blockBtn)

-- ==========================================
-- LOGIC
-- ==========================================
local function logSpy(message, color)
    local msgLabel = Instance.new("TextLabel", logScroll)
    msgLabel.Size = UDim2.new(1, -10, 0, 20)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    msgLabel.Font = Enum.Font.Code
    msgLabel.TextSize = 12
    msgLabel.TextXAlignment = 0
    msgLabel.TextWrapped = true
    msgLabel.AutomaticSize = Enum.AutomaticSize.Y
end

local function refreshCache()
    table.clear(cachedRemotes)
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then table.insert(cachedRemotes, obj) end
    end
end

local function updateList()
    for _, v in pairs(listScroll:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local filter = searchBox.Text:lower()
    for _, obj in ipairs(cachedRemotes) do
        if obj.Parent and (filter == "" or obj.Name:lower():find(filter)) then
            local b = Instance.new("TextButton", listScroll)
            b.Size = UDim2.new(1, 0, 0, 25)
            b.Text = (blockedRemotes[obj] and "[B] " or "") .. obj.Name
            b.BackgroundColor3 = blockedRemotes[obj] and Color3.fromRGB(80, 20, 20) or Color3.fromRGB(35, 35, 35)
            b.TextColor3 = Color3.new(0.8, 0.8, 0.8)
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
            b.MouseButton1Click:Connect(function()
                selectedRemote = obj
                targetDisplay.Text = "TARGET: " .. obj.Name
            end)
        end
    end
end

-- SS SCAN LOGIC
scanBtn.MouseButton1Click:Connect(function()
    logSpy("--- SCANNING FOR BACKDOORS ---", Color3.fromRGB(255, 165, 0))
    refreshCache()
    local found = 0
    for _, v in pairs(cachedRemotes) do
        local isSus = false
        for _, key in pairs(backdoorKeywords) do
            if v.Name:lower():find(key) then isSus = true break end
        end
        if isSus or v:IsDescendantOf(game:GetService("JointsService")) then
            found = found + 1
            logSpy("[!] POTENTIAL: " .. v.Name, Color3.fromRGB(255, 50, 50))
            selectedRemote = v
            targetDisplay.Text = "TARGET: " .. v.Name
        end
    end
    if found == 0 then logSpy("No obvious backdoors found.", Color3.fromRGB(150, 150, 150)) end
end)

-- HOOKING
if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if (method == "FireServer" or method == "InvokeServer") and not checkcaller() then
            if blockedRemotes[self] then return end
            if isSpying then
                local args = {...}
                local argStr = ""
                for i, v in ipairs(args) do
                    argStr = argStr .. serializeTable(v) .. (i < #args and ", " or "")
                end
                task.defer(function() logSpy(self.Name .. " | Args: {" .. argStr .. "}", Color3.fromRGB(150, 200, 255)) end)
            end
        end
        return oldNamecall(self, ...)
    end)
end

-- EXECUTE & OTHER BTNS
fireBtn.MouseButton1Click:Connect(function()
    if not selectedRemote then return end
    local code = "return " .. argBox.Text
    local success, func = pcall(loadstring, code)
    if success and type(func) == "function" then
        pcall(function()
            if selectedRemote:IsA("RemoteEvent") then selectedRemote:FireServer(func())
            else selectedRemote:InvokeServer(func()) end
            logSpy("-> FIRED: " .. selectedRemote.Name, Color3.fromRGB(0, 255, 0))
        end)
    end
end)

spyToggleBtn.MouseButton1Click:Connect(function()
    isSpying = not isSpying
    spyToggleBtn.Text = isSpying and "SPY: ON" or "SPY: OFF"
    spyToggleBtn.BackgroundColor3 = isSpying and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(50, 50, 50)
end)

blockBtn.MouseButton1Click:Connect(function()
    if selectedRemote then 
        blockedRemotes[selectedRemote] = not blockedRemotes[selectedRemote]
        updateList()
    end
end)

searchBox:GetPropertyChangedSignal("Text"):Connect(updateList)
closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

refreshCache()
updateList()
