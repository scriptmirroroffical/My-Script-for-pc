--[[ 
    STATS CONTROLLER: ULTIMATE FULL EDITION V6
    Features: Independent Fly Speed, Health Bypass, JumpPower, Labeled UI, Minimize, UICorner
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService") -- Thêm TweenService cho Minimize

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- Cấu hình mặc định
local stats = {
    speed = 16,
    jump = 50,
    health = 100,
    flySpeed = 50,
    autoMaintain = true,
    flying = false
}

local flyForce, flyGyro

-- Reset tham chiếu khi nhân vật hồi sinh
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    hrp = newChar:WaitForChild("HumanoidRootPart")
    humanoid = newChar:WaitForChild("Humanoid")
    if stats.flying then stats.flying = false end
end)

-- KHỞI TẠO GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "StatsController_V6"
screenGui.ResetOnSpawn = false

-- Khung chính
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 320, 0, 420) -- Chỉnh lại chiều cao cho vừa vặn
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.ClipsDescendants = true -- Bắt buộc để khi thu nhỏ không bị lòi chữ ra ngoài
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12) -- Bo góc MainFrame

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "⚡ STATS CONTROLLER V6"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- NÚT MINIMIZE (THU NHỎ)
local miniBtn = Instance.new("TextButton", mainFrame)
miniBtn.Size = UDim2.new(0, 30, 0, 30)
miniBtn.Position = UDim2.new(1, -35, 0, 5)
miniBtn.Text = "-"
miniBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
miniBtn.TextColor3 = Color3.new(1, 1, 1)
miniBtn.Font = Enum.Font.GothamBold
miniBtn.TextSize = 18
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0, 8) -- Bo góc nút thu nhỏ

local minimized = false
miniBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    -- Dùng Tween để thu nhỏ mượt mà
    if minimized then
        mainFrame:TweenSize(UDim2.new(0, 320, 0, 40), "Out", "Quad", 0.3, true)
        miniBtn.Text = "+"
    else
        mainFrame:TweenSize(UDim2.new(0, 320, 0, 420), "Out", "Quad", 0.3, true)
        miniBtn.Text = "-"
    end
end)

-- Hàm tạo các dòng nhập liệu có Label rõ ràng
local function createInput(name, default, posY)
    local frame = Instance.new("Frame", mainFrame)
    frame.Size = UDim2.new(1, -20, 0, 50)
    frame.Position = UDim2.new(0, 10, 0, posY)
    frame.BackgroundTransparency = 1

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.5, 0, 1, 0)
    label.Text = name .. ":"
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(0.45, 0, 0.7, 0)
    box.Position = UDim2.new(0.55, 0, 0.15, 0)
    box.Text = tostring(default)
    box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.Font = Enum.Font.Code
    box.TextSize = 14
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6) -- Bo góc TextBox

    box.FocusLost:Connect(function()
        local val = tonumber(box.Text)
        local statKey = name == "Walk Speed" and "speed" 
            or name == "Jump Power" and "jump" 
            or name == "Health (Bypass)" and "health" 
            or name == "Fly Speed" and "flySpeed"
            
        if val then 
            stats[statKey] = val 
        else 
            box.Text = tostring(stats[statKey])
        end
    end)
    return box
end

-- Tạo 4 ô thông số
local speedInput = createInput("Walk Speed", stats.speed, 50)
local jumpInput = createInput("Jump Power", stats.jump, 110)
local healthInput = createInput("Health (Bypass)", stats.health, 170)
local flySpeedInput = createInput("Fly Speed", stats.flySpeed, 230)

-- NÚT FLY
local flyBtn = Instance.new("TextButton", mainFrame)
flyBtn.Size = UDim2.new(1, -20, 0, 40)
flyBtn.Position = UDim2.new(0, 10, 0, 310)
flyBtn.Text = "FLY: OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(80, 20, 120)
flyBtn.TextColor3 = Color3.new(1, 1, 1)
flyBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 8) -- Bo góc nút Fly

flyBtn.MouseButton1Click:Connect(function()
    stats.flying = not stats.flying
    flyBtn.Text = "FLY: " .. (stats.flying and "ON" or "OFF")
    flyBtn.BackgroundColor3 = stats.flying and Color3.fromRGB(130, 30, 200) or Color3.fromRGB(80, 20, 120)
    
    if stats.flying then
        flyForce = Instance.new("BodyPosition", hrp)
        flyForce.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        flyForce.Position = hrp.Position

        flyGyro = Instance.new("BodyGyro", hrp)
        flyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        flyGyro.P = 3000
    else
        if flyForce then flyForce:Destroy() end
        if flyGyro then flyGyro:Destroy() end
        humanoid.PlatformStand = false
    end
end)

-- NÚT AUTO-MAINTAIN
local autoBtn = Instance.new("TextButton", mainFrame)
autoBtn.Size = UDim2.new(1, -20, 0, 40)
autoBtn.Position = UDim2.new(0, 10, 0, 360)
autoBtn.Text = "Auto-Maintain: ON"
autoBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
autoBtn.TextColor3 = Color3.new(1, 1, 1)
autoBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", autoBtn).CornerRadius = UDim.new(0, 8) -- Bo góc nút Auto-Maintain

autoBtn.MouseButton1Click:Connect(function()
    stats.autoMaintain = not stats.autoMaintain
    autoBtn.Text = "Auto-Maintain: " .. (stats.autoMaintain and "ON" or "OFF")
    autoBtn.BackgroundColor3 = stats.autoMaintain and Color3.fromRGB(0, 120, 215) or Color3.fromRGB(100, 100, 100)
end)

-- HỆ THỐNG KÉO THẢ (DRAG)
local dragging, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true dragStart = input.Position startPos = mainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

-- VÒNG LẶP CHÍNH CẬP NHẬT LIÊN TỤC
RunService.Heartbeat:Connect(function()
    if not character or not hrp or not humanoid then return end

    -- Xử lý Logic Bay
    if stats.flying then
        local moveDir = Vector3.new()
        local cam = workspace.CurrentCamera
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0,1,0) end

        if moveDir.Magnitude > 0 then
            flyForce.Position = hrp.Position + (moveDir.Unit * stats.flySpeed)
        else
            flyForce.Position = hrp.Position
        end
        
        flyGyro.CFrame = cam.CFrame
        humanoid.PlatformStand = true
    end

    -- Ép chỉ số liên tục
    if stats.autoMaintain then
        if humanoid.MaxHealth ~= stats.health then humanoid.MaxHealth = stats.health end
        if humanoid.Health ~= stats.health then humanoid.Health = stats.health end

        if not stats.flying then
            humanoid.WalkSpeed = stats.speed
            humanoid.UseJumpPower = true
            humanoid.JumpPower = stats.jump
            humanoid.PlatformStand = false
        end
    end
end)

print("⚡ Stats Controller V6 (With Minimize & UICorner) Loaded!")
