-- Modern FPS Optimizer Ultra + Visual Effects (v2026)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Content = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local FPSInput = Instance.new("TextBox")

-- Ghi nhớ cài đặt gốc
local OriginalSettings = {
    GlobalShadows = game.Lighting.GlobalShadows,
    QualityLevel = settings().Rendering.QualityLevel
}

-- Setup Main Frame
ScreenGui.Parent = game.CoreGui
Frame.Name = "OptimizerHub"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.5, -130, 0.4, -150)
Frame.Size = UDim2.new(0, 260, 0, 380)
Frame.Active = true
Frame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

-- Hiệu ứng Đổi màu (RGB) cho Tiêu đề
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Font = Enum.Font.GothamBold
Title.Text = "SYSTEM OPTIMIZER PRO"
Title.TextSize = 14
Title.BackgroundTransparency = 1

spawn(function()
    while task.wait() do
        local hue = tick() % 5 / 5
        Title.TextColor3 = Color3.fromHSV(hue, 0.7, 1) -- Chuyển màu cầu vồng mượt
    end
end)

-- Ô nhập FPS
FPSInput.Parent = Frame
FPSInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
FPSInput.Position = UDim2.new(0, 15, 0, 50)
FPSInput.Size = UDim2.new(1, -30, 0, 35)
FPSInput.Font = Enum.Font.Gotham
FPSInput.PlaceholderText = "Nhập FPS (VD: 144)..."
FPSInput.Text = ""
FPSInput.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSInput.TextSize = 14
Instance.new("UICorner", FPSInput).CornerRadius = UDim.new(0, 6)

FPSInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local num = tonumber(FPSInput.Text)
        if num then setfpscap(num) end
    end
end)

-- Khu vực chứa nút
Content.Parent = Frame
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 10, 0, 95)
Content.Size = UDim2.new(1, -20, 1, -110)
Content.CanvasSize = UDim2.new(0, 0, 1.4, 0)
Content.ScrollBarThickness = 2
UIListLayout.Parent = Content
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createLevelBtn(name, text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = Content
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.BackgroundColor3 = color
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Các nút chức năng
createLevelBtn("Auto", "MODE: AUTO", Color3.fromRGB(60, 120, 180), function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level05
    game.Lighting.GlobalShadows = true
end)

createLevelBtn("Lvl1", "LEVEL 1: LOW", Color3.fromRGB(180, 150, 60), function()
    game.Lighting.GlobalShadows = false
end)

createLevelBtn("Lvl2", "LEVEL 2: MEDIUM", Color3.fromRGB(180, 100, 50), function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

local Lvl3Btn = createLevelBtn("Lvl3", "LEVEL 3: ULTRA (POTATO)", Color3.fromRGB(180, 50, 50), function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic
        elseif v:IsA("Texture") or v:IsA("Decal") then v.Transparency = 1 end
    end
end)

-- Hiệu ứng NHẤP NHÁY cho nút Level 3
spawn(function()
    while task.wait(0.5) do
        Lvl3Btn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        task.wait(0.5)
        Lvl3Btn.BackgroundColor3 = Color3.fromRGB(100, 20, 20) -- Màu đỏ tối hơn
    end
end)

createLevelBtn("Reset", "♻️ RESET TO DEFAULT", Color3.fromRGB(100, 100, 100), function()
    game.Lighting.GlobalShadows = OriginalSettings.GlobalShadows
    settings().Rendering.QualityLevel = OriginalSettings.QualityLevel
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then v.Material = Enum.Material.Plastic
        elseif v:IsA("Texture") or v:IsA("Decal") then v.Transparency = 0 end
    end
end)

print("GUI Optimizer with RGB & Pulse effects loaded!")