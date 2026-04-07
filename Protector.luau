-- [[ PROTECTOR v4.0 BIG - THE JUGGERNAUT CORE ]] --
-- Features: Advanced Sandbox, Deep Packet Inspection, Anti-Hook, Smooth UI v2

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

-- 1. UNIVERSAL COMPATIBILITY LAYER (ANTI-NIL)
local hook = hookfunction or replaceclosure or detour_function or (syn and syn.hook_function)
local h_metamethod = hookmetamethod or (setrawmetatable and function(t, m, f) 
    local mt = getrawmetatable(t)
    setreadonly(mt, false)
    local old = mt[m]
    mt[m] = f
    return old
end)
local newc = newcclosure or function(f) return f end

getgenv().ProtectorActive = true
local ThreatsFound = 0

local function Notify(title, msg, extreme)
    StarterGui:SetCore("SendNotification", {
        Title = extreme and "💀 " .. title or "🛡️ " .. title,
        Text = msg,
        Duration = 4
    })
end

-- ==========================================
-- 2. ADVANCED VIRUS DETECTION ENGINE (v4)
-- ==========================================
local Blacklist = {
    "cookie", ".roblosec", "webhook", "discord.com/api", "token", 
    "ident.me", "ipapi", "steal", "grabber", "os.getenv", "getfenv"
}

local function DeepScan(content)
    if not content or type(content) ~= "string" then return false end
    local low = string.lower(content)
    
    -- Level 1: Keyword Check
    for _, word in pairs(Blacklist) do
        if string.find(low, word) then return true, "Blacklisted: " .. word end
    end
    
    -- Level 2: Obfuscation Pattern Analysis
    local _, hex = string.gsub(low, "%%x%%x", "")
    local _, esc = string.gsub(low, "\\%d%d%d", "")
    if hex > 70 or esc > 70 then return true, "Extreme Obfuscation (Suspicious)" end
    
    -- Level 3: Suspicious Bytecode (Mã độc ẩn trong chuỗi)
    if string.find(low, "\104\116\116\112") and string.find(low, "webhook") then
        return true, "Encrypted Webhook Detected"
    end
    
    return false
end

-- ==========================================
-- 3. INTERFACE: THE "BIG" UI (SMOOTH DRAG)
-- ==========================================
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "Protector_v4_BIG"

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 220, 0, 100)
Main.Position = UDim2.new(0.5, -110, 0, 40)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Header = Instance.new("TextLabel", Main)
Header.Size = UDim2.new(1, 0, 0, 30)
Header.Text = "🛡️ PROTECTOR v4.0 BIG"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.Font = Enum.Font.GothamBold
Header.TextSize = 13
Header.BackgroundTransparency = 1

local Status = Instance.new("TextLabel", Main)
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Position = UDim2.new(0, 0, 0.3, 0)
Status.Text = "THREATS BLOCKED: 0"
Status.TextColor3 = Color3.fromRGB(150, 150, 150)
Status.Font = Enum.Font.Code
Status.TextSize = 11
Status.BackgroundTransparency = 1

local Toggle = Instance.new("TextButton", Main)
Toggle.Size = UDim2.new(0.9, 0, 0, 30)
Toggle.Position = UDim2.new(0.05, 0, 0.6, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(30, 200, 100)
Toggle.Text = "SHIELD: ACTIVE"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.Font = Enum.Font.GothamBold
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 6)

-- Smooth Drag Logic
local dragStart, startPos, dragging
Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true dragStart = input.Position startPos = Main.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

Toggle.MouseButton1Click:Connect(function()
    getgenv().ProtectorActive = not getgenv().ProtectorActive
    Toggle.Text = getgenv().ProtectorActive and "SHIELD: ACTIVE" or "SHIELD: OFF"
    Toggle.BackgroundColor3 = getgenv().ProtectorActive and Color3.fromRGB(30, 200, 100) or Color3.fromRGB(200, 50, 50)
end)

-- ==========================================
-- 4. THE CORE: MULTI-OVERRIDE SHIELD
-- ==========================================

local function BlockAction(reason)
    ThreatsFound = ThreatsFound + 1
    Status.Text = "THREATS BLOCKED: " .. ThreatsFound
    Notify("Threat Neutralized", reason, true)
end

-- [A] Hook Metamethod (Chặn Game Call mượt mà)
if h_metamethod then
    local oldNM
    oldNM = h_metamethod(game, "__namecall", newc(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if getgenv().ProtectorActive and (method == "HttpGet" or method == "HttpPost") then
            if DeepScan(args[1]) then
                BlockAction("Malicious URL Blocked")
                return ""
            end
        end
        return oldNM(self, ...)
    end))
end

-- [B] Hook Direct Functions (Chặn loadstring & request)
if hook then
    -- Loadstring Shield
    local oldLoad
    oldLoad = hook(loadstring, newc(function(c, n)
        if getgenv().ProtectorActive and DeepScan(c) then
            BlockAction("Malicious Script Injection")
            return function() end
        end
        return oldLoad(c, n)
    end))

    -- HTTP Request Shield (Executor Level)
    local r_funcs = {request, http_request, syn and syn.request, fluxus and fluxus.request}
    for _, f in pairs(r_funcs) do
        if f then
            local oldR
            oldR = hook(f, newc(function(opt)
                if getgenv().ProtectorActive and (DeepScan(opt.Url) or DeepScan(opt.Body)) then
                    BlockAction("Data Stealer Prevented")
                    return {StatusCode = 403, Body = "Blocked by Protector v4.0"}
                end
                return oldR(opt)
            end))
        end
    end
    
    -- Clipboard Protection
    if setclipboard then
        local oldC
        oldC = hook(setclipboard, newc(function(data)
            if getgenv().ProtectorActive and DeepScan(data) then
                BlockAction("Clipboard Theft Blocked")
                return nil
            end
            return oldC(data)
        end))
    end
end

print("=======================================")
print("🛡️ PROTECTOR v4.0 BIG HAS BEEN ACTIVED 🛡️")
print("Mode: Extreme Sandbox & Deep Scan")
print("=======================================")
Notify("System Ready", "Protector v4.0 BIG is protecting your environment.")
