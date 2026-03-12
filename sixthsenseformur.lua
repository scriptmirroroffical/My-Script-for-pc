local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Khởi tạo GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ESP_System_Optimized"
screenGui.ResetOnSpawn = false
-- Bảo vệ GUI nếu chạy trong exploit
if syn and syn.protect_gui then
	syn.protect_gui(screenGui)
	screenGui.Parent = game:GetService("CoreGui")
else
	screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Hàm xử lý kéo thả mượt mà
local function MakeDraggable(obj)
	local dragging, dragInput, dragStart, startPos

	obj.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = obj.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	obj.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

----------------------------------------------------------------
-- GIAO DIỆN CHÍNH (MainFrame)
----------------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 180, 0, 100)
MainFrame.Position = UDim2.new(0.5, -90, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Parent = screenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
MakeDraggable(MainFrame)

local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(0.7, 0, 0.35, 0)
ESPButton.Position = UDim2.new(0.05, 0, 0.1, 0)
ESPButton.Text = "ESP: OFF"
ESPButton.Font = Enum.Font.GothamBold
ESPButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ESPButton.TextColor3 = Color3.new(1, 1, 1)
ESPButton.Parent = MainFrame
Instance.new("UICorner", ESPButton).CornerRadius = UDim.new(0, 6)

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0.15, 0, 0.35, 0)
MinimizeButton.Position = UDim2.new(0.8, 0, 0.1, 0)
MinimizeButton.Text = "_"
MinimizeButton.TextSize = 20
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.Parent = MainFrame
Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 6)

local TP_Sheriff = Instance.new("TextButton")
TP_Sheriff.Size = UDim2.new(0.42, 0, 0.35, 0)
TP_Sheriff.Position = UDim2.new(0.05, 0, 0.55, 0)
TP_Sheriff.Text = "TP Sheriff"
TP_Sheriff.Font = Enum.Font.GothamBold
TP_Sheriff.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
TP_Sheriff.TextColor3 = Color3.new(1, 1, 1)
TP_Sheriff.Parent = MainFrame
Instance.new("UICorner", TP_Sheriff).CornerRadius = UDim.new(0, 6)

local TP_Murderer = Instance.new("TextButton")
TP_Murderer.Size = UDim2.new(0.42, 0, 0.35, 0)
TP_Murderer.Position = UDim2.new(0.53, 0, 0.55, 0)
TP_Murderer.Text = "TP Murderer"
TP_Murderer.Font = Enum.Font.GothamBold
TP_Murderer.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TP_Murderer.TextColor3 = Color3.new(1, 1, 1)
TP_Murderer.Parent = MainFrame
Instance.new("UICorner", TP_Murderer).CornerRadius = UDim.new(0, 6)

----------------------------------------------------------------
-- GIAO DIỆN THU GỌN (DẤU CỘNG)
----------------------------------------------------------------
local MiniFrame = Instance.new("Frame")
MiniFrame.Size = UDim2.new(0, 40, 0, 40)
MiniFrame.Position = MainFrame.Position
MiniFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MiniFrame.Visible = false
MiniFrame.Parent = screenGui
Instance.new("UICorner", MiniFrame).CornerRadius = UDim.new(1, 0)
MakeDraggable(MiniFrame)

local PlusButton = Instance.new("TextButton")
PlusButton.Size = UDim2.new(1, 0, 1, 0)
PlusButton.Text = "+"
PlusButton.TextSize = 25
PlusButton.Font = Enum.Font.GothamBold
PlusButton.TextColor3 = Color3.fromRGB(0, 255, 0)
PlusButton.BackgroundTransparency = 1
PlusButton.Parent = MiniFrame

-- Xử lý ẩn/hiện GUI
MinimizeButton.MouseButton1Click:Connect(function()
	MiniFrame.Position = MainFrame.Position
	MainFrame.Visible = false
	MiniFrame.Visible = true
end)

PlusButton.MouseButton1Click:Connect(function()
	MainFrame.Position = MiniFrame.Position
	MiniFrame.Visible = false
	MainFrame.Visible = true
end)

----------------------------------------------------------------
-- TỐI ƯU HÓA LOGIC ESP
----------------------------------------------------------------
local espEnabled = false
local RolesColor = {
	Innocent = Color3.fromRGB(0, 255, 0),
	Sheriff = Color3.fromRGB(135, 206, 250),
	Murderer = Color3.fromRGB(255, 0, 0)
}

local function updateESP(player, color)
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local root = char.HumanoidRootPart

	-- Cập nhật hoặc tạo Box
	local box = root:FindFirstChild("MyESP")
	if not box then
		box = Instance.new("BoxHandleAdornment")
		box.Name = "MyESP"
		box.AlwaysOnTop = true
		box.ZIndex = 10
		box.Size = Vector3.new(3.5, 5, 3.5)
		box.Transparency = 0.5
		box.Adornee = root
		box.Parent = root
	end
	box.Color3 = color

	-- Cập nhật hoặc tạo Name Tag
	local billboard = root:FindFirstChild("NameESP")
	if not billboard then
		billboard = Instance.new("BillboardGui")
		billboard.Name = "NameESP"
		billboard.Size = UDim2.new(0, 200, 0, 50)
		billboard.StudsOffset = Vector3.new(0, 4, 0)
		billboard.AlwaysOnTop = true
		billboard.Adornee = root
		billboard.Parent = root

		local label = Instance.new("TextLabel")
		label.Name = "NameLabel"
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.Font = Enum.Font.GothamBold
		label.TextScaled = true
		label.Parent = billboard
	end
	
	local label = billboard:FindFirstChild("NameLabel")
	if label then
		label.Text = player.Name
		label.TextColor3 = color
	end
end

local function removeESP()
	for _, player in pairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local root = player.Character.HumanoidRootPart
			local oldBox = root:FindFirstChild("MyESP")
			local oldName = root:FindFirstChild("NameESP")
			if oldBox then oldBox:Destroy() end
			if oldName then oldName:Destroy() end
		end
	end
end

ESPButton.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled
	if espEnabled then
		ESPButton.Text = "ESP: ON"
		ESPButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
	else
		ESPButton.Text = "ESP: OFF"
		ESPButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
		removeESP()
	end
end)

-- Sử dụng task.spawn và task.wait(0.2) thay vì RenderStepped để chống lag
task.spawn(function()
	while true do
		task.wait(0.2)
		if espEnabled then
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Character then
					local finalColor = RolesColor.Innocent
					
					-- Gom chung Backpack và Character để quét Tool một lần
					local items = player.Backpack:GetChildren()
					for _, item in pairs(player.Character:GetChildren()) do
						if item:IsA("Tool") then table.insert(items, item) end
					end

					for _, tool in pairs(items) do
						local name = string.lower(tool.Name)
						if name:find("knife") then
							finalColor = RolesColor.Murderer
							break
						elseif name:find("gun") or name:find("revolver") then
							finalColor = RolesColor.Sheriff
							break
						end
					end
					
					updateESP(player, finalColor)
				end
			end
		end
	end
end)

----------------------------------------------------------------
-- LOGIC TELEPORT AN TOÀN
----------------------------------------------------------------
local function teleportToRole(roleColor)
	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local root = player.Character.HumanoidRootPart
			local espBox = root:FindFirstChild("MyESP")
			
			if espBox and espBox.Color3 == roleColor then
				-- Dịch chuyển ra sau lưng hoặc trên đầu 1 chút để an toàn
				myChar.HumanoidRootPart.CFrame = root.CFrame * CFrame.new(0, 3, 3)
				break
			end
		end
	end
end

TP_Sheriff.MouseButton1Click:Connect(function()
	teleportToRole(RolesColor.Sheriff)
end)

TP_Murderer.MouseButton1Click:Connect(function()
	teleportToRole(RolesColor.Murderer)
end)
