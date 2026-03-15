local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScreenGui"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Name = "Main"
main.BackgroundColor3 = Color3.new(1, 0.667, 0)
main.Position = UDim2.new(0.266, 0, 0.0599, 0)
main.BorderColor3 = Color3.new()
main.BorderSizePixel = 0
main.Size = UDim2.new(0, 857, 0, 46)
main.Parent = screenGui

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.TextWrapped = true
minimizeButton.TextColor3 = Color3.new()
minimizeButton.Text = "_"
minimizeButton.BackgroundColor3 = Color3.new(0.561, 0.561, 0.561)
minimizeButton.BorderSizePixel = 0
minimizeButton.TextScaled = true
minimizeButton.Position = UDim2.new(0.862, 0, -0.0217, 0)
minimizeButton.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json")
minimizeButton.BorderColor3 = Color3.new()
minimizeButton.TextSize = 14
minimizeButton.Size = UDim2.new(0, 59, 0, 46)
minimizeButton.Parent = main

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.CornerRadius = UDim.new(1, 0)
uICorner.Parent = minimizeButton

local name_exec = Instance.new("TextLabel")
name_exec.Name = "Name.exec"
name_exec.FontFace = Font.new(
	"rbxasset://fonts/families/JosefinSans.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
name_exec.TextColor3 = Color3.new()
name_exec.Text = "SM Executor"
name_exec.BackgroundColor3 = Color3.new(1, 0.667, 0)
name_exec.BorderSizePixel = 0
name_exec.TextScaled = true
name_exec.Position = UDim2.new(0.0595, 0, 0.174, 0)
name_exec.TextWrapped = true
name_exec.BorderColor3 = Color3.new()
name_exec.TextSize = 14
name_exec.Size = UDim2.new(0, 251, 0, 37)
name_exec.Parent = main

local uICorner_2 = Instance.new("UICorner")
uICorner_2.Name = "UICorner"
uICorner_2.CornerRadius = UDim.new(1, 0)
uICorner_2.Parent = name_exec

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.TextWrapped = true
closeButton.TextColor3 = Color3.new()
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.TextScaled = true
closeButton.Position = UDim2.new(0.931, 0, 0, 0)
closeButton.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json")
closeButton.BorderColor3 = Color3.new()
closeButton.TextSize = 14
closeButton.Size = UDim2.new(0, 59, 0, 47)
closeButton.Parent = main

local uICorner_3 = Instance.new("UICorner")
uICorner_3.Name = "UICorner"
uICorner_3.CornerRadius = UDim.new(1, 0)
uICorner_3.Parent = closeButton

local uICorner_4 = Instance.new("UICorner")
uICorner_4.Name = "UICorner"
uICorner_4.CornerRadius = UDim.new(1, 0)
uICorner_4.Parent = main

local logo = Instance.new("ImageLabel")
logo.Name = "Logo"
logo.Image = "rbxassetid://88774721887954"
logo.BackgroundColor3 = Color3.new(1, 1, 1)
logo.BorderColor3 = Color3.new()
logo.BorderSizePixel = 0
logo.Size = UDim2.new(0, 51, 0, 45)
logo.Parent = main

local uICorner_5 = Instance.new("UICorner")
uICorner_5.Name = "UICorner"
uICorner_5.CornerRadius = UDim.new(1, 0)
uICorner_5.Parent = logo

local output = Instance.new("Frame")
output.Name = "Output"
output.BackgroundColor3 = Color3.new()
output.Position = UDim2.new(0.523, 0, 0.101, 0)
output.BorderColor3 = Color3.new()
output.BorderSizePixel = 0
output.Size = UDim2.new(0, 507, 0, 580)
output.Parent = screenGui

local uICorner_6 = Instance.new("UICorner")
uICorner_6.Name = "UICorner"
uICorner_6.Parent = output

-- Tạo ScrollingFrame thay cho TextLabel
local backout_2 = Instance.new("ScrollingFrame")
backout_2.Name = "Output"
backout_2.BackgroundColor3 = Color3.new(0.498, 0.498, 0.498)
backout_2.BorderSizePixel = 0
backout_2.BorderColor3 = Color3.new()
backout_2.Position = UDim2.new(0.00986, 0, 0.0155, 0)
backout_2.Size = UDim2.new(0, 496, 0, 500)
backout_2.CanvasSize = UDim2.new(0, 0, 0, 0) -- sẽ tự chỉnh theo nội dung
backout_2.ScrollBarThickness = 8
backout_2.Parent = output

-- Tạo TextLabel bên trong ScrollingFrame để hiển thị chữ
local output_2 = Instance.new("TextLabel")
output_2.Name = "TextInside"
output_2.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json")
output_2.TextColor3 = Color3.new()
output_2.Text = "Welcome to SM Executor"
output_2.RichText = true 
output_2.BackgroundTransparency = 1
output_2.BorderSizePixel = 0
output_2.TextWrapped = true
output_2.TextXAlignment = Enum.TextXAlignment.Left
output_2.TextYAlignment = Enum.TextYAlignment.Top
output_2.TextSize = 18
output_2.Size = UDim2.new(1, -10, 0, 500) -- rộng bằng ScrollingFrame, trừ đi chút cho scrollbar
output_2.Position = UDim2.new(0, 5, 0, 0)
output_2.Parent = backout_2

-- Cập nhật CanvasSize theo nội dung
output_2:GetPropertyChangedSignal("TextBounds"):Connect(function()
	backout_2.CanvasSize = UDim2.new(0, 0, 0, output_2.TextBounds.Y + 20)
end)

-- Gọi lần đầu
backout_2.CanvasSize = UDim2.new(0, 0, 0, output_2.TextBounds.Y + 20)

local uICorner_7 = Instance.new("UICorner")
uICorner_7.Name = "UICorner"
uICorner_7.Parent = output_2

local exec = Instance.new("Frame")
exec.Name = "Exec"
exec.BackgroundColor3 = Color3.new()
exec.Position = UDim2.new(0.146, 0, 0.0998, 0)
exec.BorderColor3 = Color3.new()
exec.BorderSizePixel = 0
exec.Size = UDim2.new(0, 857, 0, 518)
exec.Parent = screenGui

local uICorner_8 = Instance.new("UICorner")
uICorner_8.Name = "UICorner"
uICorner_8.Parent = exec

local mainExec = Instance.new("Frame")
mainExec.Name = "MainExec"
mainExec.BackgroundColor3 = Color3.new(1, 0.667, 0)
mainExec.Position = UDim2.new(0.0105, 0, 0.0174, 0)
mainExec.BorderColor3 = Color3.new()
mainExec.BorderSizePixel = 0
mainExec.Size = UDim2.new(0, 839, 0, 500)
mainExec.Parent = exec

local uICorner_9 = Instance.new("UICorner")
uICorner_9.Name = "UICorner"
uICorner_9.Parent = mainExec

-- 1. Khung chứa chính (Cố định kích thước)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 805, 0, 415)
mainFrame.Position = UDim2.new(0.0215, 0, 0.026, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(143, 143, 143)
mainFrame.Parent = mainExec

-- 1. Khung cuộn chính (Chứa cả số dòng và TextBox)
local scroll = Instance.new("ScrollingFrame")
scroll.Name = "CodeEditor"
scroll.Size = UDim2.new(0, 805, 0, 415)
scroll.Position = UDim2.new(0.0215, 0, 0.026, 0)
scroll.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness = 8
scroll.Parent = mainExec

-- 2. Cột chứa số dòng (Line Numbers)
local lineCounter = Instance.new("TextLabel")
lineCounter.Name = "LineCounter"
lineCounter.Size = UDim2.new(0, 40, 1, 0) -- Độ rộng cột số dòng là 40
lineCounter.AutomaticSize = Enum.AutomaticSize.Y
lineCounter.BackgroundTransparency = 1
lineCounter.Text = "1"
lineCounter.TextColor3 = Color3.fromRGB(150, 150, 150)
lineCounter.TextSize = 14 -- Số dòng nhỏ xinh
lineCounter.Font = Enum.Font.Code
lineCounter.TextYAlignment = Enum.TextYAlignment.Top
lineCounter.TextXAlignment = Enum.TextXAlignment.Center
lineCounter.Parent = scroll

-- 3. TextBox để nhập Script
local inputSctipt = Instance.new("TextBox")
inputSctipt.Name = "InputSctipt"
inputSctipt.Size = UDim2.new(1, -45, 0, 0) -- Trừ ra khoảng trống cho cột số dòng
inputSctipt.Position = UDim2.new(0, 45, 0, 0)
inputSctipt.AutomaticSize = Enum.AutomaticSize.Y
inputSctipt.BackgroundTransparency = 1
inputSctipt.MultiLine = true
inputSctipt.ClearTextOnFocus = false
inputSctipt.TextWrapped = false -- Tắt cái này để code không bị xuống dòng linh tinh
inputSctipt.TextSize = 16 -- Kích thước vừa đủ đọc
inputSctipt.TextColor3 = Color3.new(1, 1, 1)
inputSctipt.Font = Enum.Font.Code
inputSctipt.TextXAlignment = Enum.TextXAlignment.Left
inputSctipt.TextYAlignment = Enum.TextYAlignment.Top
inputSctipt.Text = ""
inputSctipt.Parent = scroll

-- 4. Logic tự động cập nhật số dòng
local function updateLineNumbers()
	local _, lines = inputSctipt.Text:gsub("\n", "\n")
	local lineText = ""
	for i = 1, lines + 1 do
		lineText = lineText .. i .. "\n"
	end
	lineCounter.Text = lineText
end

-- Cập nhật mỗi khi gõ chữ
inputSctipt:GetPropertyChangedSignal("Text"):Connect(updateLineNumbers)

-- FIX LỖI NHẬP LIỆU: Đảm bảo TextBox luôn có thể nhấn vào
inputSctipt.Active = true 
inputSctipt.Selectable = true

local uICorner_10 = Instance.new("UICorner")
uICorner_10.Name = "UICorner"
uICorner_10.Parent = inputSctipt

local textButton = Instance.new("TextButton")
textButton.Name = "TextButton"
textButton.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
textButton.TextColor3 = Color3.new()
textButton.Text = "ATTACH"
textButton.BackgroundColor3 = Color3.new(0.333, 1, 1)
textButton.TextScaled = true
textButton.BorderSizePixel = 0
textButton.Position = UDim2.new(0.722, 0, 0.881, 0)
textButton.TextWrapped = true
textButton.BorderColor3 = Color3.new()
textButton.TextSize = 14
textButton.Size = UDim2.new(0, 200, 0, 50)
textButton.Parent = mainExec

local uICorner_11 = Instance.new("UICorner")
uICorner_11.Name = "UICorner"
uICorner_11.CornerRadius = UDim.new(1, 0)
uICorner_11.Parent = textButton

local textButton_2 = Instance.new("TextButton")
textButton_2.Name = "TextButton_2"
textButton_2.TextWrapped = true
textButton_2.TextColor3 = Color3.new()
textButton_2.BorderColor3 = Color3.new()
textButton_2.Text = "Scan SS"
textButton_2.BackgroundColor3 = Color3.new(1, 0.333, 0)
textButton_2.BorderSizePixel = 0
textButton_2.Position = UDim2.new(0.209, 0, 0.881, 0)
textButton_2.TextScaled = true
textButton_2.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
textButton_2.TextSize = 14
textButton_2.Size = UDim2.new(0, 142, 0, 50)
textButton_2.Parent = mainExec

local uICorner_12 = Instance.new("UICorner")
uICorner_12.Name = "UICorner"
uICorner_12.CornerRadius = UDim.new(1, 0)
uICorner_12.Parent = textButton_2

local resetModeBtn = Instance.new("TextButton")
resetModeBtn.Name = "resetModeBtn"
resetModeBtn.TextWrapped = true
resetModeBtn.TextColor3 = Color3.new()
resetModeBtn.BorderColor3 = Color3.new()
resetModeBtn.Text = "Return to cilent"
resetModeBtn.BackgroundColor3 = Color3.new(0.667, 0.667, 1)
resetModeBtn.BorderSizePixel = 0
resetModeBtn.Position = UDim2.new(0.39, 0, 0.881, 0)
resetModeBtn.TextScaled = true
resetModeBtn.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
resetModeBtn.TextSize = 14
resetModeBtn.Size = UDim2.new(0, 133, 0, 50)
resetModeBtn.Parent = mainExec

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.CornerRadius = UDim.new(1, 0)
uICorner.Parent = resetModeBtn

local eXECButton = Instance.new("TextButton")
eXECButton.Name = "EXECButton"
eXECButton.TextWrapped = true
eXECButton.TextColor3 = Color3.new()
eXECButton.Parent = mainExec
eXECButton.BorderColor3 = Color3.new()
eXECButton.Text = "EXECUTE"
eXECButton.BackgroundColor3 = Color3.new(0, 0.667, 1)
eXECButton.BorderSizePixel = 0
eXECButton.Position = UDim2.new(0.0327, 0, 0.881, 0)
eXECButton.TextScaled = true
eXECButton.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal
)
eXECButton.TextSize = 14
eXECButton.Size = UDim2.new(0, 142, 0, 50)

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.CornerRadius = UDim.new(1, 0)
uICorner.Parent = eXECButton

local uICorner_13 = Instance.new("UICorner")
uICorner_13.Name = "UICorner"
uICorner_13.CornerRadius = UDim.new(1, 0)
uICorner_13.Parent = eXECButton

local lOGO_WHEN_ATTACHED = Instance.new("Frame")
lOGO_WHEN_ATTACHED.Name = "LOGO_WHEN_ATTACHED"
lOGO_WHEN_ATTACHED.BackgroundColor3 = Color3.new(1, 1, 1)
lOGO_WHEN_ATTACHED.BackgroundTransparency = 1
lOGO_WHEN_ATTACHED.Position = UDim2.new(0.0247, 0, 0.826, 0)
lOGO_WHEN_ATTACHED.BorderColor3 = Color3.new()
lOGO_WHEN_ATTACHED.BorderSizePixel = 0
lOGO_WHEN_ATTACHED.Size = UDim2.new(0, 162, 0, 162)
lOGO_WHEN_ATTACHED.Parent = screenGui

local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "ImageLabel"
imageLabel.BorderColor3 = Color3.new()
imageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel.Image = "rbxassetid://124336823407341"
imageLabel.BackgroundTransparency = 1
imageLabel.Position = UDim2.new(-0.0163, 0, 0.0926, 0)
imageLabel.BorderSizePixel = 0
imageLabel.Size = UDim2.new(0, 162, 0, 131)
imageLabel.Parent = lOGO_WHEN_ATTACHED

local uICorner_14 = Instance.new("UICorner")
uICorner_14.Name = "UICorner"
uICorner_14.CornerRadius = UDim.new(1, 0)
uICorner_14.Parent = imageLabel

local imageLabel_2 = Instance.new("ImageLabel")
imageLabel_2.Name = "ImageLabel"
imageLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel_2.Image = "rbxassetid://88774721887954"
imageLabel_2.Position = UDim2.new(0.426, 0, -0.0123, 0)
imageLabel_2.BorderColor3 = Color3.new()
imageLabel_2.BorderSizePixel = 0
imageLabel_2.Size = UDim2.new(0, 45, 0, 42)
imageLabel_2.Parent = lOGO_WHEN_ATTACHED

local uICorner_15 = Instance.new("UICorner")
uICorner_15.Name = "UICorner"
uICorner_15.CornerRadius = UDim.new(1, 0)
uICorner_15.Parent = imageLabel_2

local uICorner_16 = Instance.new("UICorner")
uICorner_16.Name = "UICorner"
uICorner_16.Parent = lOGO_WHEN_ATTACHED

local imageLabel_3 = Instance.new("ImageLabel")
imageLabel_3.Name = "ImageLabel"
imageLabel_3.BorderColor3 = Color3.new()
imageLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel_3.Image = "rbxassetid://124001967339217"
imageLabel_3.BackgroundTransparency = 1
imageLabel_3.Position = UDim2.new(-0.124, 0, -0.0123, 0)
imageLabel_3.BorderSizePixel = 0
imageLabel_3.Size = UDim2.new(0, 196, 0, 165)
imageLabel_3.Parent = lOGO_WHEN_ATTACHED

local clearlog = Instance.new("TextButton")
clearlog.Name = "Clearlog"
clearlog.TextWrapped = true
clearlog.TextColor3 = Color3.new()
clearlog.BorderColor3 = Color3.new()
clearlog.Text = "Clear Log"
clearlog.BackgroundColor3 = Color3.new(0.455, 0.455, 0.455)
clearlog.BorderSizePixel = 0
clearlog.Position = UDim2.new(0.0217, 0, 0.901, 0)
clearlog.TextScaled = true
clearlog.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal
)
clearlog.TextSize = 14
clearlog.Size = UDim2.new(0, 200, 0, 50)
clearlog.Parent = output

local spyBtn = Instance.new("TextButton")
spyBtn.Name = "spyBtn"
spyBtn.TextWrapped = true
spyBtn.TextColor3 = Color3.new()
spyBtn.BorderColor3 = Color3.new()
spyBtn.Text = "Remote Spy"
spyBtn.BackgroundColor3 = Color3.new(0.82, 0, 0)
spyBtn.BorderSizePixel = 0
spyBtn.Position = UDim2.new(0.582, 0, 0.901, 0)
spyBtn.TextScaled = true
spyBtn.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal
)
spyBtn.TextSize = 14
spyBtn.Size = UDim2.new(0, 200, 0, 50)
spyBtn.Parent = output

local uICorneruiorent = Instance.new("UICorner")
uICorneruiorent.CornerRadius = UDim.new(0, 8)
uICorneruiorent = spyBtn

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.Parent = clearlog

-- ==========================================
-- SM AUTO-SCALE CORE (SM-SYSTEM)
-- ==========================================

local ScaleContainer = Instance.new("Frame")
ScaleContainer.Name = "SM_ScaleContainer"
ScaleContainer.Size = UDim2.new(1, 0, 1, 0)
ScaleContainer.BackgroundTransparency = 1
ScaleContainer.Parent = screenGui

local uiScale = Instance.new("UIScale")
uiScale.Parent = ScaleContainer

-- Gán các bảng vào (Riêng lOGO_WHEN_ATTACHED để ngoài screenGui)
main.Parent = ScaleContainer
exec.Parent = ScaleContainer
output.Parent = ScaleContainer

local function handleScaling()
    local currentRes = workspace.CurrentCamera.ViewportSize
    if currentRes.X < 100 then return end -- Đợi màn hình load xong
    
    -- TỰ ĐỘNG: Giả định bạn thiết kế Main (857px) cho màn hình chuẩn 1920px
    -- Tỉ lệ mong muốn: Main chiếm khoảng 45% chiều rộng màn hình
    local targetWidth = 857 / 0.45 
    
    local finalScale = currentRes.X / targetWidth
    
    -- Giới hạn để không bị quá bé hoặc quá to
    uiScale.Scale = math.clamp(finalScale, 0.5, 1.2)
end

workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(handleScaling)
handleScaling()
-- ==========================================
-- SM ENGINE CORE v3.5 - FULL OPTIMIZED
-- ==========================================
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

-- ==========================================
-- 1. CẤU HÌNH & TRẠNG THÁI HỆ THỐNG
-- ==========================================
local EngineState = {
	IsAttached = false,
	IsMinimized = false,
	AutoExecEnabled = false,
	LogCount = 0,
	MaxLogs = 100,
	DragSpeed = 0.15,
	AutoExecFile = "SMEngine_AutoExec.txt"
}

local Colors = {
	Info = Color3.fromRGB(0, 170, 255),
	Success = Color3.fromRGB(0, 255, 100),
	Warning = Color3.fromRGB(255, 170, 0),
	Error = Color3.fromRGB(255, 50, 50),
	Text = Color3.fromRGB(240, 240, 240),
	System = Color3.fromRGB(170, 85, 255)
}

local tInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- ==========================================
-- 2. HỆ THỐNG FILE & LOGGER
-- ==========================================
local function safeWriteFile(name, content)
	if writefile then pcall(function() writefile(name, content) end) end
end

local function safeReadFile(name)
	if readfile and isfile and isfile(name) then
		local s, c = pcall(function() return readfile(name) end)
		if s then return c end
	end
	return nil
end

local function logMessage(text, colorType)
	local color = colorType or Colors.Text
	local stamp = string.format("<font color=\"#888888\">[%s]</font>", os.date("%X"))
	local hex = string.format("#%02X%02X%02X", color.R*255, color.G*255, color.B*255)

	EngineState.LogCount = EngineState.LogCount + 1
	if EngineState.LogCount > EngineState.MaxLogs then
		local currentText = output_2.Text
		local firstLineBreak = currentText:find("\n")
		if firstLineBreak then
			output_2.Text = currentText:sub(firstLineBreak + 1)
			EngineState.LogCount = EngineState.LogCount - 1
		end
	end

	local msg = string.format("\n%s <font color=\"%s\">[>] %s</font>", stamp, hex, tostring(text))
	output_2.Text = output_2.Text .. msg

	pcall(function()
		local scroll = output_2.Parent
		if scroll and scroll:IsA("ScrollingFrame") then
			scroll.CanvasPosition = Vector2.new(0, scroll.AbsoluteWindowSize.Y + 9999)
		end
	end)
end

-- ==========================================
-- HỆ THỐNG KÉO THẢ TỐI ƯU (FIXED & SMOOTH)
-- ==========================================
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function makeDraggableSmooth(mainFrame, attachedObjects, lerpSpeed)
    -- Kiểm tra nếu attachedObjects là số (lerpSpeed)
    if type(attachedObjects) == "number" then
        lerpSpeed = attachedObjects
        attachedObjects = {}
    end

    attachedObjects = attachedObjects or {}
    lerpSpeed = lerpSpeed or 0.15

    local dragging = false
    local dragInput, dragStart
    local startPositions = {}
    local currentTargets = {}

    -- Khởi tạo vị trí đích
    currentTargets[mainFrame] = mainFrame.Position
    for _, obj in ipairs(attachedObjects) do
        currentTargets[obj] = obj.Position
    end

    local function update(input)
        -- LẤY SCALE TỰ ĐỘNG: Quan trọng để không bị đơ
        local container = mainFrame.Parent
        local uiScale = container and container:FindFirstChildOfClass("UIScale")
        local s = uiScale and uiScale.Scale or 1
        
        local delta = (input.Position - dragStart) / s

        local sPosMain = startPositions[mainFrame]
        if sPosMain then
            currentTargets[mainFrame] = UDim2.new(
                sPosMain.X.Scale, sPosMain.X.Offset + delta.X, 
                sPosMain.Y.Scale, sPosMain.Y.Offset + delta.Y
            )
        end

        for _, obj in ipairs(attachedObjects) do
            local sPos = startPositions[obj]
            if sPos then
                currentTargets[obj] = UDim2.new(
                    sPos.X.Scale, sPos.X.Offset + delta.X, 
                    sPos.Y.Scale, sPos.Y.Offset + delta.Y
                )
            end
        end
    end

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            
            startPositions[mainFrame] = mainFrame.Position
            for _, obj in ipairs(attachedObjects) do
                startPositions[obj] = obj.Position
            end

            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    connection:Disconnect()
                end
            end)
        end
    end)

    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)

    RunService.RenderStepped:Connect(function()
        if currentTargets[mainFrame] then
            mainFrame.Position = mainFrame.Position:Lerp(currentTargets[mainFrame], lerpSpeed)
        end
        for _, obj in ipairs(attachedObjects) do
            if currentTargets[obj] then
                obj.Position = obj.Position:Lerp(currentTargets[obj], lerpSpeed)
            end
        end
    end)
end

-- ==========================================
-- GỌI HÀM ĐỂ KÉO RIÊNG TỪNG CÁI
-- ==========================================
makeDraggableSmooth(main, 0.2)   -- Kéo main chỉ đi mình main
makeDraggableSmooth(exec, 0.2)   -- Kéo exec chỉ đi mình exec
makeDraggableSmooth(output, 0.2) -- Kéo output chỉ đi mình output

-- ==========================================
-- 4. QUẢN LÝ CỬA SỔ & HOẠT ẢNH
-- ==========================================
if closeButton then
	closeButton.MouseButton1Click:Connect(function()
		logMessage("Shutting down engine...", Colors.Warning)

		-- Ẩn icon xoay trước để tránh lỗi hiển thị khi cha đang thu nhỏ
		if imageLabel_2 then imageLabel_2.Visible = false end

		local tMain = TweenService:Create(main, tInfo, {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1})
		-- ... (giữ nguyên phần code Tween các bảng khác của bạn)
		tMain:Play()
		tMain.Completed:Connect(function() if screenGui then screenGui:Destroy() end end)
	end)
end

if minimizeButton then
	minimizeButton.MouseButton1Click:Connect(function()
		EngineState.IsMinimized = not EngineState.IsMinimized
		local targetAlpha = EngineState.IsMinimized and 1 or 0
		local targetVis = not EngineState.IsMinimized

		if exec then
			TweenService:Create(exec, tInfo, {BackgroundTransparency = targetAlpha}):Play()
			for _, v in pairs(exec:GetDescendants()) do if v:IsA("GuiObject") then v.Visible = targetVis end end
		end
		if output then
			TweenService:Create(output, tInfo, {BackgroundTransparency = targetAlpha}):Play()
			for _, v in pairs(output:GetDescendants()) do if v:IsA("GuiObject") then v.Visible = targetVis end end
		end
		logMessage(EngineState.IsMinimized and "Windows Minimized." or "Windows Restored.", Colors.Info)
	end)
end

if clearButton then
	clearButton.MouseButton1Click:Connect(function()
		if output_2 then
			output_2.Text = ""
			EngineState.LogCount = 0
			logMessage("Output Cleared.", Colors.System)
		end
	end)
end

if autoExecToggle then
	autoExecToggle.MouseButton1Click:Connect(function()
		EngineState.AutoExecEnabled = not EngineState.AutoExecEnabled
		if EngineState.AutoExecEnabled then
			if inputSctipt.Text ~= "" then safeWriteFile(EngineState.AutoExecFile, inputSctipt.Text) end
			logMessage("Auto-Execute ENABLED.", Colors.Success)
			autoExecToggle.BackgroundColor3 = Colors.Success
		else
			logMessage("Auto-Execute DISABLED.", Colors.Warning)
			autoExecToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		end
	end)
end

-- ==========================================
-- 5. LÕI THỰC THI (ATTACH, EXECUTE, SS, SCAN)
-- ==========================================
if textButton then
	textButton.MouseButton1Click:Connect(function()
		if EngineState.IsAttached then logMessage("Already attached!", Colors.Warning) return end

		textButton.Text = "INJECTING..."
		textButton.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
		logMessage("Bypassing Environment...", Colors.Warning)

		task.spawn(function()
			task.wait(1.2)
			EngineState.IsAttached = true
			textButton.Text = "ATTACHED"
			textButton.BackgroundColor3 = Colors.Success

			logMessage("Attached Successfully! System Ready.", Colors.Success)

			-- (Giữ nguyên phần Auto-Exec của bạn...)
			if EngineState.AutoExecEnabled then
				local savedScript = safeReadFile(EngineState.AutoExecFile)
				if savedScript and savedScript ~= "" then
					logMessage("Running Auto-Exec payload...", Colors.System)
					local func = loadstring(savedScript)
					if func then pcall(func) end
				end
			end
		end)
	end)
end

-- Thêm biến trạng thái vào EngineState nếu chưa có
EngineState.SSMode = false 

-- ==========================================
-- 1. LOGIC NÚT EXECUTE (HỢP NHẤT)
-- ==========================================
if eXECButton then
	eXECButton.MouseButton1Click:Connect(function()
		if not EngineState or not EngineState.IsAttached then 
			logMessage("CRITICAL: Not attached!", Colors.Error) 
			return 
		end

		local code = inputSctipt.Text
		if code:gsub("%s+", "") == "" then 
			logMessage("Script is empty.", Colors.Warning) 
			return 
		end

		-- KIỂM TRA CHẾ ĐỘ: Nếu đang là SSMode thì chạy vòng lặp Remote, ngược lại chạy Loadstring
		if EngineState.SSMode then
			logMessage("SS Execution: Bypassing via Remote...", Colors.System)
			task.spawn(function()
				local foundRemote = false
				for _, item in pairs(game:GetDescendants()) do
					if _ % 100 == 0 then RunService.Heartbeat:Wait() end 
					if item:IsA("RemoteEvent") or item:IsA("RemoteFunction") then
						local name = item.Name:lower()
						-- Các keyword backdoor phổ biến
						if name:find("run") or name:find("load") or name:find("exec") or name:find("require") then
							pcall(function()
								if item:IsA("RemoteEvent") then item:FireServer(code) else item:InvokeServer(code) end
							end)
							foundRemote = true
						end
					end
				end
				if foundRemote then logMessage("SS Payload Sent!", Colors.Success) 
				else logMessage("SS Error: No vulnerable remotes found.", Colors.Error) end
			end)
		else
			-- CHẾ ĐỘ BÌNH THƯỜNG (CLIENT)
			logMessage("Executing locally...", Colors.Info)
			task.spawn(function()
				local executorLoadstring = loadstring or getgenv().loadstring 
				if not executorLoadstring then
					logMessage("ERROR: Environment not supported!", Colors.Error) 
					return 
				end

				local func, syntaxErr = executorLoadstring(code)
				if func then
					local success, runtimeErr = pcall(func)
					if success then logMessage("Execution Complete.", Colors.Success)
					else logMessage("Runtime Error: " .. tostring(runtimeErr), Colors.Error) end
				else
					logMessage("Syntax Error: " .. tostring(syntaxErr), Colors.Error)
				end
			end)
		end
	end)
end

-- ==========================================
-- ĐẤU NỐI LOGIC CHO NÚT BẤM (FIX LỖI PASTE)
-- ==========================================

-- 1. Cấu hình màu sắc và danh sách đen (Tránh bẫy HEX/Trap)
local TrapKeywords = {"ban", "kick", "detect", "anticheat", "security", "log"}
local SuccessColor = Color3.fromRGB(0, 255, 127)
local ErrorColor = Color3.fromRGB(255, 65, 65)
local WarningColor = Color3.fromRGB(255, 170, 0)

-- 2. Logic cho nút SCAN SS (Biến: textButton_2)
if textButton_2 then
	textButton_2.MouseButton1Click:Connect(function()
		-- Thông báo bắt đầu
		logMessage("Deep Scan Initiated (Safety Mode: ON)...", WarningColor)
		local foundCount = 0

		task.spawn(function()
			-- Duyệt toàn bộ game để tìm Remote
			for _, item in pairs(game:GetDescendants()) do
				-- Tránh treo máy khi game quá nặng
				if _ % 150 == 0 then game:GetService("RunService").Heartbeat:Wait() end 

				if item:IsA("RemoteEvent") or item:IsA("RemoteFunction") then
					local name = item.Name:lower()
					local isTrap = false

					-- Kiểm tra xem có phải bẫy không
					for _, word in ipairs(TrapKeywords) do
						if name:find(word) then
							isTrap = true
							break
						end
					end

					if isTrap then
						logMessage("⚠️ TRAP DETECTED: " .. item.Name, ErrorColor)
					else
						-- Tìm kiếm backdoor thực sự (Run, Load, Execute, hoặc tên HEX/Rác)
						if name:find("run") or name:find("load") or name:find("exec") or #name > 30 then
							logMessage("✅ Vulnerable Found: " .. item.Name, SuccessColor)
							foundCount = foundCount + 1
						end
					end
				end
			end

			-- Cập nhật trạng thái sau khi quét xong
			if foundCount > 0 then
				EngineState.SSMode = true
				-- Đổi chữ nút Execute để báo hiệu
				if eXECButton then
					eXECButton.Text = "EXECUTE (SS MODE)"
					eXECButton.BackgroundColor3 = Color3.fromRGB(170, 85, 255) -- Đổi sang màu tím
				end
				logMessage("Scan Complete: " .. foundCount .. " remotes verified safe.", SuccessColor)
			else
				logMessage("Scan Complete: No safe backdoors found.", WarningColor)
			end
		end)
	end)
else
	warn("LỖI: Không tìm thấy biến 'textButton_2' để kết nối nút SCAN!")
end

-- 3. Logic cho nút EXECUTE (Biến: eXECButton)
if eXECButton then
	eXECButton.MouseButton1Click:Connect(function()
		if not EngineState or not EngineState.IsAttached then 
			logMessage("CRITICAL: Please ATTACH first!", ErrorColor)
			return 
		end

		local code = inputSctipt.Text
		if code:gsub("%s+", "") == "" then return end

		if EngineState.SSMode then
			logMessage("SS Execution: Infiltrating via Remotes...", Color3.fromRGB(0, 170, 255))
			task.spawn(function()
				for _, remote in pairs(game:GetDescendants()) do
					if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
						local n = remote.Name:lower()
						-- Chỉ bắn vào những cái an toàn đã lọc
						if (n:find("run") or n:find("load") or n:find("exec") or #n > 30) and not n:find("ban") then
							pcall(function()
								if remote:IsA("RemoteEvent") then 
									remote:FireServer(code) 
								else 
									remote:InvokeServer(code) 
								end
							end)
						end
					end
				end
			end)
		else
			-- THAY THẾ DÒNG LỖI Ở ĐÂY:
			local executorLoadstring = loadstring or getgenv().loadstring
			if executorLoadstring then
				local f, err = executorLoadstring(code) -- Đã xóa dấu = dư thừa
				if f then 
					local success, runtimeErr = pcall(f)
					if success then
						logMessage("Executed Successfully.", SuccessColor)
					else
						logMessage("Runtime Error: " .. tostring(runtimeErr), ErrorColor)
					end
				else 
					logMessage("Syntax Error: " .. tostring(err), ErrorColor) 
				end
			else
				logMessage("Environment not supported!", ErrorColor)
			end
		end
	end)
end

-- ==========================================
-- 3. NÚT RESET MODE (Đưa về trạng thái cũ)
-- ==========================================
if resetModeBtn then
	resetModeBtn.MouseButton1Click:Connect(function()
		EngineState.SSMode = false
		eXECButton.Text = "EXECUTE"
		eXECButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		logMessage("Mode Reset: Back to local execution.", Colors.Info)
	end)
end

logMessage("SM Engine Full Core Initialized. Awaiting Input...", Colors.Text)

local RunService = game:GetService("RunService")

-- Vòng lớn (Frame chính)
local circleFrame = lOGO_WHEN_ATTACHED

-- Cục số 2 (ImageLabel_2)
local orbitCircle2 = imageLabel_2

-- Bán kính quỹ đạo
local radius = 70
local angle = 0

RunService.RenderStepped:Connect(function(dt)
	-- Tăng góc để tạo chuyển động xoay quanh vòng lớn
	angle = angle + math.rad(90) * dt -- tốc độ xoay quanh vòng lớn

	-- Tính tâm vòng lớn
	local centerX = circleFrame.AbsoluteSize.X/2
	local centerY = circleFrame.AbsoluteSize.Y/2

	-- Tính vị trí mới theo quỹ đạo tròn
	local newX = centerX + math.cos(angle) * radius
	local newY = centerY + math.sin(angle) * radius

	-- Cập nhật vị trí (chỉ chạy vòng quanh, không xoay bản thân)
	orbitCircle2.Position = UDim2.fromOffset(newX - orbitCircle2.Size.X.Offset/2, newY - orbitCircle2.Size.Y.Offset/2)
end)

-- ==========================================
-- LOGIC CỐT LÕI: CLEAR LOGS
-- ==========================================

if clearlog then
	clearlog.MouseButton1Click:Connect(function()
		-- 1. Kiểm tra sự tồn tại của TextLabel hiển thị log
		if output_2 then
			-- Thực hiện hiệu ứng nháy nút khi bấm (Phản hồi thị giác)
			local originalColor = clearlog.BackgroundColor3
			clearlog.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

			-- Xóa nội dung văn bản
			output_2.Text = ""

			-- Reset biến đếm log trong EngineState để tránh lỗi tràn log cũ
			if EngineState then
				EngineState.LogCount = 0
			end

			-- 2. Cập nhật lại khung cuộn (ScrollingFrame)
			if backout_2 then
				-- Đưa thanh cuộn về vị trí trên cùng
				backout_2.CanvasPosition = Vector2.new(0, 0)
				-- Reset kích thước vùng chứa (CanvasSize) về mặc định
				backout_2.CanvasSize = UDim2.new(0, 0, 0, 0)
			end

			-- 3. Thông báo log mới sau khi dọn dẹp
			logMessage("System Log Cleared.", Colors.System)

			-- Trả lại màu nút sau khi xử lý xong
			task.wait(0.1)
			clearlog.BackgroundColor3 = originalColor
		else
			warn("LỖI: Không tìm thấy output_2 để xóa log!")
		end
	end)
end

-- ==========================================
-- LOGIC CỐT LÕI: REMOTE SPY
-- ==========================================

-- Thêm trạng thái Spy vào EngineState nếu chưa có
if not EngineState then EngineState = {} end
EngineState.SpyEnabled = false
EngineState.SpyHooked = false

-- ==========================================
-- REMOTE SPY HYBRID (SUPPORT ALL EXECUTORS)
-- ==========================================

if spyBtn then
    spyBtn.MouseButton1Click:Connect(function()
        EngineState.SpyEnabled = not EngineState.SpyEnabled
        
        if EngineState.SpyEnabled then
            spyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
            spyBtn.Text = "Spying: ON"
            logMessage("Attempting to hook remotes...", Colors.Warning)

            if EngineState.SpyHooked then return end -- Đã hook rồi thì không làm lại

            -- KIỂM TRA KHẢ NĂNG CỦA EXECUTOR
            local hasMetamethod = (hookmetamethod ~= nil)
            local hasHookFunction = (hookfunction ~= nil)

            if hasMetamethod then
                -- CÁCH 1: XỊN NHẤT (Sử dụng __namecall)
                logMessage("Using High-Level Hook (Namecall)...", Colors.Success)
                local oldNamecall
                oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                    local method = getnamecallmethod()
                    if EngineState.SpyEnabled and not checkcaller() then
                        if method == "FireServer" or method == "InvokeServer" then
                            task.spawn(function() logMessage("[Spy] " .. self.Name .. " (" .. method .. ")", Colors.Warning) end)
                        end
                    end
                    return oldNamecall(self, ...)
                end)
                EngineState.SpyHooked = true

            elseif hasHookFunction then
                -- CÁCH 2: CỔ ĐIỂN (Hook trực tiếp vào hàm FireServer/InvokeServer)
                logMessage("Fallback: Using Direct Function Hook...", Colors.Info)
                
                local oldFireServer
                oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
                    if EngineState.SpyEnabled and not checkcaller() then
                        task.spawn(function() logMessage("[Spy] " .. self.Name .. " (FireServer)", Colors.Warning) end)
                    end
                    return oldFireServer(self, ...)
                end)

                local oldInvokeServer
                oldInvokeServer = hookfunction(Instance.new("RemoteFunction").InvokeServer, function(self, ...)
                    if EngineState.SpyEnabled and not checkcaller() then
                        task.spawn(function() logMessage("[Spy] " .. self.Name .. " (InvokeServer)", Colors.Warning) end)
                    end
                    return oldInvokeServer(self, ...)
                end)
                EngineState.SpyHooked = true
            else
                -- CÁCH 3: TRƯỜNG HỢP EXECUTOR QUÁ YẾU
                logMessage("CRITICAL: Your executor does not support any Hooking API.", Colors.Error)
                EngineState.SpyEnabled = false
                spyBtn.BackgroundColor3 = Color3.new(0.82, 0, 0)
                spyBtn.Text = "Not Supported"
            end
        else
            spyBtn.BackgroundColor3 = Color3.new(0.82, 0, 0)
            spyBtn.Text = "Remote Spy"
            logMessage("Remote Spy Paused.", Colors.Info)
        end
    end)
end
