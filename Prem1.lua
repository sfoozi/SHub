local ALLOWED_USERS = {"SewaDrago", "test_levels"}
local SUBSCRIPTIONS = {["SewaDrago"] = {SHub_Legit = true, SHub_ESP = true}, ["test_levels"] = {SHub_Legit = true, SHub_ESP = true}}
local LocalPlayer = game:GetService("Players").LocalPlayer
local realUsername = LocalPlayer.Name
local isAllowed = false

for _, allowedName in ipairs(ALLOWED_USERS) do
    if realUsername == allowedName then
        isAllowed = true
        break
    end
end

if not isAllowed then
    LocalPlayer:Kick("You are not a client user")
    return
end

local WelcomeUI = Instance.new("ScreenGui")
WelcomeUI.Name = "WelcomeUI"
WelcomeUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
WelcomeUI.DisplayOrder = 999
WelcomeUI.Parent = game.CoreGui

local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Name = "WelcomeFrame"
WelcomeFrame.Size = UDim2.new(0, 0, 0, 0)
WelcomeFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
WelcomeFrame.BackgroundColor3 = Color3.new(0, 0, 0)
WelcomeFrame.BackgroundTransparency = 1
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
WelcomeFrame.Parent = WelcomeUI

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.05, 0)
UICorner.Parent = WelcomeFrame

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Name = "WelcomeText"
WelcomeText.Size = UDim2.new(0.9, 0, 0.7, 0)
WelcomeText.Position = UDim2.new(0.05, 0, 0.15, 0)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome, " .. LocalPlayer.Name
WelcomeText.TextColor3 = Color3.new(1, 1, 1)
WelcomeText.TextScaled = true
WelcomeText.Font = Enum.Font.SourceSans
WelcomeText.TextTransparency = 1
WelcomeText.Parent = WelcomeFrame

local SelectionUI = Instance.new("ScreenGui")
SelectionUI.Name = "SelectionUI"
SelectionUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SelectionUI.DisplayOrder = 1000
SelectionUI.Parent = game.CoreGui
SelectionUI.Enabled = false

local SelectionFrame = Instance.new("Frame")
SelectionFrame.Name = "SelectionFrame"
SelectionFrame.Size = UDim2.new(0.35, 0, 0.45, 0)
SelectionFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
SelectionFrame.BackgroundColor3 = Color3.new(0, 0, 0)
SelectionFrame.BackgroundTransparency = 0.2
SelectionFrame.BorderSizePixel = 0
SelectionFrame.AnchorPoint = Vector2.new(0.5, 0.5)
SelectionFrame.Parent = SelectionUI

local SelectionCorner = Instance.new("UICorner")
SelectionCorner.CornerRadius = UDim.new(0.05, 0)
SelectionCorner.Parent = SelectionFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0.20, 0, 0.15, 15)
Title.Position = UDim2.new(0.05, 0, 0.05, 0)
Title.BackgroundTransparency = 1
Title.Text = "SHub"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSans
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = SelectionFrame

local UserInfo = Instance.new("TextLabel")
UserInfo.Name = "UserInfo"
UserInfo.Size = UDim2.new(0.9, 0, 0.3, 0)
UserInfo.Position = UDim2.new(0.05, 0, 0.25, 0)
UserInfo.BackgroundTransparency = 1
UserInfo.Text = "Юзер: " .. realUsername .. "\n" .. "Подписка: " .. (SUBSCRIPTIONS[realUsername] and "SHub_Legit, SHub_ESP" or "Нет") .. "\n" .. "Окончание подписки: Навсегда"
UserInfo.TextColor3 = Color3.new(1, 1, 1)
UserInfo.TextSize = 24
UserInfo.Font = Enum.Font.SourceSans
UserInfo.TextXAlignment = Enum.TextXAlignment.Left
UserInfo.TextYAlignment = Enum.TextYAlignment.Top
UserInfo.Parent = SelectionFrame

local activeSubCount = 0
if SUBSCRIPTIONS[realUsername] then
    if SUBSCRIPTIONS[realUsername].SHub_Legit then activeSubCount = activeSubCount + 1 end
    if SUBSCRIPTIONS[realUsername].SHub_ESP then activeSubCount = activeSubCount + 1 end
end

local ActiveSubs = Instance.new("TextLabel")
ActiveSubs.Name = "ActiveSubs"
ActiveSubs.Size = UDim2.new(0.9, 0, 0.1, 0)
ActiveSubs.Position = UDim2.new(0.05, 0, 0.55, 0)
ActiveSubs.BackgroundTransparency = 1
ActiveSubs.Text = "У вас активно " .. activeSubCount .. " подписка/и"
ActiveSubs.TextColor3 = Color3.new(1, 1, 1)
ActiveSubs.TextSize = 25
ActiveSubs.Font = Enum.Font.SourceSans
ActiveSubs.TextXAlignment = Enum.TextXAlignment.Left
ActiveSubs.Parent = SelectionFrame

local SelectPrompt = Instance.new("TextLabel")
SelectPrompt.Name = "SelectPrompt"
SelectPrompt.Size = UDim2.new(0.9, 0, 0.1, 0)
SelectPrompt.Position = UDim2.new(0.05, 0, 0.65, 0)
SelectPrompt.BackgroundTransparency = 1
SelectPrompt.Text = "Выберите подписку:"
SelectPrompt.TextColor3 = Color3.new(1, 1, 1)
SelectPrompt.TextSize = 25
SelectPrompt.Font = Enum.Font.SourceSans
SelectPrompt.TextXAlignment = Enum.TextXAlignment.Left
SelectPrompt.Parent = SelectionFrame

local LegitButton = Instance.new("TextButton")
LegitButton.Name = "LegitButton"
LegitButton.Size = UDim2.new(0.4, 0, 0.1, 0)
LegitButton.Position = UDim2.new(0.05, 0, 0.75, 0)
LegitButton.BackgroundColor3 = Color3.new(0, 0, 0)
LegitButton.BackgroundTransparency = 0.2
LegitButton.BorderSizePixel = 0
LegitButton.Text = "SHub_Legit"
LegitButton.TextColor3 = Color3.new(1, 1, 1)
LegitButton.TextSize = 15
LegitButton.Visible = SUBSCRIPTIONS[realUsername] and SUBSCRIPTIONS[realUsername].SHub_Legit or false
LegitButton.Parent = SelectionFrame

local LegitStroke = Instance.new("UIStroke")
LegitStroke.Color = Color3.new(1, 1, 1)
LegitStroke.Thickness = 2
LegitStroke.Parent = LegitButton

local LegitCorner = Instance.new("UICorner")
LegitCorner.CornerRadius = UDim.new(0.05, 0)
LegitCorner.Parent = LegitButton

local RageButton = Instance.new("TextButton")
RageButton.Name = "RageButton"
RageButton.Size = UDim2.new(0.4, 0, 0.1, 0)
RageButton.Position = UDim2.new(0.05, 0, 0.85, 0)
RageButton.BackgroundColor3 = Color3.new(0, 0, 0)
RageButton.BackgroundTransparency = 0.2
RageButton.BorderSizePixel = 0
RageButton.Text = "SHub_ESP"
RageButton.TextColor3 = Color3.new(1, 1, 1)
RageButton.TextSize = 15
RageButton.Visible = SUBSCRIPTIONS[realUsername] and SUBSCRIPTIONS[realUsername].SHub_ESP or false
RageButton.Parent = SelectionFrame

local RageStroke = Instance.new("UIStroke")
RageStroke.Color = Color3.new(1, 1, 1)
RageStroke.Thickness = 2
RageStroke.Parent = RageButton

local RageCorner = Instance.new("UICorner")
RageCorner.CornerRadius = UDim.new(0.05, 0)
RageCorner.Parent = RageButton

local function animateWelcome()
    local TweenService = game:GetService("TweenService")
    local tweenIn = TweenService:Create(WelcomeFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0.25, 0, 0.12, 0), BackgroundTransparency = 0.7})
    local textTweenIn = TweenService:Create(WelcomeText, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0})
    tweenIn:Play()
    textTweenIn:Play()
    tweenIn.Completed:Wait()
    wait(2)
    local tweenOut = TweenService:Create(WelcomeFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1})
    local textTweenOut = TweenService:Create(WelcomeText, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {TextTransparency = 1})
    tweenOut:Play()
    textTweenOut:Play()
    tweenOut.Completed:Connect(function()
        WelcomeUI:Destroy()
        SelectionUI.Enabled = true
    end)
end

LegitButton.MouseButton1Click:Connect(function()
    SelectionUI:Destroy()
    loadSHubLegit()
end)

RageButton.MouseButton1Click:Connect(function()
    SelectionUI:Destroy()
    loadSHubRage()
end)

coroutine.wrap(animateWelcome)()

function loadSHubLegit()
    local ALLOWED_PLACE_ID = 301549746
    if game.PlaceId ~= ALLOWED_PLACE_ID then
        game.Players.LocalPlayer:Kick("Unsupported place")
        return
    end
    
    local InfoUI = Instance.new("ScreenGui")
    InfoUI.Name = "InfoUI"
    InfoUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    InfoUI.DisplayOrder = 998
    InfoUI.Parent = game.CoreGui
    
    local InfoFrame = Instance.new("Frame")
    InfoFrame.Name = "InfoFrame"
    InfoFrame.Size = UDim2.new(0.15, 0, 0.15, 0)
    InfoFrame.Position = UDim2.new(0, 0, 1, -InfoFrame.Size.Y.Offset)
    InfoFrame.BackgroundTransparency = 1
    InfoFrame.Parent = InfoUI
    
    local InfoText1 = Instance.new("TextLabel")
    InfoText1.Name = "InfoText1"
    InfoText1.Size = UDim2.new(1, 0, 0, 20)
    InfoText1.Position = UDim2.new(0, 0, 0, 0)
    InfoText1.BackgroundTransparency = 1
    InfoText1.Text = "SHub"
    InfoText1.TextColor3 = Color3.new(1, 1, 1)
    InfoText1.TextTransparency = 0.3
    InfoText1.Font = Enum.Font.SourceSans
    InfoText1.TextSize = 16
    InfoText1.Parent = InfoFrame
    
    local InfoText2 = Instance.new("TextLabel")
    InfoText2.Name = "InfoText2"
    InfoText2.Size = UDim2.new(1, 0, 0, 20)
    InfoText2.Position = UDim2.new(0, 0, 0, 25)
    InfoText2.BackgroundTransparency = 1
    InfoText2.Text = "Support:"
    InfoText2.TextColor3 = Color3.new(1, 1, 1)
    InfoText2.TextTransparency = 0.3
    InfoText2.Font = Enum.Font.SourceSans
    InfoText2.TextSize = 16
    InfoText2.Parent = InfoFrame
    
    local InfoText3 = Instance.new("TextLabel")
    InfoText3.Name = "InfoText3"
    InfoText3.Size = UDim2.new(1, 0, 0, 20)
    InfoText3.Position = UDim2.new(0, 0, 0, 45)
    InfoText3.BackgroundTransparency = 1
    InfoText3.Text = "sfoozi, SewaDrago"
    InfoText3.TextColor3 = Color3.new(1, 1, 1)
    InfoText3.TextTransparency = 0.3
    InfoText3.Font = Enum.Font.SourceSans
    InfoText3.TextSize = 16
    InfoText3.Parent = InfoFrame
    
    local VersionUI = Instance.new("ScreenGui")
    VersionUI.Name = "VersionUI"
    VersionUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    VersionUI.DisplayOrder = 997
    VersionUI.Parent = game.CoreGui
    
    local VersionFrame = Instance.new("Frame")
    VersionFrame.Name = "VersionFrame"
    VersionFrame.Size = UDim2.new(0.1, 0, 0.05, 0)
    VersionFrame.Position = UDim2.new(1, -VersionFrame.Size.X.Offset, 1, -VersionFrame.Size.Y.Offset)
    VersionFrame.BackgroundTransparency = 1
    VersionFrame.Parent = VersionUI
    
    local VersionText1 = Instance.new("TextLabel")
    VersionText1.Name = "VersionText1"
    VersionText1.Size = UDim2.new(1, 0, 0, 20)
    VersionText1.Position = UDim2.new(0, 0, 0, 0)
    VersionText1.BackgroundTransparency = 1
    VersionText1.Text = "SHub"
    VersionText1.TextColor3 = Color3.new(1, 1, 1)
    VersionText1.TextTransparency = 0.3
    VersionText1.Font = Enum.Font.SourceSans
    VersionText1.TextSize = 14
    VersionText1.Parent = VersionFrame
    
    local VersionText2 = Instance.new("TextLabel")
    VersionText2.Name = "VersionText2"
    VersionText2.Size = UDim2.new(1, 0, 0, 20)
    VersionText2.Position = UDim2.new(0, 0, 0, 20)
    VersionText2.BackgroundTransparency = 1
    VersionText2.Text = "v2.0.2"
    VersionText2.TextColor3 = Color3.new(1, 1, 1)
    VersionText2.TextTransparency = 0.3
    VersionText2.Font = Enum.Font.SourceSans
    VersionText2.TextSize = 14
    VersionText2.Parent = VersionFrame
    
    local NotificationUI = Instance.new("ScreenGui")
    NotificationUI.Name = "NotificationUI"
    NotificationUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    NotificationUI.DisplayOrder = 1002
    NotificationUI.Parent = game.CoreGui
    
    local notificationQueue = {}
    local notificationOffset = 0
    
    local function createNotification(message, duration)
        local NotificationFrame = Instance.new("Frame")
        NotificationFrame.Size = UDim2.new(0, 200, 0, 50)
        NotificationFrame.Position = UDim2.new(1, -210, 0, 10 + notificationOffset)
        NotificationFrame.BackgroundColor3 = Color3.new(0, 0, 0)
        NotificationFrame.BackgroundTransparency = 0.3
        NotificationFrame.BorderSizePixel = 0
        NotificationFrame.Parent = NotificationUI
        
        local NotificationCorner = Instance.new("UICorner")
        NotificationCorner.CornerRadius = UDim.new(0, 5)
        NotificationCorner.Parent = NotificationFrame
        
        local NotificationText = Instance.new("TextLabel")
        NotificationText.Size = UDim2.new(0.9, 0, 0.8, 0)
        NotificationText.Position = UDim2.new(0.05, 0, 0.1, 0)
        NotificationText.BackgroundTransparency = 1
        NotificationText.Text = message
        NotificationText.TextColor3 = Color3.new(1, 1, 1)
        NotificationText.TextScaled = true
        NotificationText.Font = Enum.Font.SourceSans
        NotificationText.Parent = NotificationFrame
        
        notificationOffset = notificationOffset + 60
        table.insert(notificationQueue, NotificationFrame)
        
        local TweenService = game:GetService("TweenService")
        local tweenIn = TweenService:Create(NotificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2})
        tweenIn:Play()
        wait(duration or 2)
        local tweenOut = TweenService:Create(NotificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1})
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            NotificationFrame:Destroy()
            notificationOffset = notificationOffset - 60
            table.remove(notificationQueue, 1)
            for i, frame in ipairs(notificationQueue) do
                local tweenMove = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, -210, 0, 10 + (i-1) * 60)})
                tweenMove:Play()
            end
        end)
    end
    
    local Camera = workspace.CurrentCamera
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    
    local settings = {
        enabled = true,
        teamCheck = true,
        skeletonColor = Color3.new(0.5, 0, 1),
        boxColor = Color3.new(1, 0, 0),
        tracerColor = Color3.new(1, 0, 0),
        nameColor = Color3.new(1, 1, 1),
        aimbotEnabled = false,
        aimPart = "Head",
        sensitivity = 0.2,
        fov = 100,
        showFOV = true,
        maxDistance = 500,
        smoothness = 0.1,
        bulletSpeed = 2000,
        prediction = true,
        lockOnKey = Enum.KeyCode.E,
        showTracers = true,
        showSkeleton = true,
        isBoxFilled = false,
        isBox3D = false,
        espEnabled = {}
    }
    
    local wtf = {}
    local lastPositions = {}
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Visible = settings.showFOV
    FOVCircle.Radius = settings.fov
    FOVCircle.Color = Color3.new(1, 1, 1)
    FOVCircle.Thickness = 1
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local isScriptActive = true
    local confirmationUI = nil
    local isConfirming = false
    local showTracers = settings.showTracers
    local showSkeleton = settings.showSkeleton
    local menuUI = nil
    local originalCameraCFrame = Camera.CFrame
    local highlightedPlayers = {}
    local espConnections = {}
    local isWallsTransparent = false
    local originalTransparencies = {}

    local function clearAllESP()
        for player, drawings in pairs(wtf) do
            if drawings.connection then drawings.connection:Disconnect() end
            if drawings.box then drawings.box:Remove() end
            if drawings.tracer then drawings.tracer:Remove() end
            if drawings.name then drawings.name:Remove() end
            if drawings.skeleton then
                for _, line in pairs(drawings.skeleton) do
                    if line then line:Remove() end
                end
            end
        end
        wtf = {}
        settings.lockOnTarget = nil
    end
    
    local function isValidEspTarget(player)
        if not player or player == LocalPlayer then return false end
        if settings.teamCheck and LocalPlayer.Team and player.Team and LocalPlayer.Team == player.Team then return false end
        local distance = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and (player.Character.HumanoidRootPart.Position - Camera.CFrame.Position).Magnitude or math.huge
        return distance <= settings.maxDistance
    end
    
    function canAttack(player)
        return isValidEspTarget(player)
    end
    
    local function updateESP()
        if not isScriptActive then return end
        
        for _, player in pairs(Players:GetPlayers()) do
            if isValidEspTarget(player) then
                if not wtf[player] and (player.Character or player.CharacterAdded:Wait()) then
                    esp(player)
                end
            end
        end
        
        if FOVCircle then
            FOVCircle.Visible = settings.showFOV
            FOVCircle.Radius = settings.fov
            FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        end
    end
    
    local function showConfirmation()
        if confirmationUI then return end
        confirmationUI = Instance.new("ScreenGui")
        confirmationUI.Name = "ConfirmationUI"
        confirmationUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        confirmationUI.DisplayOrder = 1000
        confirmationUI.Parent = game.CoreGui
        
        local confirmFrame = Instance.new("Frame")
        confirmFrame.Name = "ConfirmFrame"
        confirmFrame.Size = UDim2.new(0.3, 0, 0.15, 0)
        confirmFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        confirmFrame.BackgroundColor3 = Color3.new(0, 0, 0)
        confirmFrame.BackgroundTransparency = 0.7
        confirmFrame.BorderSizePixel = 0
        confirmFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        confirmFrame.Parent = confirmationUI
        
        local UICornerConfirm = Instance.new("UICorner")
        UICornerConfirm.CornerRadius = UDim.new(0.05, 0)
        UICornerConfirm.Parent = confirmFrame
        
        local UIStrokeConfirm = Instance.new("UIStroke")
        UIStrokeConfirm.Color = Color3.new(0, 0, 0)
        UIStrokeConfirm.Thickness = 2
        UIStrokeConfirm.Transparency = 0
        UIStrokeConfirm.Parent = confirmFrame
        
        local confirmText = Instance.new("TextLabel")
        confirmText.Name = "ConfirmText"
        confirmText.Size = UDim2.new(0.9, 0, 0.7, 0)
        confirmText.Position = UDim2.new(0.05, 0, 0.15, 0)
        confirmText.BackgroundTransparency = 1
        confirmText.Text = "Вы действительно хотите отключить скрипт?"
        confirmText.TextColor3 = Color3.new(1, 1, 1)
        confirmText.TextScaled = true
        confirmText.Font = Enum.Font.SourceSans
        confirmText.TextStrokeTransparency = 0.5
        confirmText.TextStrokeColor3 = Color3.new(0, 0, 0)
        confirmText.Parent = confirmFrame
        
        confirmFrame.Size = UDim2.new(0, 0, 0, 0)
        confirmFrame.BackgroundTransparency = 1
        confirmText.TextTransparency = 1
        
        local tweenIn = TweenService:Create(confirmFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0.3, 0, 0.15, 0), BackgroundTransparency = 0.7})
        local textTweenIn = TweenService:Create(confirmText, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0})
        tweenIn:Play()
        textTweenIn:Play()
        isConfirming = true
    end
    
    local function hideConfirmation()
        if not confirmationUI then return end
        local tweenOut = TweenService:Create(confirmationUI.ConfirmFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1})
        local textTweenOut = TweenService:Create(confirmationUI.ConfirmFrame.ConfirmText, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {TextTransparency = 1})
        tweenOut:Play()
        textTweenOut:Play()
        tweenOut.Completed:Wait()
        confirmationUI:Destroy()
        confirmationUI = nil
        isConfirming = false
    end
    
    local function disableScript()
        isScriptActive = false
        settings.enabled = false
        settings.aimbotEnabled = false
        clearAllESP()
        for _, conn in pairs(espConnections) do
            conn:Disconnect()
        end
        espConnections = {}
        if FOVCircle then FOVCircle:Remove() end
        if InfoUI then InfoUI:Destroy() end
        if VersionUI then VersionUI:Destroy() end
        if menuUI then menuUI:Destroy() end
        if confirmationUI then confirmationUI:Destroy() end
        if NotificationUI then NotificationUI:Destroy() end
        for player in pairs(highlightedPlayers) do
            applyHighlight(player, false)
        end
        for object, transparency in pairs(originalTransparencies) do
            if object and object.Parent then
                object.Transparency = transparency
            end
        end
        highlightedPlayers = {}
        print("Скрипт отключен.")
        UserInputService.InputBegan:Connect(function() end)
    end
    
    local function showMenu()
        if menuUI then
            menuUI:Destroy()
            menuUI = nil
            return
        end
        menuUI = Instance.new("ScreenGui")
        menuUI.Name = "MenuUI"
        menuUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        menuUI.DisplayOrder = 1001
        menuUI.Parent = game.CoreGui
        
        local menuFrame = Instance.new("Frame")
        menuFrame.Name = "MenuFrame"
        menuFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
        menuFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        menuFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        menuFrame.BackgroundTransparency = 0.1
        menuFrame.BorderSizePixel = 0
        menuFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        menuFrame.Parent = menuUI
        
        local UICornerMenu = Instance.new("UICorner")
        UICornerMenu.CornerRadius = UDim.new(0.05, 0)
        UICornerMenu.Parent = menuFrame
        
        local title = Instance.new("TextLabel")
        title.Name = "Title"
        title.Size = UDim2.new(1, 0, 0.15, 0)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.BackgroundTransparency = 1
        title.Text = "BINDS"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.TextScaled = true
        title.Font = Enum.Font.SourceSans
        title.TextStrokeTransparency = 0.5
        title.TextStrokeColor3 = Color3.new(0, 0, 0)
        title.Parent = menuFrame
        
        local bindList = Instance.new("Frame")
        bindList.Name = "BindList"
        bindList.Size = UDim2.new(0.9, 0, 0.7, 0)
        bindList.Position = UDim2.new(0.05, 0, 0.2, 0)
        bindList.BackgroundTransparency = 1
        bindList.Parent = menuFrame
        
        local bindFunctions = {
            {name = "Client off", key = "O", setting = nil},
            {name = "Aimbot", key = tostring(settings.lockOnKey):match("%a+$") or "E", setting = "lockOnKey"},
            {name = "Трейсеры", key = "I", setting = nil},
            {name = "Скелет", key = "U", setting = nil},
            {name = "Заполнить бокс", key = "F1", setting = nil},
            {name = "Меню с биндами", key = "F3", setting = nil},
            {name = "Подсвет игроков", key = "X", setting = nil},
            {name = "Просвет стены", key = "V", setting = nil}
        }
        
        local currentEditing = nil
        for i, bind in ipairs(bindFunctions) do
            local bindEntry = Instance.new("TextButton")
            bindEntry.Name = "BindEntry" .. i
            bindEntry.Size = UDim2.new(1, 0, 0, 30)
            bindEntry.Position = UDim2.new(0, 0, (i-1)/#bindFunctions, 0)
            bindEntry.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
            bindEntry.BackgroundTransparency = 0.2
            bindEntry.BorderSizePixel = 0
            bindEntry.Text = bind.name .. ": " .. bind.key
            bindEntry.TextColor3 = Color3.new(1, 1, 1)
            bindEntry.Font = Enum.Font.SourceSans
            bindEntry.TextSize = 14
            bindEntry.Parent = bindList
            
            bindEntry.MouseButton1Click:Connect(function()
                if currentEditing then return end
                currentEditing = bind
                bindEntry.Text = bind.name .. ": Нажмите новую клавишу"
                bindEntry.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
                local inputConnection = UserInputService.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        local newKey = tostring(input.KeyCode):match("%a+$") or tostring(input.KeyCode)
                        if #newKey == 1 and newKey:match("[A-Z]") then
                            bindEntry.Text = bind.name .. ": " .. newKey
                            if bind.setting then settings[bind.setting] = Enum.KeyCode[newKey] end
                            bind.key = newKey
                            bindEntry.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
                            currentEditing = nil
                            inputConnection:Disconnect()
                        else
                            bindEntry.Text = bind.name .. ": Неверный ввод"
                            wait(2)
                            bindEntry.Text = bind.name .. ": " .. bind.key
                            bindEntry.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
                            currentEditing = nil
                            inputConnection:Disconnect()
                        end
                    end
                end)
            end)
        end
        
        local closeButton = Instance.new("TextButton")
        closeButton.Name = "CloseButton"
        closeButton.Size = UDim2.new(0.3, 0, 0.1, 0)
        closeButton.Position = UDim2.new(0.35, 0, 0.9, 0)
        closeButton.BackgroundColor3 = Color3.new(0.5, 0, 0)
        closeButton.BackgroundTransparency = 0.2
        closeButton.BorderSizePixel = 0
        closeButton.Text = "Закрыть"
        closeButton.TextColor3 = Color3.new(1, 1, 1)
        closeButton.Font = Enum.Font.SourceSans
        closeButton.TextSize = 14
        closeButton.Parent = menuFrame
        
        closeButton.MouseButton1Click:Connect(function()
            menuUI:Destroy()
            menuUI = nil
        end)
    end
    
    local function clearESP(player)
        if wtf[player] then
            if wtf[player].connection then wtf[player].connection:Disconnect() end
            if wtf[player].box then wtf[player].box:Remove() end
            if wtf[player].tracer then wtf[player].tracer:Remove() end
            if wtf[player].name then wtf[player].name:Remove() end
            if wtf[player].skeleton then
                for _, line in pairs(wtf[player].skeleton) do
                    if line then line:Remove() end
                end
            end
            wtf[player] = nil
        end
    end
    
    function esp(player)
        if not settings.enabled or not isScriptActive or not isValidEspTarget(player) then return end
        
        clearESP(player)
        
        local Box = Drawing.new("Square")
        Box.Color = settings.boxColor
        Box.Thickness = 2
        Box.Transparency = 1
        Box.Filled = settings.isBoxFilled
        if Box.Filled then
            Box.Color = Color3.new(1, 0, 0)
            Box.Transparency = 0.5
        end
        
        local tracer = Drawing.new("Line")
        tracer.Color = settings.tracerColor
        tracer.Thickness = 1
        tracer.Transparency = 1
        
        local name = Drawing.new("Text")
        name.Text = player.Name
        name.Color = settings.nameColor
        name.Size = 12
        name.Center = true
        name.Outline = true
        name.Transparency = 1
        
        local skeleton = {}
        local skeletonParts = {"Head", "LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg", "Torso"}
        for _, partName in pairs(skeletonParts) do
            skeleton[partName] = Drawing.new("Line")
            skeleton[partName].Color = settings.skeletonColor
            skeleton[partName].Thickness = 2
            skeleton[partName].Transparency = 1
        end
        
        wtf[player] = {box = Box, tracer = tracer, name = name, skeleton = skeleton, isESPActive = true}
        
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not isScriptActive or not player or not isValidEspTarget(player) then
                clearESP(player)
                if connection then connection:Disconnect() end
                return
            end
            
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart")
            local hrpPosition, onScreen = Camera:WorldToViewportPoint(humanoidRootPart.Position)
            local espCameraCFrame = settings.aimbotEnabled and originalCameraCFrame or Camera.CFrame
            
            if onScreen then
                local parts = character:GetChildren()
                local minX, maxX, minY, maxY = math.huge, -math.huge, math.huge, -math.huge
                local allPartsOnScreen = true
                
                for _, part in pairs(parts) do
                    if part:IsA("BasePart") then
                        local partPos, isOnScreen = Camera:WorldToViewportPoint(part.Position)
                        if isOnScreen then
                            minX = math.min(minX, partPos.X)
                            maxX = math.max(maxX, partPos.X)
                            minY = math.min(minY, partPos.Y)
                            maxY = math.max(maxY, partPos.Y)
                        else
                            allPartsOnScreen = false
                        end
                    end
                end
                
                if allPartsOnScreen then
                    local boxWidth = maxX - minX
                    local boxHeight = maxY - minY
                    Box.Size = Vector2.new(boxWidth, boxHeight)
                    Box.Position = Vector2.new(minX, minY)
                    Box.Visible = true
                    if settings.isBoxFilled then
                        Box.Filled = true
                        Box.Color = Color3.new(1, 0, 0)
                        Box.Transparency = 0.5
                    else
                        Box.Filled = false
                        Box.Color = settings.boxColor
                        Box.Transparency = 1
                    end
                    
                    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    tracer.From = screenCenter
                    tracer.To = Vector2.new(hrpPosition.X, hrpPosition.Y)
                    tracer.Visible = showTracers and onScreen
                    
                    name.Position = Vector2.new(Box.Position.X + Box.Size.X / 2, Box.Position.Y - 20)
                    name.Visible = onScreen
                    
                    for _, partName in pairs(skeletonParts) do
                        local part = character:FindFirstChild(partName)
                        if part and humanoidRootPart then
                            local partPos, isOnScreen = Camera:WorldToViewportPoint(part.Position)
                            if isOnScreen then
                                skeleton[partName].From = Vector2.new(partPos.X, partPos.Y)
                                skeleton[partName].To = Vector2.new(hrpPosition.X, hrpPosition.Y)
                                skeleton[partName].Visible = showSkeleton and onScreen
                            else
                                skeleton[partName].Visible = false
                            end
                        else
                            skeleton[partName].Visible = false
                        end
                    end
                else
                    Box.Visible = false
                    tracer.Visible = false
                    name.Visible = false
                    for _, line in pairs(skeleton) do
                        line.Visible = false
                    end
                end
            else
                Box.Visible = false
                tracer.Visible = false
                name.Visible = false
                for _, line in pairs(skeleton) do
                    line.Visible = false
                end
            end
        end)
        wtf[player].connection = connection
    end
    
    function remove(player)
        clearESP(player)
        if settings.lockOnTarget == player then settings.lockOnTarget = nil end
        applyHighlight(player, false)
        highlightedPlayers[player] = nil
    end
    
    function add(player)
        if not player or player == LocalPlayer then return end
        
        local function monitorPlayer()
            if not isScriptActive then return end
            if isValidEspTarget(player) then
                if not wtf[player] then
                    esp(player)
                end
                if highlightedPlayers[player] then 
                    applyHighlight(player, true) 
                end
            end
        end
        
        local charAddedConn = player.CharacterAdded:Connect(function(character)
            monitorPlayer()
            local humanoid = character:WaitForChild("Humanoid", 5)
            if humanoid then
                humanoid.Died:Connect(function()
                    task.wait(0.1)
                    monitorPlayer()
                end)
            end
        end)
        
        local charRemovingConn = player.CharacterRemoving:Connect(function()
            clearESP(player)
        end)
        
        local teamConn = player:GetPropertyChangedSignal("Team"):Connect(monitorPlayer)
        
        local ancestryConn = player.AncestryChanged:Connect(function()
            if not player:IsDescendantOf(game) then
                if charAddedConn then charAddedConn:Disconnect() end
                if charRemovingConn then charRemovingConn:Disconnect() end
                if teamConn then teamConn:Disconnect() end
                if ancestryConn then ancestryConn:Disconnect() end
                remove(player)
            end
        end)
        
        espConnections[player] = {
            charAdded = charAddedConn,
            charRemoving = charRemovingConn,
            team = teamConn,
            ancestry = ancestryConn
        }
        
        if player.Character then
            monitorPlayer()
        end
    end
    
    function getTargetVelocity(player)
        if not player.Character or not isScriptActive then return Vector3.new() end
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return Vector3.new() end
        lastPositions[player] = lastPositions[player] or {}
        table.insert(lastPositions[player], {position = hrp.Position, time = tick()})
        while #lastPositions[player] > 5 do table.remove(lastPositions[player], 1) end
        if #lastPositions[player] >= 2 then
            local oldest = lastPositions[player][1]
            local newest = lastPositions[player][#lastPositions[player]]
            local deltaTime = newest.time - oldest.time
            if deltaTime > 0 then return (newest.position - oldest.position) / deltaTime end
        end
        return hrp.Velocity
    end
    
    function GetClosestInFOV()
        if not isScriptActive then return nil end
        local closestPlayer = nil
        local smallestAngle = math.huge
        local centerScreen = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        
        for _, player in pairs(Players:GetPlayers()) do
            if isValidEspTarget(player) and player.Character and player.Character:FindFirstChild(settings.aimPart) then
                local targetPos = player.Character[settings.aimPart].Position
                local screenPoint, onScreen = Camera:WorldToViewportPoint(targetPos)
                if onScreen then
                    local screenPos = Vector2.new(screenPoint.X, screenPoint.Y)
                    local angle = (screenPos - centerScreen).Magnitude
                    if angle <= settings.fov and angle < smallestAngle then
                        smallestAngle = angle
                        closestPlayer = player
                    end
                end
            end
        end
        return closestPlayer
    end
    
    local function isTargetValid(target)
        if not target or not target.Parent or not target.Character or not target.Character:FindFirstChild(settings.aimPart) then return false end
        return isValidEspTarget(target)
    end
    
    local function applyHighlight(player, enable)
        if not player.Character then return end
        if enable then
            if not player.Character:FindFirstChild("PlayerHighlight") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "PlayerHighlight"
                highlight.FillColor = Color3.fromRGB(0, 191, 255)
                highlight.FillTransparency = 0.6
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.OutlineTransparency = 0
                highlight.Parent = player.Character
            end
        else
            local highlight = player.Character:FindFirstChild("PlayerHighlight")
            if highlight then highlight:Destroy() end
        end
    end

    local function toggleWallTransparency()
        if not isScriptActive then return end
        isWallsTransparent = not isWallsTransparent
        
        for _, object in pairs(workspace:GetDescendants()) do
            if object:IsA("BasePart") and not object.Parent:FindFirstChild("Humanoid") then
                if isWallsTransparent then
                    if not originalTransparencies[object] then
                        originalTransparencies[object] = object.Transparency
                    end
                    object.Transparency = 0.8
                else
                    local originalTransparency = originalTransparencies[object] or 0
                    object.Transparency = originalTransparency
                    originalTransparencies[object] = nil
                end
            end
        end
        
        createNotification("WallHack: " .. (isWallsTransparent and "ON" or "OFF"))
    end
    
    local inputConnection = UserInputService.InputBegan:Connect(function(Input)
        if not isScriptActive then return end
        if Input.KeyCode == Enum.KeyCode.O then
            if not isConfirming then
                showConfirmation()
            else
                hideConfirmation()
                disableScript()
                createNotification("Script: OFF")
            end
        elseif Input.KeyCode == settings.lockOnKey then
            settings.aimbotEnabled = not settings.aimbotEnabled
            if settings.aimbotEnabled and not settings.lockOnTarget then
                settings.lockOnTarget = GetClosestInFOV()
                originalCameraCFrame = Camera.CFrame
                createNotification("Aimbot: ON")
            elseif not settings.aimbotEnabled then
                settings.lockOnTarget = nil
                createNotification("Aimbot: OFF")
            end
        elseif Input.KeyCode == Enum.KeyCode.V then
            toggleWallTransparency()
        elseif Input.KeyCode == Enum.KeyCode.I then
            showTracers = not showTracers
            settings.showTracers = showTracers
            for _, data in pairs(wtf) do
                if data.tracer then data.tracer.Visible = showTracers end
            end
            createNotification("Tracers: " .. (showTracers and "ON" or "OFF"))
        elseif Input.KeyCode == Enum.KeyCode.U then
            showSkeleton = not showSkeleton
            settings.showSkeleton = showSkeleton
            for _, data in pairs(wtf) do
                if data.skeleton then
                    for _, line in pairs(data.skeleton) do
                        if line then line.Visible = showSkeleton end
                    end
                end
            end
            createNotification("Skeleton: " .. (showSkeleton and "ON" or "OFF"))
        elseif Input.KeyCode == Enum.KeyCode.F1 then
            settings.isBoxFilled = not settings.isBoxFilled
            for _, data in pairs(wtf) do
                if data.box then
                    data.box.Filled = settings.isBoxFilled
                    if settings.isBoxFilled then
                        data.box.Color = Color3.new(1, 0, 0)
                        data.box.Transparency = 0.5
                    else
                        data.box.Color = settings.boxColor
                        data.box.Transparency = 1
                    end
                end
            end
            createNotification("Box Filled: " .. (settings.isBoxFilled and "ON" or "OFF"))
        elseif Input.KeyCode == Enum.KeyCode.F2 then
            settings.isBox3D = not settings.isBox3D
            createNotification("Test: " .. (settings.isBox3D and "ON" or "OFF"))
        elseif Input.KeyCode == Enum.KeyCode.F3 then
            showMenu()
            createNotification("Binds Menu: " .. (menuUI and "ON" or "OFF"))
        elseif Input.KeyCode == Enum.KeyCode.X then
            local newState = not next(highlightedPlayers)
            for _, player in pairs(Players:GetPlayers()) do
                if isValidEspTarget(player) then
                    applyHighlight(player, newState)
                    highlightedPlayers[player] = newState or nil
                    settings.espEnabled[player] = newState
                    if newState and player.Character then
                        esp(player)
                    elseif not newState then
                        remove(player)
                    end
                end
            end
            createNotification("Highlight: " .. (newState and "ON" or "OFF"))
        end
    end)
    
    Players.PlayerAdded:Connect(function(player)
        if isScriptActive then add(player) end
    end)
    
    Players.PlayerRemoving:Connect(function(player)
        remove(player)
    end)
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then 
            add(player)
        end
    end
    
    RunService.RenderStepped:Connect(function()
        if not isScriptActive then return end
        updateESP()
        
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        FOVCircle.Radius = settings.fov
        FOVCircle.Visible = settings.showFOV
        
        if settings.aimbotEnabled then
            if settings.lockOnTarget then
                if not isTargetValid(settings.lockOnTarget) then
                    settings.lockOnTarget = nil
                else
                    local Target = settings.lockOnTarget
                    if Target and Target.Character and Target.Character:FindFirstChild(settings.aimPart) then
                        local targetPosition = Target.Character[settings.aimPart].Position
                        local distance = (targetPosition - Camera.CFrame.Position).Magnitude
                        if distance <= settings.maxDistance then
                            if settings.prediction then
                                local velocity = getTargetVelocity(Target)
                                local timeToHit = distance / settings.bulletSpeed
                                targetPosition = targetPosition + (velocity * timeToHit)
                            end
                            if settings.smoothness > 0 then
                                local targetCFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
                                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, 1 - settings.smoothness)
                            else
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
                            end
                        end
                    end
                end
            elseif settings.aimbotEnabled then
                settings.lockOnTarget = GetClosestInFOV()
                if settings.lockOnTarget then originalCameraCFrame = Camera.CFrame end
            end
        else
            originalCameraCFrame = Camera.CFrame
        end
    end)
    
    spawn(function()
        while isScriptActive do
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and not espConnections[player] then
                    add(player)
                end
            end
            task.wait(1)
        end
    end)
end

function loadSHubRage()
    print("SHub_Rage not implemented in this version")
end
