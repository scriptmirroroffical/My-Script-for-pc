-- [[ ULTIMATE PROTECTOR SYSTEM v3.0 - EXTREME EDITION ]] --
-- Features: Smooth Drag UI, Deep Scan, Anti-Tamper, Stack Tracing

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

getgenv().ProtectorExtremeActive = true

local function DefenderAlert(title, msg, isExtreme)
    StarterGui:SetCore("SendNotification", {
        Title = isExtreme and "💀 " .. title or "🛡️ " .. title,
        Text = msg,
        Duration = 6
    })
end

-- ==========================================
-- 1. GIAO DIỆN VỚI SMOOTH DRAG TÍCH HỢP
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProtectorExtremeUI"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 60)
MainFrame.Position = UDim2.new(0.5, -100, 0, 20)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 20)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🛡️ Extreme Protector"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 12
TitleLabel.Parent = MainFrame

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0.9, 0, 0, 30)
ToggleBtn.Position = UDim2.new(0.05, 0, 0, 25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleBtn.Text = "STATUS: SECURE"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
ToggleBtn.Font = Enum.Font.GothamSemibold
ToggleBtn.TextSize = 14
ToggleBtn.Parent = MainFrame
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

-- Hệ thống Smooth Drag
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        TweenService:Create(MainFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
    end
end)

ToggleBtn.MouseButton1Click:Connect(function()
    getgenv().ProtectorExtremeActive = not getgenv().ProtectorExtremeActive
    if getgenv().ProtectorExtremeActive then
        ToggleBtn.Text = "STATUS: SECURE"
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
        DefenderAlert("System", "Extreme Shield Reactivated!")
    else
        ToggleBtn.Text = "STATUS: EXPOSED"
        ToggleBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
        DefenderAlert("Warning", "Extreme Shield is OFF!", true)
    end
end)

-- ==========================================
-- 2. HỆ THỐNG DEEP SCAN & ANTI-TAMPER
-- ==========================================

local BlacklistRegex = {
    "roblosec", "cookie", "discord%.com/api/webhooks", "webhook",
    "ipapi", "ident%.me", "token", "steal", "mailstealer", "ps99"
}

-- Thuật toán Deep Scan: Dò tìm mã độc ẩn (Obfuscated)
local function DeepScan(content)
    if not content then return false end
    local lowerContent = string.lower(tostring(content))
    
    -- Kiểm tra từ khóa rõ ràng
    for _, pattern in ipairs(BlacklistRegex) do
        if string.find(lowerContent, pattern) then
            return true, "Blacklist Word: " .. pattern
        end
    end
    
    -- Kiểm tra hành vi mã hóa chuỗi (thường dùng để giấu webhook)
    local hexCount = select(2, string.gsub(lowerContent, "%%x%%x", ""))
    local escapeCount = select(2, string.gsub(lowerContent, "\\%d%d%d", ""))
    
    if hexCount > 50 or escapeCount > 50 then
        return true, "Highly Obfuscated Payload (Suspicious)"
    end
    
    return false, "Safe"
end

-- Traceback: Truy tìm nguồn gốc script gọi hàm
local function GetCallerInfo()
    local trace = debug.traceback()
    -- Cắt bỏ các phần của chính Protector để xem script nào đang gọi
    local callerLine = string.split(trace, "\n")[3] or "Unknown Script"
    return callerLine
end

-- Tự bảo vệ (Anti-Tamper): Ngăn script khác vô hiệu hóa Protector bằng cách hook đè
local originalHookFunction = hookfunction
originalHookFunction(hookfunction, function(target, replacement)
    if getgenv().ProtectorExtremeActive then
        -- Nếu một script cố gắng hook vào các hàm hệ thống mà Protector đang canh giữ
        if target == game.HttpGet or target == loadstring then
            warn("💀 [Protector Anti-Tamper]: Đã chặn hành vi Hook đè hệ thống!")
            return function() end -- Trả về hàm rỗng
        end
    end
    return originalHookFunction(target, replacement)
end)

-- ==========================================
-- 3. NETWORK & MEMORY HOOKS CỰC MẠNH
-- ==========================================

-- Chặn HttpGet/HttpPost qua Namecall
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    if getgenv().ProtectorExtremeActive and (method == "HttpGet" or method == "HttpPost" or method == "HttpGetAsync") then
        local url = args[1]
        local isThreat, reason = DeepScan(url)
        if isThreat then
            DefenderAlert("Connection Terminated", "Ngăn chặn kết nối: " .. reason, true)
            warn("❌ [Protector]: Chặn " .. tostring(url) .. " | Nguồn gọi: " .. GetCallerInfo())
            return ""
        end
    end
    return oldNamecall(self, ...)
end)

-- Chặn mọi loại HTTP Requests
local requestFuncs = {request, http_request, syn and syn.request}
for _, func in pairs(requestFuncs) do
    if func then
        local oldReq
        oldReq = hookfunction(func, function(options)
            if getgenv().ProtectorExtremeActive and type(options) == "table" then
                local isThreatUrl, reasonUrl = DeepScan(options.Url)
                local isThreatBody, reasonBody = DeepScan(options.Body)
                
                if isThreatUrl or isThreatBody then
                    DefenderAlert("Webhook Blocked", "Đã tiêu diệt luồng dữ liệu đánh cắp!", true)
                    warn("❌ [Protector HTTP]: Chặn Request tới " .. tostring(options.Url))
                    return {StatusCode = 403, StatusMessage = "Forbidden", Body = "Blocked by Protector"}
                end
            end
            return oldReq(options)
        end)
    end
end

-- Chặn loadstring bằng Deep Scan
if loadstring then
    local oldLoad
    oldLoad = hookfunction(loadstring, function(chunk, name)
        if getgenv().ProtectorExtremeActive then
            local isThreat, reason = DeepScan(chunk)
            if isThreat then
                DefenderAlert("Memory Shield", "Phát hiện mã độc trong bộ nhớ: " .. reason, true)
                warn("❌ [Protector Loadstring]: Đã hủy một đoạn mã (" .. reason .. ")")
                return function() warn("Payload Destroyed") end
            end
        end
        return oldLoad(chunk, name)
    end)
end

print("💀 [EXTREME PROTECTOR]: Khởi động hoàn tất. Môi trường đã bị khóa chặt.")
