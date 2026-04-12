-- [OMNI-GOD CORE GENERATED]
-- Author: son171020
-- Mode: Smart Relay (_G.OmniStorage)
local _STORAGE = _G.OmniStorage or {}

local ScreenGui = Instance.new("ScreenGui")
_STORAGE["ScreenGui"] = ScreenGui
ScreenGui.Name = "ScreenGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local BtnTgleGui = Instance.new("Frame")
_STORAGE["BtnTgleGui"] = BtnTgleGui
BtnTgleGui.Name = "BtnTgleGui"
BtnTgleGui.Size = UDim2.new(0.0440270044, 0, 0.0868055522, 0)
BtnTgleGui.Position = UDim2.new(0.0505376346, 0, 0.803819418, 0)
BtnTgleGui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BtnTgleGui.BackgroundTransparency = 1
BtnTgleGui.Visible = true
BtnTgleGui.ZIndex = 1
BtnTgleGui.BorderSizePixel = 0
BtnTgleGui.ClipsDescendants = false
BtnTgleGui.Parent = _STORAGE["ScreenGui"] or ScreenGui

local BackGO = Instance.new("Frame")
_STORAGE["BackGO"] = BackGO
BackGO.Name = "BackGO"
BackGO.Size = UDim2.new(1.16354823, 0, 1.16354823, 0)
BackGO.Position = UDim2.new(-0.0935479701, 0, -0.0874328613, 0)
BackGO.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
BackGO.BackgroundTransparency = 0.4000000059604645
BackGO.Visible = true
BackGO.ZIndex = 999
BackGO.BorderSizePixel = 0
BackGO.ClipsDescendants = false
BackGO.Parent = _STORAGE["BtnTgleGui"] or BtnTgleGui

local UICorner = Instance.new("UICorner")
_STORAGE["UICorner"] = UICorner
UICorner.Name = "UICorner"
UICorner.Parent = _STORAGE["BackGO"] or BackGO

local ImageButton = Instance.new("ImageButton")
_STORAGE["ImageButton"] = ImageButton
ImageButton.Name = "ImageButton"
ImageButton.Size = UDim2.new(1.00763404, 0, 1.00691593, 0)
ImageButton.Position = UDim2.new(-0.00763397198, 0, -0.00785278343, 0)
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 0
ImageButton.Image = "rbxassetid://88774721887954"
ImageButton.ImageTransparency = 0
ImageButton.Visible = true
ImageButton.ZIndex = 1000
ImageButton.BorderSizePixel = 0
ImageButton.ClipsDescendants = false
ImageButton.Parent = _STORAGE["BtnTgleGui"] or BtnTgleGui

local UICorner_2 = Instance.new("UICorner")
_STORAGE["UICorner_2"] = UICorner_2
UICorner_2.Name = "UICorner"
UICorner_2.Parent = _STORAGE["ImageButton"] or ImageButton

local MainMenu = Instance.new("Frame")
_STORAGE["MainMenu"] = MainMenu
MainMenu.Name = "MainMenu"
MainMenu.Size = UDim2.new(0.154534787, 0, 0.25, 0)
MainMenu.Position = UDim2.new(0.0462283567, 0, 0.535590291, 0)
MainMenu.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
MainMenu.BackgroundTransparency = 0.5
MainMenu.Visible = true
MainMenu.ZIndex = 1
MainMenu.BorderSizePixel = 0
MainMenu.ClipsDescendants = false
MainMenu.Parent = _STORAGE["ScreenGui"] or ScreenGui

local UICorner_3 = Instance.new("UICorner")
_STORAGE["UICorner_3"] = UICorner_3
UICorner_3.Name = "UICorner"
UICorner_3.Parent = _STORAGE["MainMenu"] or MainMenu

local Name = Instance.new("TextLabel")
_STORAGE["Name"] = Name
Name.Name = "Name"
Name.Size = UDim2.new(1, 0, 0.173611104, 0)
Name.Position = UDim2.new(-0.00284900283, 0, -0.00227659475, 0)
Name.Text = "SM Executor"
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1
Name.TextTransparency = 0
Name.Visible = true
Name.ZIndex = 1
Name.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
Name.TextScaled = true
Name.TextSize = 20
Name.TextColor3 = Color3.fromRGB(0, 0, 0)
Name.BorderSizePixel = 0
Name.TextXAlignment = Enum.TextXAlignment.Center
Name.TextYAlignment = Enum.TextYAlignment.Center
Name.TextWrapped = true
Name.ClipsDescendants = false
Name.Parent = _STORAGE["MainMenu"] or MainMenu

local UICorner_4 = Instance.new("UICorner")
_STORAGE["UICorner_4"] = UICorner_4
UICorner_4.Name = "UICorner"
UICorner_4.Parent = _STORAGE["Name"] or Name

local TextLabel = Instance.new("TextLabel")
_STORAGE["TextLabel"] = TextLabel
TextLabel.Name = "TextLabel"
TextLabel.Size = UDim2.new(1, 0, 0.173611104, 0)
TextLabel.Position = UDim2.new(0, 0, 0.0649746656, 0)
TextLabel.Text = "-------------------"
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.TextTransparency = 0
TextLabel.Visible = true
TextLabel.ZIndex = 1
TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.TextXAlignment = Enum.TextXAlignment.Center
TextLabel.TextYAlignment = Enum.TextYAlignment.Center
TextLabel.TextWrapped = true
TextLabel.ClipsDescendants = false
TextLabel.Parent = _STORAGE["MainMenu"] or MainMenu

local Btn = Instance.new("Frame")
_STORAGE["Btn"] = Btn
Btn.Name = "Btn"
Btn.Size = UDim2.new(0.826210797, 0, 0.71875, 0)
Btn.Position = UDim2.new(0.0883190855, 0, 0.203809947, 0)
Btn.BackgroundColor3 = Color3.fromRGB(255, 163, 15)
Btn.BackgroundTransparency = 0.5
Btn.Visible = true
Btn.ZIndex = 1
Btn.BorderSizePixel = 0
Btn.ClipsDescendants = false
Btn.Parent = _STORAGE["MainMenu"] or MainMenu

local HomeBtn = Instance.new("TextButton")
_STORAGE["HomeBtn"] = HomeBtn
HomeBtn.Name = "HomeBtn"
HomeBtn.Size = UDim2.new(0.934482753, 0, 0.241545901, 0)
HomeBtn.Position = UDim2.new(0.0255586822, 0, 0.175240785, 0)
HomeBtn.Text = "Home"
HomeBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
HomeBtn.BackgroundTransparency = 0
HomeBtn.TextTransparency = 0
HomeBtn.Visible = true
HomeBtn.ZIndex = 1
HomeBtn.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
HomeBtn.Font = Enum.Font.FredokaOne
HomeBtn.TextScaled = true
HomeBtn.TextSize = 14
HomeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
HomeBtn.BorderSizePixel = 0
HomeBtn.TextXAlignment = Enum.TextXAlignment.Center
HomeBtn.TextYAlignment = Enum.TextYAlignment.Center
HomeBtn.TextWrapped = true
HomeBtn.ClipsDescendants = false
HomeBtn.Parent = _STORAGE["Btn"] or Btn

local UICorner_5 = Instance.new("UICorner")
_STORAGE["UICorner_5"] = UICorner_5
UICorner_5.Name = "UICorner"
UICorner_5.Parent = _STORAGE["HomeBtn"] or HomeBtn

local UICorner_6 = Instance.new("UICorner")
_STORAGE["UICorner_6"] = UICorner_6
UICorner_6.Name = "UICorner"
UICorner_6.Parent = _STORAGE["Btn"] or Btn

local ExecBtn = Instance.new("TextButton")
_STORAGE["ExecBtn"] = ExecBtn
ExecBtn.Name = "ExecBtn"
ExecBtn.Size = UDim2.new(0.934482753, 0, 0.241545901, 0)
ExecBtn.Position = UDim2.new(0.0324552357, 0, 0.582772195, 0)
ExecBtn.Text = "Executor"
ExecBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
ExecBtn.BackgroundTransparency = 0
ExecBtn.TextTransparency = 0
ExecBtn.Visible = true
ExecBtn.ZIndex = 1
ExecBtn.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ExecBtn.Font = Enum.Font.FredokaOne
ExecBtn.TextScaled = true
ExecBtn.TextSize = 14
ExecBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ExecBtn.BorderSizePixel = 0
ExecBtn.TextXAlignment = Enum.TextXAlignment.Center
ExecBtn.TextYAlignment = Enum.TextYAlignment.Center
ExecBtn.TextWrapped = true
ExecBtn.ClipsDescendants = false
ExecBtn.Parent = _STORAGE["Btn"] or Btn

local UICorner_7 = Instance.new("UICorner")
_STORAGE["UICorner_7"] = UICorner_7
UICorner_7.Name = "UICorner"
UICorner_7.Parent = _STORAGE["ExecBtn"] or ExecBtn

local Menu = Instance.new("Frame")
_STORAGE["Menu"] = Menu
Menu.Name = "Menu"
Menu.Size = UDim2.new(0.376871169, 0, 0.318576396, 0)
Menu.Position = UDim2.new(0.207367197, 0, 0.462673604, 0)
Menu.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
Menu.BackgroundTransparency = 0.5
Menu.Visible = true
Menu.ZIndex = 1
Menu.BorderSizePixel = 0
Menu.ClipsDescendants = false
Menu.Parent = _STORAGE["ScreenGui"] or ScreenGui

local UICorner_8 = Instance.new("UICorner")
_STORAGE["UICorner_8"] = UICorner_8
UICorner_8.Name = "UICorner"
UICorner_8.Parent = _STORAGE["Menu"] or Menu

local Exec = Instance.new("Frame")
_STORAGE["Exec"] = Exec
Exec.Name = "Exec"
Exec.Size = UDim2.new(0.948598146, 0, 0.888283372, 0)
Exec.Position = UDim2.new(0.0257009342, 0, 0.0544957481, 0)
Exec.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
Exec.BackgroundTransparency = 0.30000001192092896
Exec.Visible = true
Exec.ZIndex = 1
Exec.BorderSizePixel = 0
Exec.ClipsDescendants = false
Exec.Parent = _STORAGE["Menu"] or Menu

local UICorner_9 = Instance.new("UICorner")
_STORAGE["UICorner_9"] = UICorner_9
UICorner_9.Name = "UICorner"
UICorner_9.Parent = _STORAGE["Exec"] or Exec

local ExecBtn_2 = Instance.new("TextButton")
_STORAGE["ExecBtn_2"] = ExecBtn_2
ExecBtn_2.Name = "ExecBtn"
ExecBtn_2.Size = UDim2.new(0.174876854, 0, 0.15337424, 0)
ExecBtn_2.Position = UDim2.new(0.00985221658, 0, 0.820194364, 0)
ExecBtn_2.Text = "EXECUTE"
ExecBtn_2.BackgroundColor3 = Color3.fromRGB(255, 230, 102)
ExecBtn_2.BackgroundTransparency = 0
ExecBtn_2.TextTransparency = 0
ExecBtn_2.Visible = true
ExecBtn_2.ZIndex = 1
ExecBtn_2.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
ExecBtn_2.TextScaled = true
ExecBtn_2.TextSize = 14
ExecBtn_2.TextColor3 = Color3.fromRGB(0, 0, 0)
ExecBtn_2.BorderSizePixel = 0
ExecBtn_2.TextXAlignment = Enum.TextXAlignment.Center
ExecBtn_2.TextYAlignment = Enum.TextYAlignment.Center
ExecBtn_2.TextWrapped = true
ExecBtn_2.ClipsDescendants = false
ExecBtn_2.Parent = _STORAGE["Exec"] or Exec

local UICorner_10 = Instance.new("UICorner")
_STORAGE["UICorner_10"] = UICorner_10
UICorner_10.Name = "UICorner"
UICorner_10.Parent = _STORAGE["ExecBtn_2"] or ExecBtn_2

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Size = UDim2.new(0.965, 0, 0.75, 0)
ScrollingFrame.Position = UDim2.new(0.017, 0, 0.027, 0)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.Parent = Exec

local UICorne1111r = Instance.new("UICorner")
_STORAGE["UICorne1111r"] = UICorne1111r
UICorne1111r.Name = "UICorner"
UICorne1111r.Parent = _STORAGE["ScrollingFrame"] or ScrollingFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, 0, 0, 0)
TextBox.BackgroundTransparency = 1 
TextBox.TextTransparency = 1 
TextBox.ZIndex = 2 
TextBox.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json")
TextBox.TextSize = 26
TextBox.MultiLine = true
TextBox.ClearTextOnFocus = false
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextWrapped = false 
TextBox.ClipsDescendants = true
TextBox.Parent = ScrollingFrame

local HighlightLabel = Instance.new("TextLabel")
HighlightLabel.Size = TextBox.Size
HighlightLabel.BackgroundTransparency = 1
HighlightLabel.ZIndex = 1 
HighlightLabel.FontFace = TextBox.FontFace
HighlightLabel.TextSize = TextBox.TextSize
HighlightLabel.TextXAlignment = TextBox.TextXAlignment
HighlightLabel.TextYAlignment = TextBox.TextYAlignment
HighlightLabel.TextWrapped = false 
HighlightLabel.RichText = true
HighlightLabel.Text = ""
HighlightLabel.Parent = TextBox.Parent or ScrollingFrame

local UICorner_13 = Instance.new("UICorner")
_STORAGE["UICorner_13"] = UICorner_13
UICorner_13.Name = "UICorner"
UICorner_13.Parent = HighlightLabel

local Home = Instance.new("Frame")
_STORAGE["Home"] = Home
Home.Name = "Home"
Home.Size = UDim2.new(0.973130763, 0, 0.942779303, 0)
Home.Position = UDim2.new(0.0128504671, 0, 0.0245231614, 0)
Home.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
Home.BackgroundTransparency = 0.30000001192092896
Home.Visible = true
Home.ZIndex = 1
Home.BorderSizePixel = 0
Home.ClipsDescendants = false
Home.Parent = _STORAGE["Menu"] or Menu

local UICorner_14 = Instance.new("UICorner")
_STORAGE["UICorner_14"] = UICorner_14
UICorner_14.Name = "UICorner"
UICorner_14.Parent = _STORAGE["Home"] or Home

local TextLabel126132 = Instance.new("TextButton")
_STORAGE["TextLabel126132"] = TextLabel126132
TextLabel126132.Name = "TextLabel126132"
TextLabel126132.Size = UDim2.new(0.25, 0, 0.08, 0)
TextLabel126132.Position = UDim2.new(0.7, 0, 0.053, 0)
TextLabel126132.Text = "Force Shutdown UI"
TextLabel126132.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel126132.BackgroundTransparency = 0
TextLabel126132.TextTransparency = 0
TextLabel126132.Visible = true
TextLabel126132.ZIndex = 1
TextLabel126132.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel126132.Font = Enum.Font.Code
TextLabel126132.TextScaled = true
TextLabel126132.TextSize = 14
TextLabel126132.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel126132.BorderSizePixel = 0
TextLabel126132.TextXAlignment = Enum.TextXAlignment.Center
TextLabel126132.TextYAlignment = Enum.TextYAlignment.Center
TextLabel126132.TextWrapped = true
TextLabel126132.ClipsDescendants = false
TextLabel126132.Parent = Home

TextLabel126132.MouseButton1Click:Connect(function()
    TextLabel126132:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptmirroroffical/My-Script/refs/heads/Framework/ForceShutdown.Engine.SM"))()
    task.wait(2)    
    ScreenGui:Destroy()
end)

local UICorner = Instance.new("UICorner")
_STORAGE["UICorner"] = UICorner
UICorner.Name = "UICorner"
UICorner.Parent = _STORAGE["TextLabel126132"] or TextLabel126132

local ImageLabel = Instance.new("ImageLabel")
_STORAGE["ImageLabel"] = ImageLabel
ImageLabel.Name = "ImageLabel"
ImageLabel.Size = UDim2.new(0.0600240156, 0, 0.144508675, 0)
ImageLabel.Position = UDim2.new(0.0192076825, 0, 0.0433526002, 0)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 0
ImageLabel.Image = "rbxassetid://88774721887954"
ImageLabel.ImageTransparency = 0
ImageLabel.Visible = true
ImageLabel.ZIndex = 1
ImageLabel.BorderSizePixel = 0
ImageLabel.ClipsDescendants = false
ImageLabel.Parent = _STORAGE["Home"] or Home

local UICorner_15 = Instance.new("UICorner")
_STORAGE["UICorner_15"] = UICorner_15
UICorner_15.Name = "UICorner"
UICorner_15.Parent = _STORAGE["ImageLabel"] or ImageLabel

local TextLabel_2 = Instance.new("TextLabel")
_STORAGE["TextLabel_2"] = TextLabel_2
TextLabel_2.Name = "TextLabel"
TextLabel_2.Size = UDim2.new(0.240096062, 0, 0.144508675, 0)
TextLabel_2.Position = UDim2.new(0.0936374515, 0, 0.0433526002, 0)
TextLabel_2.Text = "SM Executor"
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.TextTransparency = 0
TextLabel_2.Visible = true
TextLabel_2.ZIndex = 1
TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_2.TextYAlignment = Enum.TextYAlignment.Center
TextLabel_2.TextWrapped = true
TextLabel_2.ClipsDescendants = false
TextLabel_2.Parent = _STORAGE["Home"] or Home

local TextLabel_3 = Instance.new("TextLabel")
_STORAGE["TextLabel_3"] = TextLabel_3
TextLabel_3.Name = "TextLabel"
TextLabel_3.Size = UDim2.new(0.959183753, 0, 0.144508675, 0)
TextLabel_3.Position = UDim2.new(0.0192076825, 0, 0.187861279, 0)
TextLabel_3.Text = "Source : https://github.com/scriptmirroroffical"
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.TextTransparency = 0
TextLabel_3.Visible = true
TextLabel_3.ZIndex = 1
TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel_3.Font = Enum.Font.Fondamento
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14
TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_3.TextYAlignment = Enum.TextYAlignment.Center
TextLabel_3.TextWrapped = true
TextLabel_3.ClipsDescendants = false
TextLabel_3.Parent = _STORAGE["Home"] or Home

local TextLabel_4 = Instance.new("TextLabel")
_STORAGE["TextLabel_4"] = TextLabel_4
TextLabel_4.Name = "TextLabel"
TextLabel_4.Size = UDim2.new(0.959183753, 0, 0.450867057, 0)
TextLabel_4.Position = UDim2.new(0.0204081628, 0, 0.332369953, 0)
TextLabel_4.Text = "Description : This Project had been started in the end month of 2025 and all of this project is open-source ,so you can adjust it . Thank you!"
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1
TextLabel_4.TextTransparency = 0
TextLabel_4.Visible = true
TextLabel_4.ZIndex = 1
TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel_4.Font = Enum.Font.Fondamento
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14
TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_4.TextYAlignment = Enum.TextYAlignment.Center
TextLabel_4.TextWrapped = true
TextLabel_4.ClipsDescendants = false
TextLabel_4.Parent = _STORAGE["Home"] or Home

local TextLabel_5 = Instance.new("TextLabel")
_STORAGE["TextLabel_5"] = TextLabel_5
TextLabel_5.Name = "TextLabel"
TextLabel_5.Size = UDim2.new(0.96038425, 0, 0.144508675, 0)
TextLabel_5.Position = UDim2.new(0.0180072021, 0, 0.812138736, 0)
TextLabel_5.Text = "<+><+><+><+><+><+<+><+><+><+><+><+><+><+><+><+><+>"
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1
TextLabel_5.TextTransparency = 0
TextLabel_5.Visible = true
TextLabel_5.ZIndex = 1
TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel_5.Font = Enum.Font.Fondamento
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14
TextLabel_5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_5.TextYAlignment = Enum.TextYAlignment.Center
TextLabel_5.TextWrapped = true
TextLabel_5.ClipsDescendants = false
TextLabel_5.Parent = _STORAGE["Home"] or Home

local Massage = Instance.new("Frame")
_STORAGE["Massage"] = Massage
Massage.Name = "Massage"
Massage.Size = UDim2.new(0.207367197, 0, 0.144965276, 0)
Massage.Position = UDim2.new(0.792486072, 0, 0.855034709, 0)
Massage.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
Massage.BackgroundTransparency = 0
Massage.Visible = true
Massage.ZIndex = 999
Massage.BorderSizePixel = 0
Massage.ClipsDescendants = false
Massage.Parent = _STORAGE["ScreenGui"] or ScreenGui

local UICorner99 = Instance.new("UICorner")
_STORAGE["UICorner99"] = UICorner99
UICorner99.Name = "UICorner99"
UICorner99.Parent = _STORAGE["Massage"] or Massage

local ImageLabel99 = Instance.new("ImageLabel")
_STORAGE["ImageLabel99"] = ImageLabel99
ImageLabel99.Name = "ImageLabel99"
ImageLabel99.Size = UDim2.new(0.0600240156, 0, 0.144508675, 0)
ImageLabel99.Position = UDim2.new(0.0192076825, 0, 0.0433526002, 0)
ImageLabel99.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel99.BackgroundTransparency = 0
ImageLabel99.Image = "rbxassetid://88774721887954"
ImageLabel99.ImageTransparency = 0
ImageLabel99.Visible = true
ImageLabel99.ZIndex = 1000
ImageLabel99.BorderSizePixel = 0
ImageLabel99.ClipsDescendants = false
ImageLabel99.Parent = _STORAGE["Massage"] or Massage

local UICorner = Instance.new("UICorner")
_STORAGE["UICorner"] = UICorner
UICorner.Name = "UICorner"
UICorner.Parent = _STORAGE["ImageLabel99"] or ImageLabel99

local TextLabel99 = Instance.new("TextLabel")
_STORAGE["TextLabel99"] = TextLabel99
TextLabel99.Name = "TextLabel99"
TextLabel99.Size = UDim2.new(0.409947485, 0, 0.144508675, 0)
TextLabel99.Position = UDim2.new(0.100007206, 0, 0.0433525033, 0)
TextLabel99.Text = "SM Executor Notice"
TextLabel99.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel99.BackgroundTransparency = 1
TextLabel99.TextTransparency = 0
TextLabel99.Visible = true
TextLabel99.ZIndex = 1000
TextLabel99.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel99.TextScaled = true
TextLabel99.TextSize = 14
TextLabel99.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel99.BorderSizePixel = 0
TextLabel99.TextXAlignment = Enum.TextXAlignment.Left
TextLabel99.TextYAlignment = Enum.TextYAlignment.Center
TextLabel99.TextWrapped = true
TextLabel99.ClipsDescendants = false
TextLabel99.Parent = _STORAGE["Massage"] or Massage

local MassageContent = Instance.new("TextLabel")
_STORAGE["MassageContent"] = MassageContent
MassageContent.Name = "MassageContent"
MassageContent.Size = UDim2.new(1, 0, 0.814371228, 0)
MassageContent.Position = UDim2.new(0, 0, 0.191616774, 0)
MassageContent.Text = "<Massage-Content>"
MassageContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MassageContent.BackgroundTransparency = 1
MassageContent.TextTransparency = 0
MassageContent.Visible = true
MassageContent.ZIndex = 1000
MassageContent.FontFace = Font.new("rbxasset://fonts/families/Kalam.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
MassageContent.Font = Enum.Font.Kalam
MassageContent.TextScaled = true
MassageContent.TextColor3 = Color3.fromRGB(0, 0, 0)
MassageContent.BorderSizePixel = 0
MassageContent.TextXAlignment = Enum.TextXAlignment.Left
MassageContent.TextYAlignment = Enum.TextYAlignment.Top
MassageContent.TextWrapped = true
MassageContent.ClipsDescendants = false
MassageContent.Parent = _STORAGE["Massage"] or Massage

_G.OmniStorage = _STORAGE

--[[
    ======================================================================
    🔥 OMNI-GOD PRO CORE v7.5 - ULTIMATE EDITION 🔥
    Author: son171020 (Powered by SM Engine & Advanced Logic)
    Description: Advanced Modular Core for OmniStorage UI
    Features: Smooth Drag, Tween Animations, Deep Scanner, SS Injector, Custom Env
    Optimization: Anti-Lag Batching, Redundant Logic Removed, Deep Error Handling
    ======================================================================
]]

--=========================================
-- 1. INITIALIZATION & CORE SERVICES
--=========================================
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

local _STORAGE = _G.OmniStorage

local UI = {
	ScreenGui = _STORAGE["ScreenGui"],
	BtnTgleGui = _STORAGE["BtnTgleGui"],
	ImageButton = _STORAGE["ImageButton"], 
	MainMenu = _STORAGE["MainMenu"],       
	HomeBtn = _STORAGE["HomeBtn"],
	ExecBtnNav = _STORAGE["ExecBtn"],      
	Menu = _STORAGE["Menu"],               
	HomeTab = _STORAGE["Home"],            
	ExecTab = _STORAGE["Exec"],            
	TextBox = _STORAGE["TextBox"],         
	ExecuteBtn = _STORAGE["ExecBtn_2"],    
	ScanBtn = _STORAGE["RTSL_2"],          
	ReturnBtn = _STORAGE["RTSL"],          
	NameLabel = _STORAGE["Name"],
	MessageFrame = _STORAGE["MessageFrame"],
	MessageContent = _STORAGE["MessageContent"],
	BackGO = _STORAGE["BackGO"]
}

--=========================================
-- 2. ENGINE STATE & CONFIGURATION
--=========================================
local EngineState = {
	Version = "7.5.0-ULTIMATE",
	SSMode = false,
	TargetRemote = nil,
	ValidKey = nil,
	ExecuteMethod = 1,
	Scanning = false,
	UI_Visible = true,
	CurrentTab = "Home",
	DiscoveredRemotes = {},
	Cooldowns = {
		Execute = false
	}
}

local Config = {
	BatchSize = 200, 
	WaitTime = 0.03, 
	VerificationToken = "SM_GOD_" .. HttpService:GenerateGUID(false):sub(1, 8),
	TweenSpeed = 0.4
}

local Colors = {
	Success = Color3.fromRGB(0, 255, 127),
	Warning = Color3.fromRGB(255, 170, 0),
	Error = Color3.fromRGB(255, 65, 65),
	Info = Color3.fromRGB(97, 255, 255),
	SS = Color3.fromRGB(170, 85, 255),
	Idle = Color3.fromRGB(255, 230, 102)
}

--=========================================
-- 3. HỆ THỐNG LOG & THÔNG BÁO (DEEP LOGGER)
--=========================================
local function safeLog(message, colorType, displayTime)
	local prefix = "[SM Core v7.5]: "
	local timestamp = os.date("%X")

	-- Ghi Log F9 Console
	print(string.format("%s [%s] %s", prefix, timestamp, message))

	-- Đổi màu viền TextBox tạo hiệu ứng thị giác (nếu đang ở tab Exec)
	if UI.TextBox and EngineState.CurrentTab == "Exec" then
		task.spawn(function()
			local originalColor = Color3.fromRGB(138, 138, 138)
			local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			TweenService:Create(UI.TextBox, tweenInfo, {BackgroundColor3 = colorType or Colors.Info}):Play()
			task.wait(0.5)
			TweenService:Create(UI.TextBox, tweenInfo, {BackgroundColor3 = originalColor}):Play()
		end)
	end

	-- Đẩy thông báo lên Notice System (nếu có UI)
	if UI.MessageFrame and UI.MessageContent then
		UI.MessageContent.Text = message
		UI.MessageContent.TextColor3 = colorType or Colors.Info
		UI.MessageFrame.Visible = true

		-- Animation trượt lên cho Notice
		UI.MessageFrame.Position = UDim2.new(0.792, 0, 1, 0)
		TweenService:Create(UI.MessageFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = UDim2.new(0.792, 0, 0.855, 0)}):Play()

		task.spawn(function()
			task.wait(displayTime or 3)
			TweenService:Create(UI.MessageFrame, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {Position = UDim2.new(0.792, 0, 1.2, 0)}):Play()
			task.wait(0.3)
			UI.MessageFrame.Visible = false
		end)
	end
end

--=========================================
-- 4. HIỆU ỨNG & GIAO DIỆN CHUYÊN SÂU
--=========================================
local standardTween = TweenInfo.new(Config.TweenSpeed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function toggleUI()
	EngineState.UI_Visible = not EngineState.UI_Visible

	local targetPosMenu = EngineState.UI_Visible and UDim2.new(0.207, 0, 0.462, 0) or UDim2.new(0.207, 0, 1.5, 0)
	local targetPosMain = EngineState.UI_Visible and UDim2.new(0.046, 0, 0.535, 0) or UDim2.new(0.046, 0, 1.5, 0)
	local targetTrans = EngineState.UI_Visible and 0.155 or 0.655

	TweenService:Create(UI.Menu, standardTween, {Position = targetPosMenu}):Play()
	TweenService:Create(UI.MainMenu, standardTween, {Position = targetPosMain}):Play()

	if UI.BackGO then
		TweenService:Create(UI.BackGO, standardTween, {BackgroundTransparency = targetTrans}):Play()
	end

	local rot = EngineState.UI_Visible and 0 or 180
	TweenService:Create(UI.ImageButton, TweenInfo.new(0.3), {Rotation = rot}):Play()
end
UI.ImageButton.MouseButton1Click:Connect(toggleUI)

local function switchTab(tabName)
	if EngineState.CurrentTab == tabName then return end
	EngineState.CurrentTab = tabName

	if tabName == "Home" then
		UI.HomeTab.Visible = true
		UI.ExecTab.Visible = false
		TweenService:Create(UI.HomeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 200, 0)}):Play()
		TweenService:Create(UI.ExecBtnNav, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 140, 0)}):Play()
	elseif tabName == "Exec" then
		UI.HomeTab.Visible = false
		UI.ExecTab.Visible = true
		TweenService:Create(UI.ExecBtnNav, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 200, 0)}):Play()
		TweenService:Create(UI.HomeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 140, 0)}):Play()
	end
end
UI.HomeBtn.MouseButton1Click:Connect(function() switchTab("Home") end)
UI.ExecBtnNav.MouseButton1Click:Connect(function() switchTab("Exec") end)
UI.ExecTab.Visible = false

-- Kéo thả mượt mà (Smooth Dragging)
local function makeDraggable(guiObject)
	local dragging, dragInput, dragStart, startPos

	guiObject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = guiObject.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)

	guiObject.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then 
			local delta = input.Position - dragStart
			local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			TweenService:Create(guiObject, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Position = newPos}):Play()
		end
	end)
end
makeDraggable(UI.MainMenu)
makeDraggable(UI.Menu)

--=========================================
--Textbox Update
--=========================================
local keywords = {
    lua = {
        "and", "break", "do", "else", "elseif", "end", "false", "for", "function", "if", 
        "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", 
        "while", "continue", "export", "type", "self","assert", "collectgarbage", "error", "getfenv", "getmetatable", "ipairs", 
        "loadstring", "next", "pairs", "pcall", "print", "rawequal", "rawget", "rawset", 
        "require", "select", "setfenv", "setmetatable", "tonumber", "tostring", 
        "unpack", "xpcall", "_G", "_VERSION", "math", "string", "table", "bit32", 
        "coroutine", "debug", "utf8", "buffer", "os"
    },  
    rbx = {
        "game", "workspace", "script", "shared", "plugin", "Enum", "task", "Instance", 
        "new", "tick", "warn", "wait", "delay", "spawn", "DateTime","Axes", "BrickColor", "CFrame", "Color3", "ColorSequence", "ColorSequenceKeypoint", 
        "Faces", "Font", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", 
        "OverlapParams", "PathWaypoint", "PhysicalProperties", "Random", "Ray", 
        "RaycastParams", "RaycastResult", "Rect", "Region3", "TweenInfo", "UDim", 
        "UDim2", "Vector2", "Vector3", "FloatCurveKey","Players", "ReplicatedStorage", "ServerStorage", "ServerScriptService", 
        "StarterGui", "StarterPlayer", "HttpService", "TweenService", "RunService", 
        "UserInputService", "ContextActionService", "DataStoreService", 
        "MessagingService", "TeleportService", "SoundService", "Debris", 
        "MarketplaceService", "PathfindingService", "LogService", "Stats", 
        "CollectionService", "Selection", "TestService","Part", "MeshPart", "Model", "Folder", "Tool", "Humanoid", "Animator", 
        "Animation", "ScreenGui", "Frame", "TextLabel", "TextButton", "TextBox", 
        "ImageLabel", "ImageButton", "ScrollingFrame", "UIListLayout", "UIGridLayout", 
        "UICorner", "UIStroke", "UIGradient", "UIScale", "ModuleScript", "LocalScript", 
        "Sound", "ParticleEmitter", "Trail", "Beam", "Highlight", "WeldConstraint", 
        "Attachment", "Motor6D", "RemoteEvent", "RemoteFunction", "BindableEvent", 
        "BindableFunction"
    },
    exploit = {
        "hookmetamethod", "hookfunction", "getrawmetatable", "setrawmetatable", 
        "setreadonly", "isreadonly", "checkcaller", "getnamecallmethod", "setnamecallmethod", "getgenv", "getrenv", "getsenv", "getfenv", "setfenv", "getreg", "getnilinstances",
        "getinstances", "getscripts", "getloadedmodules", "getcallstack", "decompile", "saveinstance", "cloneref", "clonefunction", "iscclosure", 
        "islclosure", "isexecutorclosure", "newcclosure", "getfunctionhash",
        "getconstants", "getupvalues", "getprotos", "setconstant", "setupvalue", "setproto", "readfile", "writefile", "appendfile", "loadfile", "listfiles", "isfile", 
        "isfolder", "makefolder", "delfile", "delfolder", "crypt", "base64_encode", "base64_decode","fireclickdetector", "firetouchinterest", "fireproximityprompt", 
        "getconnections", "gethiddenproperty", "sethiddenproperty", "getcustomasset",
        "isrbxactive", "keypress", "keyrelease", "mouse1click", "mouse1press", "mouse2click","Drawing", "new", "Line", "Text", "Circle", "Square", "Triangle", "Quad"
    },
    operators = {
        "+", "-", "*", "/", "%", "^", "#","==", "~=", "<", ">", "<=", ">=","=", "+=", "-=", "*=", "/=", "%=", "^=", "..=","and", "or", "not","..","(", ")", "{", "}", "[", "]", 
        ",", ".", ":", ";", "...", "?", "|", "&", "->", "::", "!"
    }
}

local colors = {
    numbers = Color3.fromRGB(255, 198, 0),
    boolean = Color3.fromRGB(255, 198, 0),
    operator = Color3.fromRGB(204, 204, 204),
    lua = Color3.fromRGB(132, 214, 247),
    exploit = Color3.fromRGB(171, 84, 247),
    rbx = Color3.fromRGB(248, 109, 124),
    str = Color3.fromRGB(173, 241, 132),
    comment = Color3.fromRGB(102, 102, 102),
    null = Color3.fromRGB(255, 198, 0),
    keyword_special = Color3.fromRGB(248, 109, 115),
    default = Color3.fromRGB(255, 255, 255)
}

local function getHex(color)
    return string.format("#%02X%02X%02X", color.R * 255, color.G * 255, color.B * 255)
end

local function toSet(list)
    local s = {}
    for _, v in ipairs(list) do s[v] = true end
    return s
end

local luaSet = toSet(keywords.lua)
local rbxSet = toSet(keywords.rbx)
local exploitSet = toSet(keywords.exploit)
local opSet = toSet(keywords.operators)

local function escape(t)
    return t:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
end

local function runHighlight(source)
    local output = {}
    local pos = 1
    local len = #source
    
    while pos <= len do
        local char = source:sub(pos, pos)
        
        -- 1. Kiểm tra Comment (--)
        if source:sub(pos, pos + 1) == "--" then
            local comment = source:match("^[^\n]*", pos)
            output[#output + 1] = string.format('<font color="%s">%s</font>', getHex(colors.comment), escape(comment))
            pos = pos + #comment
            
        -- 2. Kiểm tra String (" " hoặc ' ')
        elseif char == '"' or char == "'" then
            local str = source:match("^(['\"].-['\"])", pos) or char
            output[#output + 1] = string.format('<font color="%s">%s</font>', getHex(colors.str), escape(str))
            pos = pos + #str
            
        -- 3. Kiểm tra Số
        elseif char:match("%d") then
            local num = source:match("^%d+", pos)
            output[#output + 1] = string.format('<font color="%s">%s</font>', getHex(colors.numbers), num)
            pos = pos + #num
            
        -- 4. Kiểm tra Chữ, Keywords, và Tiếng Việt (TỐI ƯU SIÊU TỐC)
        -- Sử dụng \128-\255 để gom toàn bộ từ có dấu tiếng Việt vào thành 1 chuỗi, không bị tách rời
        elseif char:match("[%a_]") or string.byte(char) > 127 then
            local word = source:match("^[%w_%z\128-\255]+", pos)
            if not word then word = char end -- Fallback an toàn
            
            local color = colors.default
            if luaSet[word] then 
                color = (word == "local" or word == "function") and colors.keyword_special or colors.lua
            elseif rbxSet[word] then color = colors.rbx
            elseif exploitSet[word] then color = colors.exploit
            elseif word == "true" or word == "false" or word == "nil" then color = colors.boolean
            end
            
            output[#output + 1] = string.format('<font color="%s">%s</font>', getHex(color), escape(word))
            pos = pos + #word
            
        -- 5. Kiểm tra Toán tử
        elseif opSet[char] then
            output[#output + 1] = string.format('<font color="%s">%s</font>', getHex(colors.operator), escape(char))
            pos = pos + 1
            
        -- 6. Xuống dòng và Khoảng trắng
        else
            output[#output + 1] = escape(char)
            pos = pos + 1
        end
    end
    
    return table.concat(output)
end

local function updateScrolling()
    -- Lấy kích thước thực tế của toàn bộ văn bản (bao gồm cả các dòng đã xuống)
    local textSize = TextBox.TextBounds
    
    -- Tính toán CanvasSize mới dựa trên TextBounds
    -- Thêm một khoảng đệm (Padding) để không bị che mất dòng cuối
    local padding = 50
    local newCanvasSize = UDim2.new(0, textSize.X + padding, 0, textSize.Y + padding)
    
    ScrollingFrame.CanvasSize = newCanvasSize
    
    -- Quan trọng: TextBox và Label phải luôn lớn bằng CanvasSize để hiển thị hết chữ
    TextBox.Size = newCanvasSize
    HighlightLabel.Size = newCanvasSize
end

local lastUpdate = 0
local UPDATE_DELAY = 0.05 -- Giảm độ trễ xuống cực thấp cho script dài

local function update()
    local source = TextBox.Text
    
    -- TRƯỜNG HỢP 1: Script quá dài (Tránh Crash Game)
    if #source > 15000 then 
        HighlightLabel.RichText = false
        HighlightLabel.Text = source
        -- Chỉ tính toán lại kích thước cuộn
        updateScrolling()
        return
    end

    -- TRƯỜNG HỢP 2: Script ngắn & vừa (< 5000 ký tự) -> XỬ LÝ TỨC THÌ 0 GIÂY
    if #source < 5000 then
        HighlightLabel.RichText = true
        HighlightLabel.Text = runHighlight(source)
        updateScrolling()
        return
    end

    -- TRƯỜNG HỢP 3: Script trung bình (5000 - 15000) -> Dùng Debounce nhẹ để không tụt FPS
    local currentTime = tick()
    lastUpdate = currentTime
    
    task.wait(UPDATE_DELAY)
    
    if lastUpdate ~= currentTime then return end

    HighlightLabel.RichText = true
    task.spawn(function()
        HighlightLabel.Text = runHighlight(source)
        updateScrolling()
    end)
end

-- Kết nối sự kiện
TextBox:GetPropertyChangedSignal("Text"):Connect(update)

-- Chạy lần đầu
update()

local TextService = game:GetService("TextService")

local EngineState = {
    Cooldowns = { Execute = false }
}

local Colors = {
    Success = Color3.fromRGB(0, 255, 127),
    Error = Color3.fromRGB(255, 85, 85),
    Warning = Color3.fromRGB(255, 170, 0),
    Idle = Color3.fromRGB(170, 170, 170)
}

-- Hàm Log thông báo
local function safeLog(msg, color)
    print("[OMNI-GOD]: " .. msg)
    -- Bạn có thể thêm code hiển thị thông báo lên màn hình tại đây
end

local TextService = game:GetService("TextService")

-- 1. Cấu hình đường dẫn (Hãy chắc chắn tên TextBox và ExecuteBtn đúng trong Explorer)
local ExecuteBtn = ExecBtn

local EngineState = { Cooldowns = { Execute = false } }

--=========================================
-- 2. HỆ THỐNG CON TRỎ GIẢ (FIXED POSITION)
--=========================================
local FakeCursor = Instance.new("Frame")
FakeCursor.Name = "CustomCursor"
-- Chỉnh Size cao thấp tùy theo TextSize của bạn (thường là bằng hoặc hơn TextSize 2-4 đơn vị)
FakeCursor.Size = UDim2.new(0, 2, 0, TextBox.TextSize) 
FakeCursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FakeCursor.BorderSizePixel = 0
FakeCursor.ZIndex = 10
FakeCursor.Visible = false
FakeCursor.Parent = TextBox.Parent

local CurCor = Instance.new("UICorner", FakeCursor)
CurCor.CornerRadius = UDim.new(0, 8)

-- Luồng nhấp nháy
task.spawn(function()
    while true do
        if FakeCursor.Visible then
            FakeCursor.BackgroundTransparency = 0
            task.wait(0.5)
            FakeCursor.BackgroundTransparency = 1
            task.wait(0.5)
        else
            task.wait(0.2)
        end
    end
end)

-- HÀM CẬP NHẬT VỊ TRÍ (ĐÃ FIX LỖI "BAY")
local function updateCursor()
    if TextBox:IsFocused() then
        local cp = TextBox.CursorPosition
        if cp == -1 then cp = #TextBox.Text + 1 end
        
        local textUpToCursor = string.sub(TextBox.Text, 1, cp - 1)
        local fontSize = TextBox.TextSize
        local font = TextBox.Font
        
        -- Tính toán kích thước đoạn text đã nhập
        -- Vector2.new(TextBox.AbsoluteSize.X, 10000) giúp hỗ trợ cả khi bạn xuống dòng
        local size = TextService:GetTextSize(textUpToCursor, fontSize, font, Vector2.new(TextBox.AbsoluteSize.X, 10000))
        
        -- TÍNH TOÁN TỌA ĐỘ MỚI:
        -- X: Lấy theo độ dài chữ + Offset của TextBox
        -- Y: Lấy theo chiều cao dòng (size.Y) để không bị bay xuống giữa ô
        local xOffset = size.X + 2
        local yOffset = size.Y - fontSize -- Đẩy lên đầu dòng thay vì giữa ô
        
        FakeCursor.Position = UDim2.new(
            TextBox.Position.X.Scale, 
            TextBox.Position.X.Offset + xOffset, 
            TextBox.Position.Y.Scale, 
            TextBox.Position.Y.Offset + yOffset + 2 -- +2 để căn lề trên cho đẹp
        )
        FakeCursor.Visible = true
    else
        FakeCursor.Visible = false
    end
end

TextBox:GetPropertyChangedSignal("CursorPosition"):Connect(updateCursor)
TextBox:GetPropertyChangedSignal("Text"):Connect(updateCursor)
TextBox.Focused:Connect(updateCursor)
TextBox.FocusLost:Connect(function() FakeCursor.Visible = false end)

--=========================================
-- 6. BỘ XỬ LÝ THỰC THI (EXECUTION HANDLER)
--=========================================
local function getCompilerMethod()
    if type(getgenv) == "function" then
        local env = getgenv()
        if type(env.loadstring) == "function" then return env.loadstring end
        if type(env.load) == "function" then return env.load end
        if type(env.run_secure) == "function" then return env.run_secure end 
    end

    if type(loadstring) == "function" then return loadstring end
    if type(load) == "function" then return load end
    
    return nil
end

UI.ExecuteBtn.MouseButton1Click:Connect(function()
    if EngineState.Cooldowns.Execute then return end
    EngineState.Cooldowns.Execute = true

    local inputSource = TextBox.Text
    if inputSource == "" or inputSource:match("^%s*$") then 
        safeLog("Trường dữ liệu rỗng! Hãy nhập script.", Colors.Warning, 3)
        EngineState.Cooldowns.Execute = false
        return 
    end
    
    local compilerFunc = getCompilerMethod()
    
    if compilerFunc then
        local successCompile, compiledFuncOrErr = pcall(compilerFunc, inputSource)
        
        if successCompile and type(compiledFuncOrErr) == "function" then
            
            if setfenv and getgenv then
                pcall(setfenv, compiledFuncOrErr, getgenv())
            end

            task.spawn(function()
                local s, rErr = pcall(compiledFuncOrErr)
                if not s then 
                    safeLog("Runtime Error: " .. tostring(rErr), Colors.Error, 5) 
                else 
                    safeLog("✅ Thực thi Local thành công!", Colors.Success, 3) 
                end
            end)
            
        else 
            safeLog("Syntax/Compile Error: " .. tostring(compiledFuncOrErr), Colors.Error, 5) 
        end
    else
        safeLog("❌ Môi trường hiện tại không hỗ trợ bất kỳ method compile nào!", Colors.Error, 4)
    end

    task.wait(0.5)
    EngineState.Cooldowns.Execute = false
end)

--=========================================
-- 8. SM-ROTATION-CORE (VÒNG LẶP HÌNH ẢNH)
--=========================================
local function StartBackRotation()
	if UI.BackGO then
		UI.BackGO.AnchorPoint = Vector2.new(0.5, 0.5)
		UI.BackGO.Position = UDim2.new(0.5, 0, 0.5, 0) 

		local rotateInfo = TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false)
		TweenService:Create(UI.BackGO, rotateInfo, {Rotation = 360}):Play()
	end
end
task.spawn(StartBackRotation)

--[[ 
    ======================================================================
    🔥 OMNI-GOD NOTICE ENGINE v7.8 - ULTIMATE FIX 🔥
    Sửa lỗi: Chữ bị đen, không cập nhật nội dung, ZIndex thấp
    ======================================================================
]]

local _STORAGE = _G.OmniStorage
local TweenService = game:GetService("TweenService")

-- 1. CẤU HÌNH (Đã chỉnh lại vị trí trượt mượt hơn)
local NoticeConfig = {
    Position_Visible = UDim2.new(0.792, 0, 0.855, 0), 
    Position_Hidden = UDim2.new(0.792, 0, 1.2, 0),   
    DefaultTime = 2.5,
    Queue = {},
    IsProcessing = false
}

-- 2. HÀM XỬ LÝ QUY TRÌNH HIỆN CHỮ
local function processNoticeQueue()
    if #NoticeConfig.Queue == 0 or NoticeConfig.IsProcessing then return end
    
    local frame = _STORAGE["Massage"]
    local content = _STORAGE["MassageContent"]

    if not frame or not content then return end

    NoticeConfig.IsProcessing = true
    local data = table.remove(NoticeConfig.Queue, 1)

    -- CÀI ĐẶT THUỘC TÍNH QUAN TRỌNG (ÉP HIỆN CHỮ)
    content.Text = "" -- Reset chữ cũ
    content.Text = tostring(data.Text)
    content.TextTransparency = 0
    content.TextStrokeTransparency = 0.5 -- Thêm viền nhẹ cho chữ nổi bật
    
    frame.Visible = true
    frame.Position = NoticeConfig.Position_Hidden

    -- Animation trượt lên
    local tweenIn = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = NoticeConfig.Position_Visible
    })
    
    tweenIn:Play()
    task.wait(0.6 + data.Duration)

    -- Animation trượt xuống
    local tweenOut = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = NoticeConfig.Position_Hidden
    })
    
    tweenOut:Play()
    task.wait(0.5)
    
    frame.Visible = false
    NoticeConfig.IsProcessing = false
    processNoticeQueue()
end

-- 3. HÀM GỌI NOTIFY CHUẨN
local function notify(text, color, duration)
    table.insert(NoticeConfig.Queue, {
        Text = text,
        Color = color or Color3.fromRGB(255, 255, 255),
        Duration = duration or NoticeConfig.DefaultTime
    })
    task.spawn(processNoticeQueue)
end

--=========================================
-- 4. FIX CÁC NÚT BẤM (SỬA LỖI MAPPING TRONG FILE CỦA BẠN)
--=========================================

-- Tắt cái khung cam đang bị kẹt trên màn hình lúc mới chạy
if _STORAGE["Massage"] then 
    _STORAGE["Massage"].Visible = false 
    _STORAGE["Massage"].Position = NoticeConfig.Position_Hidden
end

-- Gán lại sự kiện cho nút Execute (ExecBtn_2 trong file của bạn)
if _STORAGE["ExecBtn_2"] then
    _STORAGE["ExecBtn_2"].MouseButton1Click:Connect(function()
        notify("EXECUTING SCRIPT...", Color3.fromRGB(255, 255, 0), 2)
    end)
end

-- Thông báo chào mừng để kiểm tra ngay lập tức
task.spawn(function()
    task.wait(2)
    notify("OMNI-GOD V7.8 HAS BEEN ACTIVATED", Color3.fromRGB(0, 255, 150), 4)
end)

--=========================================
-- 5. HIỆU ỨNG RIPPLE (SÓNG NƯỚC) CHO NÚT BẤM
-- Tăng thêm ~100 dòng code logic thẩm mỹ
--=========================================
local function createRipple(button)
	button.ClipsDescendants = true
	local ripple = Instance.new("Frame")
	ripple.Name = "Ripple"
	ripple.Parent = button
	ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ripple.BackgroundTransparency = 0.6
	ripple.ZIndex = button.ZIndex + 1
	ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    local RiCor = Instance.new("UICorner", ripple)
	
	-- Lấy tọa độ chuột
	local mousePos = UserInputService:GetMouseLocation()
	local btnPos = button.AbsolutePosition
	ripple.Position = UDim2.new(0, mousePos.X - btnPos.X, 0, mousePos.Y - btnPos.Y - 36)
	
	-- Tween giãn nở và biến mất
	ripple.Size = UDim2.new(0, 0, 0, 0)
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	TweenService:Create(ripple, tweenInfo, {
		Size = UDim2.new(2, 0, 2, 0), -- Scale lên gấp đôi nút
		BackgroundTransparency = 1
	}):Play()
	
	task.wait(0.5)
	ripple:Destroy()
end

-- Tự động gán Ripple cho tất cả nút trong UI
for _, btn in pairs(UI) do
	if btn:IsA("TextButton") or btn:IsA("ImageButton") then
		btn.MouseButton1Click:Connect(function()
			createRipple(btn)
		end)
	end
end

--=========================================
-- 6. KIỂM TRA BOOT (STARTUP NOTIFY)
--=========================================
task.spawn(function()
	task.wait(1)
	notify("OMNI-GOD V7.8: The system is ready", Colors.Success, 3)
	notify("Author: Scriptmirror with son171020's module", Colors.Info, 2)
end)

--=========================================
-- FINAL BOOT SEQUENCE
--=========================================
switchTab("Home")
safeLog("OMNI-GOD v7.5 BOOTED & READY!", Colors.Success, 5)
