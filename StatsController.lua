--[[ 
    STATS CONTROLLER: ULTIMATE FULL EDITION
    Features: Auto-Reconnect, Dual-Jump Fix, Auto-Maintain, Draggable UI, Minimize System
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Cấu hình mặc định
local stats = {
    speed = 16,
    jump = 50,
    health = 100,
    autoMaintain = true
}

-- Tự động kết nối lại khi hồi sinh (Fix lỗi chết là mất tác dụng)
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    -- Ép chỉ số ngay khi vừa hồi sinh
    if stats.autoMaintain then
        humanoid.WalkSpeed = stats.speed
        humanoid.UseJumpPower = true
        humanoid.JumpPower = stats.jump
    end
end)

-- Tạo Giao Diện (GUI)
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "StatsController_V3"
screenGui.ResetOnSpawn = false -- Giữ GUI không bị mất khi chết

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 300, 0, 380)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "⚡ STATS CONTROLLER V3"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- Nút Thu Nhỏ (Minimize)
local miniBtn = Instance.new("TextButton", mainFrame)
miniBtn.Size = UDim2.new(0, 30, 0, 30)
miniBtn.Position = UDim2.new(1, -35, 0, 5)
miniBtn.Text = "-"
miniBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
miniBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", miniBtn)

local minimized = false
miniBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    mainFrame:TweenSize(minimized and UDim2.new(0, 300, 0, 40) or UDim2.new(0, 300, 0, 380), "Out", "Quad", 0.3, true)
    miniBtn.Text = minimized and "+" or "-"
end)

-- Hàm tạo các dòng nhập liệu
local function createInput(name, default, posY)
    local frame = Instance.new("Frame", mainFrame)
    frame.Size = UDim2.new(1, -20, 0, 60)
    frame.Position = UDim2.new(0, 10, 0, posY)
    frame.BackgroundTransparency = 1

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0.4, 0)
    label.Text = name .. " Value:"
    label.TextColor3 = Color3.fromRGB(180, 180, 180)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left

    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(1, 0, 0.5, 0)
    box.Position = UDim2.new(0, 0, 0.4, 0)
    box.Text = tostring(default)
    box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.Font = Enum.Font.Code
    Instance.new("UICorner", box)

    box.FocusLost:Connect(function()
        local val = tonumber(box.Text)
        if val then stats[name:lower()] = val else box.Text = stats[name:lower()] end
    end)
    return box
end

local speedInput = createInput("Speed", stats.speed, 50)
local jumpInput = createInput("Jump", stats.jump, 120)
local healthInput = createInput("Health (Beta)", stats.health, 190)

-- Nút Auto-Maintain
local autoBtn = Instance.new("TextButton", mainFrame)
autoBtn.Size = UDim2.new(1, -20, 0, 40)
autoBtn.Position = UDim2.new(0, 10, 0, 270)
autoBtn.Text = "Auto-Maintain: ON"
autoBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
autoBtn.TextColor3 = Color3.new(1, 1, 1)
autoBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", autoBtn)

autoBtn.MouseButton1Click:Connect(function()
    stats.autoMaintain = not stats.autoMaintain
    autoBtn.Text = "Auto-Maintain: " .. (stats.autoMaintain and "ON" or "OFF")
    autoBtn.BackgroundColor3 = stats.autoMaintain and Color3.fromRGB(0, 120, 215) or Color3.fromRGB(100, 100, 100)
end)

-- Nút Reset
local resetBtn = Instance.new("TextButton", mainFrame)
resetBtn.Size = UDim2.new(1, -20, 0, 40)
resetBtn.Position = UDim2.new(0, 10, 0, 320)
resetBtn.Text = "RESET DEFAULTS"
resetBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
resetBtn.TextColor3 = Color3.new(1, 1, 1)
resetBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", resetBtn)

resetBtn.MouseButton1Click:Connect(function()
    stats.speed, stats.jump, stats.health = 16, 50, 100
    speedInput.Text, jumpInput.Text, healthInput.Text = "16", "50", "100"
end)

-- Hệ thống Kéo (Drag)
local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

-- VÒNG LẶP DUY TRÌ (FIX JUMP TRIỆT ĐỂ)
RunService.Heartbeat:Connect(function()
    if stats.autoMaintain and humanoid then
        -- Duy trì Tốc độ
        if humanoid.WalkSpeed ~= stats.speed then
            humanoid.WalkSpeed = stats.speed
        end
        
        -- FIX JUMP: Áp dụng cho cả 2 chế độ JumpPower và JumpHeight
        humanoid.UseJumpPower = true -- Ép game dùng JumpPower
        if humanoid.JumpPower ~= stats.jump then
            humanoid.JumpPower = stats.jump
        end
        
        -- Dự phòng cho game ép dùng JumpHeight (Quy đổi: Height = Power^2 / (2 * Gravity))
        -- Ở đây mình dùng tỉ lệ an toàn cho hầu hết game
        local heightValue = stats.jump * 0.15 
        if humanoid.JumpHeight ~= heightValue then
            humanoid.JumpHeight = heightValue
        end

        -- Duy trì Máu
        if humanoid.MaxHealth ~= stats.health then
            humanoid.MaxHealth = stats.health
            humanoid.Health = stats.health
        end
    end
end)

print("⚡ Stats Controller V3 (Full Fix) Loaded!")
