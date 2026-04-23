-- ==============================================================================
-- 🚀 OMNI-GOD RECON DRONE: ULTIMATE EDITION (V5.1 + SPEED CONTROLLER)
-- ==============================================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- ==========================================
-- ⚙️ CẤU HÌNH HỆ THỐNG
-- ==========================================
local DRONE_SPEED = 60
local NITRO_MULT = 2.5
local SMOOTHNESS = 0.15
local SCAN_RANGE = 500
local SCAN_COOLDOWN = 3

-- Biến Trạng Thái
local droneActive = false
local currentDrone = nil
local isNitro, isUp, isDown = false, false, false
local isScanning = false
local oldWalkSpeed, oldJumpPower = 16, 50

-- Connections
local hbConn, renderConn, deathConn

-- UI Elements
local uiElements = {}
local colorCorrection = nil

-- ==========================================
-- 🛠️ HÀM TIỆN ÍCH
-- ==========================================
local function makeDraggable(gui)
    local dragging, dragInput, dragStart, startPos
    gui.Active = true
    gui.Selectable = true

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    RunService.RenderStepped:Connect(function()
        if dragging and dragInput then
            local delta = dragInput.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local function sendNotification(text, color)
    if not uiElements.ScreenGui then return end
    
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0.3, 0, 0.05, 0)
    notif.Position = UDim2.new(0.35, 0, 0.8, 0)
    notif.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    notif.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    notif.Text = text
    notif.Font = Enum.Font.GothamBold
    notif.TextScaled = true
    notif.BackgroundTransparency = 1
    notif.TextTransparency = 1
    notif.Parent = uiElements.ScreenGui

    local uiStroke = Instance.new("UIStroke", notif)
    uiStroke.Thickness = 2
    uiStroke.Transparency = 1

    TweenService:Create(notif, TweenInfo.new(0.3), {BackgroundTransparency = 0.3, TextTransparency = 0}):Play()
    TweenService:Create(uiStroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
    
    task.delay(2, function()
        local fade = TweenService:Create(notif, TweenInfo.new(0.5), {BackgroundTransparency = 1, TextTransparency = 1})
        TweenService:Create(uiStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
        fade:Play()
        fade.Completed:Wait()
        notif:Destroy()
    end)
end

-- ==========================================
-- 👁️ KỸ NĂNG DRONE
-- ==========================================
local function toggleNightVision(state)
    if state then
        if not colorCorrection then
            colorCorrection = Instance.new("ColorCorrectionEffect")
            colorCorrection.Name = "DroneVision"
            colorCorrection.TintColor = Color3.fromRGB(150, 255, 200)
            colorCorrection.Contrast = 0.2
            colorCorrection.Saturation = -0.5
            colorCorrection.Parent = Lighting
        end
    else
        if colorCorrection then
            colorCorrection:Destroy()
            colorCorrection = nil
        end
    end
end

local function scanTargets()
    if isScanning or not droneActive then return end
    isScanning = true
    sendNotification("SCANNING AREA...", Color3.fromRGB(0, 255, 255))
    
    local found = 0
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (p.Character.HumanoidRootPart.Position - currentDrone.Position).Magnitude
            if distance <= SCAN_RANGE then
                found += 1
                local hl = Instance.new("Highlight")
                hl.Name = "OmniTarget"
                hl.FillColor = Color3.fromRGB(255, 0, 50)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.FillTransparency = 0.5
                hl.Parent = p.Character
                Debris:AddItem(hl, 5)
            end
        end
    end
    
    if found > 0 then
        sendNotification("FOUND " .. found .. " TARGET(S)!", Color3.fromRGB(0, 255, 0))
    else
        sendNotification("NO TARGETS FOUND", Color3.fromRGB(255, 100, 100))
    end

    task.wait(SCAN_COOLDOWN)
    isScanning = false
end

-- ==========================================
-- 🎮 LOGIC ĐIỀU KHIỂN
-- ==========================================
local function setDroneState(state)
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    
    if not hum or not hrp then return end

    droneActive = state
    uiElements.DragContainer.Visible = not droneActive
    uiElements.ControlFrame.Visible = droneActive
    uiElements.Crosshair.Visible = droneActive
    
    if droneActive then
        oldWalkSpeed, oldJumpPower = hum.WalkSpeed, hum.JumpPower
        hum.PlatformStand = true
        
        hbConn = RunService.Heartbeat:Connect(function()
            if hum and hum.Parent then
                hum.WalkSpeed, hum.JumpPower = 0, 0
                if hrp then hrp.Velocity = Vector3.new(0, 0, 0) end
            end
        end)

        currentDrone = Instance.new("Part")
        currentDrone.Name = "OmniDrone_Entity"
        currentDrone.Size = Vector3.new(1.5, 0.5, 1.5)
        currentDrone.Transparency = 1
        currentDrone.Anchored = true
        currentDrone.CanCollide = false
        currentDrone.CFrame = hrp.CFrame * CFrame.new(0, 5, -3)
        currentDrone.Parent = workspace

        local mesh = Instance.new("SpecialMesh", currentDrone)
        mesh.MeshId = "rbxassetid://2373177878"
        mesh.TextureId = "rbxassetid://2373177962"
        mesh.Scale = Vector3.new(0.6, 0.6, 0.6)

        local light = Instance.new("PointLight", currentDrone)
        light.Color = Color3.fromRGB(0, 255, 255)
        light.Range = 10
        light.Brightness = 2

        toggleNightVision(true)
        sendNotification("DRONE DEPLOYED", Color3.fromRGB(0, 255, 255))

        renderConn = RunService.RenderStepped:Connect(function(dt)
            if not currentDrone or not droneActive then return end
            
            local inputNitro = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or isNitro
            local inputUp = UserInputService:IsKeyDown(Enum.KeyCode.Q) or isUp
            local inputDown = UserInputService:IsKeyDown(Enum.KeyCode.R) or isDown
            
            local currentSpd = inputNitro and (DRONE_SPEED * NITRO_MULT) or DRONE_SPEED
            local moveDir = Vector3.new(0, 0, 0)

            local targetFOV = inputNitro and 90 or 70
            camera.FieldOfView = camera.FieldOfView + (targetFOV - camera.FieldOfView) * 0.1

            if uiElements.SpeedLabel then
                uiElements.SpeedLabel.Text = string.format("SPD: %d | ALT: %d", currentSpd, math.floor(currentDrone.Position.Y))
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += camera.CFrame.RightVector end
            if inputUp then moveDir += Vector3.new(0, 1, 0) end
            if inputDown then moveDir -= Vector3.new(0, 1, 0) end

            pcall(function()
                local controlModule = require(player.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
                local mv = controlModule:GetMoveVector()
                if mv.Magnitude > 0 then
                    moveDir += (camera.CFrame.RightVector * mv.X) + (camera.CFrame.LookVector * -mv.Z)
                end
            end)

            if moveDir.Magnitude > 0 then
                local targetPos = currentDrone.Position + (moveDir.Unit * currentSpd * dt)
                currentDrone.CFrame = currentDrone.CFrame:Lerp(CFrame.lookAt(targetPos, targetPos + camera.CFrame.LookVector), SMOOTHNESS)
            else
                currentDrone.CFrame = currentDrone.CFrame:Lerp(CFrame.lookAt(currentDrone.Position, currentDrone.Position + camera.CFrame.LookVector), SMOOTHNESS)
            end

            camera.CameraSubject = currentDrone
        end)

        deathConn = hum.Died:Connect(function()
            if droneActive then setDroneState(false) end
        end)

    else
        if hbConn then hbConn:Disconnect() end
        if renderConn then renderConn:Disconnect() end
        if deathConn then deathConn:Disconnect() end
        
        toggleNightVision(false)
        camera.FieldOfView = 70
        isNitro, isUp, isDown = false, false, false
        
        if uiElements.NitroBtn then
            uiElements.NitroBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        end

        if hum then
            hum.PlatformStand = false
            hum.WalkSpeed = oldWalkSpeed
            hum.JumpPower = oldJumpPower
            camera.CameraSubject = hum
        end
        
        if currentDrone then
            currentDrone:Destroy()
            currentDrone = nil
        end
        
        sendNotification("DRONE RECALLED", Color3.fromRGB(255, 150, 0))
    end
end

-- ==========================================
-- 🎨 XÂY DỰNG GIAO DIỆN CHÍNH
-- ==========================================
local function buildUI()
    if CoreGui:FindFirstChild("OmniGod_Ultimate") then
        CoreGui.OmniGod_Ultimate:Destroy()
    elseif player.PlayerGui:FindFirstChild("OmniGod_Ultimate") then
        player.PlayerGui.OmniGod_Ultimate:Destroy()
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = "OmniGod_Ultimate"
    sg.ResetOnSpawn = false
    pcall(function() sg.Parent = CoreGui end)
    if not sg.Parent then sg.Parent = player.PlayerGui end
    uiElements.ScreenGui = sg

    -- LAUNCHER CONTRAINER
    local dragContainer = Instance.new("Frame", sg)
    dragContainer.Size = UDim2.new(0.12, 0, 0.08, 0)
    dragContainer.Position = UDim2.new(0.05, 0, 0.15, 0)
    dragContainer.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    dragContainer.BackgroundTransparency = 0.3
    Instance.new("UICorner", dragContainer).CornerRadius = UDim.new(0.2, 0)
    Instance.new("UIStroke", dragContainer).Color = Color3.fromRGB(0, 255, 255)
    makeDraggable(dragContainer)
    uiElements.DragContainer = dragContainer

    local openBtn = Instance.new("TextButton", dragContainer)
    openBtn.Size = UDim2.new(0.9, 0, 0.8, 0)
    openBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    openBtn.Position = UDim2.new(0.5, 0, 0.5, 0)
    openBtn.Text = "DEPLOY DRONE"
    openBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    openBtn.TextColor3 = Color3.new(1, 1, 1)
    openBtn.Font = Enum.Font.GothamBlack
    openBtn.TextScaled = true
    Instance.new("UICorner", openBtn)
    
    openBtn.MouseButton1Click:Connect(function() setDroneState(true) end)

    -- CROSSHAIR
    local crosshair = Instance.new("ImageLabel", sg)
    crosshair.Size = UDim2.new(0, 50, 0, 50)
    crosshair.AnchorPoint = Vector2.new(0.5, 0.5)
    crosshair.Position = UDim2.new(0.5, 0, 0.5, 0)
    crosshair.BackgroundTransparency = 1
    crosshair.Image = "rbxassetid://15281488106"
    crosshair.ImageColor3 = Color3.fromRGB(0, 255, 255)
    crosshair.Visible = false
    uiElements.Crosshair = crosshair

    -- CONTROL PANEL (Cập nhật kích thước cao hơn để chứa nút Speed)
    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(0.35, 0, 0.55, 0) -- Cao hơn bản cũ (0.45 -> 0.55)
    frame.Position = UDim2.new(0.325, 0, 0.25, 0)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BackgroundTransparency = 0.15
    frame.Visible = false
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0.05, 0)
    
    local fStroke = Instance.new("UIStroke", frame)
    fStroke.Color = Color3.fromRGB(0, 200, 255)
    fStroke.Thickness = 2
    makeDraggable(frame)
    uiElements.ControlFrame = frame

    -- Title & HUD
    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0.1, 0)
    title.Text = "⚡ OMNI-GOD RECON ⚡"
    title.TextColor3 = Color3.fromRGB(0, 255, 255)
    title.Font = Enum.Font.GothamBlack
    title.TextScaled = true
    title.BackgroundTransparency = 1

    local speedLab = Instance.new("TextLabel", frame)
    speedLab.Size = UDim2.new(1, 0, 0.08, 0)
    speedLab.Position = UDim2.new(0, 0, 0.1, 0)
    speedLab.Text = "SPD: 0 | ALT: 0"
    speedLab.TextColor3 = Color3.fromRGB(200, 255, 200)
    speedLab.Font = Enum.Font.Code
    speedLab.TextScaled = true
    speedLab.BackgroundTransparency = 1
    uiElements.SpeedLabel = speedLab

    -- Helper Tạo Nút
    local function createButton(txt, size, pos, col, parent)
        local b = Instance.new("TextButton", parent)
        b.Size, b.Position, b.Text = size, pos, txt
        b.BackgroundColor3 = col or Color3.fromRGB(35, 35, 35)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Font = Enum.Font.GothamBold
        b.TextScaled = true
        b.AutoButtonColor = true
        Instance.new("UICorner", b).CornerRadius = UDim.new(0.2, 0)
        return b
    end

    -- Khởi tạo nút (Bố cục chia dòng)
    local exitB = createButton("EXIT DRONE", UDim2.new(0.9, 0, 0.12, 0), UDim2.new(0.05, 0, 0.22, 0), Color3.fromRGB(180, 20, 20), frame)
    
    local scanB = createButton("SCAN AREA", UDim2.new(0.42, 0, 0.15, 0), UDim2.new(0.05, 0, 0.38, 0), Color3.fromRGB(0, 100, 200), frame)
    local nitroB = createButton("NITRO", UDim2.new(0.42, 0, 0.15, 0), UDim2.new(0.53, 0, 0.38, 0), Color3.fromRGB(35, 35, 35), frame)
    
    local upB = createButton("⬆ UP (Q)", UDim2.new(0.42, 0, 0.15, 0), UDim2.new(0.05, 0, 0.57, 0), Color3.fromRGB(40, 40, 40), frame)
    local downB = createButton("⬇ DOWN (R)", UDim2.new(0.42, 0, 0.15, 0), UDim2.new(0.53, 0, 0.57, 0), Color3.fromRGB(40, 40, 40), frame)

    -- HAI NÚT MỚI: ĐIỀU CHỈNH TỐC ĐỘ (SPEED CONTROLLER)
    local spdMinusB = createButton("SPD -50", UDim2.new(0.42, 0, 0.15, 0), UDim2.new(0.05, 0, 0.76, 0), Color3.fromRGB(150, 100, 0), frame)
    local spdPlusB = createButton("SPD +50", UDim2.new(0.42, 0, 0.15, 0), UDim2.new(0.53, 0, 0.76, 0), Color3.fromRGB(0, 150, 50), frame)

    uiElements.NitroBtn = nitroB

    -- Logic Nút
    exitB.MouseButton1Click:Connect(function() setDroneState(false) end)
    scanB.MouseButton1Click:Connect(scanTargets)

    nitroB.MouseButton1Click:Connect(function()
        isNitro = not isNitro
        nitroB.BackgroundColor3 = isNitro and Color3.fromRGB(0, 200, 200) or Color3.fromRGB(35, 35, 35)
        sendNotification(isNitro and "NITRO ENGAGED" or "NITRO DISENGAGED", isNitro and Color3.fromRGB(0,255,255) or Color3.fromRGB(255,255,255))
    end)
    spdMinusB.MouseButton1Click:Connect(function()
        DRONE_SPEED = math.clamp(DRONE_SPEED - 50, 40, 1000000000000000)
        sendNotification("SPEED DECREASED TO: " .. DRONE_SPEED, Color3.fromRGB(255, 255, 100))
    end)

    spdPlusB.MouseButton1Click:Connect(function()
        DRONE_SPEED = math.clamp(DRONE_SPEED + 50, 40, 1000000000000000)
        sendNotification("SPEED INCREASED TO: " .. DRONE_SPEED, Color3.fromRGB(100, 255, 100))
    end)

    -- Touch/Hold Logic
    upB.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then isUp = true end end)
    upB.InputEnded:Connect(function() isUp = false end)

    downB.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then isDown = true end end)
    downB.InputEnded:Connect(function() isDown = false end)

    -- PC Hotkeys
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed or not droneActive then return end
        if input.KeyCode == Enum.KeyCode.E then scanTargets() end
    end)
end

-- ==========================================
-- 🚀 KHỞI CHẠY
-- ==========================================
buildUI()
print("✅ OMNI-GOD RECON V5.1 LOADED!")
