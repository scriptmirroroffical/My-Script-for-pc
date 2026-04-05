-- [[ STATS CONTROLLER V7.5 - THE STABLE EDITION ]]
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. XÓA CÁC BẢN CŨ ĐỂ TRÁNH TRÀN GUI
for _, oldGui in ipairs(playerGui:GetChildren()) do
	if oldGui.Name == "StatsController_V7" or oldGui:FindFirstChild("MainFrame") then
		oldGui:Destroy()
	end
end

-- 2. LOADING SCREEN (Tối ưu hóa)
local loadGui = Instance.new("ScreenGui")
loadGui.Name = "LoadingUI_Final"
loadGui.DisplayOrder = 10
loadGui.Parent = playerGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
bg.BackgroundTransparency = 0.2
bg.Parent = loadGui

local loadMain = Instance.new("Frame")
loadMain.Size = UDim2.new(0, 300, 0, 100)
loadMain.Position = UDim2.new(0.5, -150, 0.5, -50)
loadMain.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", loadMain).CornerRadius = UDim.new(0, 10)
loadMain.Parent = bg

local loadText = Instance.new("TextLabel")
loadText.Size = UDim2.new(1, 0, 0.5, 0)
loadText.Text = "⚡ Optimizing GUI V7.5..."
loadText.TextColor3 = Color3.new(1,1,1)
loadText.Font = Enum.Font.GothamBold
loadText.BackgroundTransparency = 1
loadText.TextSize = 18
loadText.Parent = loadMain

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.8, 0, 0.1, 0)
barBg.Position = UDim2.new(0.1, 0, 0.7, 0)
barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
barBg.Parent = loadMain

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.Parent = barBg

task.spawn(function()
	TweenService:Create(barFill, TweenInfo.new(1.5), {Size = UDim2.new(1, 0, 1, 0)}):Play()
	task.wait(1.6)
	loadGui:Destroy()
end)

-- 3. MAIN GUI SETUP
local stats = {
	speed = 16, jump = 50, health = 100, flySpeed = 50,
	autoMaintain = true, flying = false, noClip = false, spamSteal = false 
}

local mainGui = Instance.new("ScreenGui")
mainGui.Name = "StatsController_V7_5"
mainGui.ResetOnSpawn = false
mainGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 420)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
mainFrame.Parent = mainGui

-- Thanh tiêu đề (Dùng để kéo)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 10)
titleBar.Parent = mainFrame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -40, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.Text = "STATS CONTROLLER V7.5"
titleText.TextColor3 = Color3.new(1, 1, 1)
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.BackgroundTransparency = 1
titleText.Parent = titleBar

-- Scrolling Content (Chống tràn nút)
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -50)
scroll.Position = UDim2.new(0, 5, 0, 45)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 550)
scroll.ScrollBarThickness = 4
scroll.Parent = mainFrame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Parent = scroll

-- Nút Thu Nhỏ
local miniBtn = Instance.new("TextButton")
miniBtn.Size = UDim2.new(0, 30, 0, 30)
miniBtn.Position = UDim2.new(1, -35, 0, 5)
miniBtn.Text = "-"
miniBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
miniBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0, 5)
miniBtn.Parent = titleBar

local isMini = false
miniBtn.MouseButton1Click:Connect(function()
	isMini = not isMini
	mainFrame:TweenSize(isMini and UDim2.new(0, 300, 0, 40) or UDim2.new(0, 300, 0, 420), "Out", "Quad", 0.3, true)
	scroll.Visible = not isMini
	miniBtn.Text = isMini and "+" or "-"
end)

-- HÀM TẠO INPUT
local function addInput(text, key, default)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(0.95, 0, 0, 45)
	container.BackgroundTransparency = 1
	container.Parent = scroll

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(0.5, 0, 1, 0)
	lbl.Text = text
	lbl.TextColor3 = Color3.fromRGB(180, 180, 180)
	lbl.Font = Enum.Font.Gotham
	lbl.BackgroundTransparency = 1
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = container

	local box = Instance.new("TextBox")
	box.Size = UDim2.new(0.4, 0, 0.7, 0)
	box.Position = UDim2.new(0.55, 0, 0.15, 0)
	box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	box.Text = tostring(default)
	box.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 5)
	box.Parent = container

	box.FocusLost:Connect(function()
		local n = tonumber(box.Text)
		if n then stats[key] = n else box.Text = tostring(stats[key]) end
	end)
end

addInput("Speed", "speed", 16)
addInput("Jump Power", "jump", 50)
addInput("Health Goal", "health", 100)
addInput("Fly Speed", "flySpeed", 50)

-- HÀM TẠO TOGGLE
local function addToggle(text, key, color)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.95, 0, 0, 40)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.Text = text .. ": OFF"
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
	btn.Parent = scroll

	local function refresh()
		btn.Text = text .. ": " .. (stats[key] and "ON" or "OFF")
		btn.BackgroundColor3 = stats[key] and color or Color3.fromRGB(40, 40, 40)
	end

	btn.MouseButton1Click:Connect(function()
		stats[key] = not stats[key]
		refresh()
		-- Fly Setup
		if key == "flying" then
			local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			if stats.flying and hrp then
				local bv = Instance.new("BodyVelocity", hrp)
				bv.Name = "FlyVel"
				bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				local bg = Instance.new("BodyGyro", hrp)
				bg.Name = "FlyGyro"
				bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			else
				if hrp then
					if hrp:FindFirstChild("FlyVel") then hrp.FlyVel:Destroy() end
					if hrp:FindFirstChild("FlyGyro") then hrp.FlyGyro:Destroy() end
					if player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.PlatformStand = false end
				end
			end
		end
	end)
end

addToggle("NOCLIP", "noClip", Color3.fromRGB(180, 50, 50))
addToggle("FLY", "flying", Color3.fromRGB(120, 50, 180))
addToggle("AUTO MAINTAIN", "autoMaintain", Color3.fromRGB(0, 100, 200))
addToggle("SPAM STEAL", "spamSteal", Color3.fromRGB(0, 160, 80))

-- 4. LOGIC HỆ THỐNG
local cachedParts = {}
local function updateCache()
	cachedParts = {}
	if not player.Character then return end
	for _, p in ipairs(player.Character:GetDescendants()) do
		if p:IsA("BasePart") then table.insert(cachedParts, p) end
	end
end
player.CharacterAdded:Connect(function() task.wait(0.5) updateCache() end)
updateCache()

-- DRAG LOGIC (Smooth)
local dragToggle, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragToggle = true dragStart = input.Position startPos = mainFrame.Position
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragToggle = false end end)

-- MAIN LOOP
RunService.Heartbeat:Connect(function()
	local char = player.Character
	local hum = char and char:FindFirstChild("Humanoid")
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hum or not hrp then return end

	-- Maintain
	if stats.autoMaintain and not stats.flying then
		hum.WalkSpeed = stats.speed
		hum.JumpPower = stats.jump
	end

	-- Fly
	if stats.flying then
		local bv = hrp:FindFirstChild("FlyVel")
		local bg = hrp:FindFirstChild("FlyGyro")
		if bv and bg then
			local dir = Vector3.new(0,0,0)
			local cam = workspace.CurrentCamera.CFrame
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.RightVector end
			bv.Velocity = dir.Magnitude > 0 and (dir.Unit * stats.flySpeed) or Vector3.new(0,0.1,0)
			bg.CFrame = cam
			hum.PlatformStand = true
		end
	end

	-- NoClip
	if stats.noClip then
		for _, p in ipairs(cachedParts) do p.CanCollide = false end
	end
end)

-- Spam Loop
task.spawn(function()
	while task.wait(0.3) do
		if stats.spamSteal and player.Character and player.Character:FindFirstChild("Humanoid") then
			local hum = player.Character.Humanoid
			if hum.Health < stats.health then
				hum.Health = stats.health
			end
		end
	end
end)

print("⚡ Stats Controller V7.5: GUI Error Fixed & Optimized!")
