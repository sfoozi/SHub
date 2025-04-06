local ALLOWED_PLACE_ID = 301549746
if game.PlaceId ~= ALLOWED_PLACE_ID then
    game.Players.LocalPlayer:Kick("Unsupported place")
    return
end

local ALLOWED_USERS = {
    "SewaDrago",
    "test_levels"
}

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
WelcomeFrame.Size = UDim2.new(0.25, 0, 0.12, 0)
WelcomeFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
WelcomeFrame.BackgroundColor3 = Color3.new(0, 0, 0)
WelcomeFrame.BackgroundTransparency = 0.7
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
WelcomeFrame.Parent = WelcomeUI

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.05, 0)
UICorner.Parent = WelcomeFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.new(0, 0, 0)
UIStroke.Thickness = 2
UIStroke.Transparency = 0
UIStroke.Parent = WelcomeFrame

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Name = "WelcomeText"
WelcomeText.Size = UDim2.new(0.9, 0, 0.7, 0)
WelcomeText.Position = UDim2.new(0.05, 0, 0.15, 0)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome, " .. LocalPlayer.Name
WelcomeText.TextColor3 = Color3.new(1, 1, 1)
WelcomeText.TextScaled = true
WelcomeText.Font = Enum.Font.GothamBold
WelcomeText.TextStrokeTransparency = 0.5
WelcomeText.TextStrokeColor3 = Color3.new(0, 0, 0)
WelcomeText.Parent = WelcomeFrame

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
InfoText1.Font = Enum.Font.Gotham
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
InfoText2.Font = Enum.Font.Gotham
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
InfoText3.Font = Enum.Font.Gotham
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
VersionText1.Font = Enum.Font.Gotham
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
VersionText2.Font = Enum.Font.Gotham
VersionText2.TextSize = 14
VersionText2.Parent = VersionFrame

WelcomeFrame.Size = UDim2.new(0, 0, 0, 0)
WelcomeFrame.BackgroundTransparency = 1
WelcomeText.TextTransparency = 1

local function animateWelcome()
    wait(1.5)
    
    local tweenIn = game:GetService("TweenService"):Create(
        WelcomeFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0.25, 0, 0.12, 0),
            BackgroundTransparency = 0.7
        }
    )
    
    local textTweenIn = game:GetService("TweenService"):Create(
        WelcomeText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {
            TextTransparency = 0
        }
    )
    
    tweenIn:Play()
    textTweenIn:Play()
    
    wait(3)
    
    local tweenOut = game:GetService("TweenService"):Create(
        WelcomeFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
        {
            Size = UDim2.new(0.1, 0, 0.05, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.45, 0, 0.475, 0)
        }
    )
    
    local textTweenOut = game:GetService("TweenService"):Create(
        WelcomeText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
        {
            TextTransparency = 1
        }
    )
    
    tweenOut:Play()
    textTweenOut:Play()
    
    tweenOut.Completed:Wait()
    WelcomeUI:Destroy()
    
    mainScript()
end

coroutine.wrap(animateWelcome)()

function mainScript()
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
        bulletSpeed = 600,
        prediction = true,
        lockOnKey = Enum.KeyCode.E,
        speedBoostKey = Enum.KeyCode.V,
        speedMultiplier = 2,
        reloadKey = Enum.KeyCode.P,
        lockOnTarget = nil,
        showTracers = true,
        showSkeleton = true,
        isBoxFilled = false,
        isBox3D = false
    }

    local wtf = {}
    local isSpeedBoosted = false
    local originalWalkSpeed = 16
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

    local function clearAllESP()
        for player, drawings in pairs(wtf) do
            if drawings.connection then
                drawings.connection:Disconnect()
            end
            if drawings.box then
                drawings.box:Remove()
            end
            if drawings.tracer then
                drawings.tracer:Remove()
            end
            if drawings.name then
                drawings.name:Remove()
            end
            if drawings.skeleton then
                for _, line in pairs(drawings.skeleton) do
                    if line then
                        line:Remove()
                    end
                end
            end
        end
        wtf = {}
        settings.lockOnTarget = nil
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
        confirmText.Font = Enum.Font.GothamBold
        confirmText.TextStrokeTransparency = 0.5
        confirmText.TextStrokeColor3 = Color3.new(0, 0, 0)
        confirmText.Parent = confirmFrame

        confirmFrame.Size = UDim2.new(0, 0, 0, 0)
        confirmFrame.BackgroundTransparency = 1
        confirmText.TextTransparency = 1

        local tweenIn = TweenService:Create(
            confirmFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {
                Size = UDim2.new(0.3, 0, 0.15, 0),
                BackgroundTransparency = 0.7
            }
        )

        local textTweenIn = TweenService:Create(
            confirmText,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {
                TextTransparency = 0
            }
        )

        tweenIn:Play()
        textTweenIn:Play()

        isConfirming = true
    end

    local function hideConfirmation()
        if not confirmationUI then return end

        local tweenOut = TweenService:Create(
            confirmationUI.ConfirmFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
            {
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1
            }
        )

        local textTweenOut = TweenService:Create(
            confirmationUI.ConfirmFrame.ConfirmText,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
            {
                TextTransparency = 1
            }
        )

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
        if FOVCircle then
            FOVCircle:Remove()
        end
        if InfoUI then
            InfoUI:Destroy()
        end
        if VersionUI then
            VersionUI:Destroy()
        end
        if menuUI then
            menuUI:Destroy()
        end
        if confirmationUI then
            confirmationUI:Destroy()
        end
        
        for player in pairs(highlightedPlayers) do
            applyHighlight(player, false)
        end
        highlightedPlayers = {}
        
        print("Скрипт отключен.")
        UserInputService.InputBegan:Connect(function() end)
    end

    local function reloadScript()
        clearAllESP()
        if FOVCircle then
            FOVCircle:Remove()
        end
        FOVCircle = Drawing.new("Circle")
        FOVCircle.Visible = settings.showFOV and isScriptActive
        FOVCircle.Radius = settings.fov
        FOVCircle.Color = Color3.new(1, 1, 1)
        FOVCircle.Thickness = 1
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        for _, player in pairs(Players:GetPlayers()) do
            add(player)
        end
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
        title.Font = Enum.Font.GothamBold
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
            {name = "Перезагрузка", key = tostring(settings.reloadKey):match("%a+$") or "P", setting = "reloadKey"},
            {name = "Трейсеры", key = "I", setting = nil},
            {name = "Скелет", key = "U", setting = nil},
            {name = "Заполнить бокс", key = "F1", setting = nil},
            {name = "Большой бокс", key = "F2", setting = nil},
            {name = "Меню с биндами", key = "F3", setting = nil},
            {name = "Highlight", key = "X", setting = nil}
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
            bindEntry.Font = Enum.Font.Gotham
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
                            if bind.setting then
                                settings[bind.setting] = Enum.KeyCode[newKey]
                            end
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
        closeButton.Font = Enum.Font.GothamBold
        closeButton.TextSize = 14
        closeButton.Parent = menuFrame

        closeButton.MouseButton1Click:Connect(function()
            menuUI:Destroy()
            menuUI = nil
        end)
    end

    function canAttack(player)
        if not settings.teamCheck or not isScriptActive then return false end
        if not LocalPlayer.Team or not player.Team then return false end
        return LocalPlayer.Team ~= player.Team
    end

    function esp(player)
        if not settings.enabled or not isScriptActive then return end
        if not canAttack(player) then return end
        if player == LocalPlayer then return end

        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local distance = (humanoidRootPart.Position - Camera.CFrame.Position).Magnitude
        if distance > settings.maxDistance then return end

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

        local wasVisible = false
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not isScriptActive or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                Box.Visible = false
                tracer.Visible = false
                name.Visible = false
                for _, line in pairs(skeleton) do
                    line.Visible = false
                end
                wtf[player].isESPActive = false
                if settings.lockOnTarget == player and settings.aimbotEnabled then
                    settings.lockOnTarget = nil
                end
                remove(player)
                return
            end

            local espCameraCFrame = settings.aimbotEnabled and originalCameraCFrame or Camera.CFrame
            local hrpPosition, onScreen = Camera:WorldToViewportPoint(humanoidRootPart.Position)
            local distance = (humanoidRootPart.Position - espCameraCFrame.Position).Magnitude
            
            if distance <= settings.maxDistance then
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
                    if settings.lockOnTarget == player and settings.aimbotEnabled then
                        settings.lockOnTarget = nil
                    end
                end

                if not wasVisible and onScreen then
                    wasVisible = true
                elseif wasVisible and not onScreen then
                    wasVisible = false
                    Box.Visible = false
                    tracer.Visible = false
                    name.Visible = false
                    for _, line in pairs(skeleton) do
                        line.Visible = false
                    end
                    if settings.lockOnTarget == player and settings.aimbotEnabled then
                        settings.lockOnTarget = nil
                    end
                end
            else
                if wasVisible then
                    wasVisible = false
                    Box.Visible = false
                    tracer.Visible = false
                    name.Visible = false
                    for _, line in pairs(skeleton) do
                        line.Visible = false
                    end
                    if settings.lockOnTarget == player and settings.aimbotEnabled then
                        settings.lockOnTarget = nil
                    end
                end
            end
        end)

        wtf[player].connection = connection
    end

    function remove(player)
        if wtf[player] then
            if wtf[player].connection then
                wtf[player].connection:Disconnect()
            end
            if wtf[player].box then
                wtf[player].box:Remove()
            end
            if wtf[player].tracer then
                wtf[player].tracer:Remove()
            end
            if wtf[player].name then
                wtf[player].name:Remove()
            end
            if wtf[player].skeleton then
                for _, line in pairs(wtf[player].skeleton) do
                    if line then
                        line:Remove()
                    end
                end
            end
            wtf[player] = nil
            
            if settings.lockOnTarget == player and settings.aimbotEnabled and isScriptActive then
                settings.lockOnTarget = nil
            end
        end
        
        applyHighlight(player, false)
        highlightedPlayers[player] = nil
    end

    function add(player)
        player.CharacterAdded:Connect(function(character)
            if isScriptActive then
                esp(player)
                if highlightedPlayers[player] then
                    applyHighlight(player, true)
                end
            end
        end)
        player.CharacterRemoving:Connect(function(character)
            remove(player)
        end)
        player:GetPropertyChangedSignal("Team"):Connect(function()
            if not canAttack(player) then
                remove(player)
            elseif isScriptActive then
                esp(player)
            end
        end)
        if player.Character and isScriptActive then
            esp(player)
            if highlightedPlayers[player] then
                applyHighlight(player, true)
            end
        end
    end

    function getTargetVelocity(player)
        if not player.Character or not isScriptActive then return Vector3.new() end
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return Vector3.new() end
        lastPositions[player] = lastPositions[player] or {}
        table.insert(lastPositions[player], {position = hrp.Position, time = tick()})
        while #lastPositions[player] > 5 do
            table.remove(lastPositions[player], 1)
        end
        if #lastPositions[player] >= 2 then
            local oldest = lastPositions[player][1]
            local newest = lastPositions[player][#lastPositions[player]]
            local deltaTime = newest.time - oldest.time
            if deltaTime > 0 then
                return (newest.position - oldest.position) / deltaTime
            end
        end
        return hrp.Velocity
    end

    function GetClosestInFOV()
        if not isScriptActive then return nil end
        local closestPlayer = nil
        local smallestAngle = math.huge
        local centerScreen = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        local cameraPos = Camera.CFrame.Position
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and canAttack(player) and player.Character and player.Character:FindFirstChild(settings.aimPart) then
                local targetPos = player.Character[settings.aimPart].Position
                local distance = (targetPos - cameraPos).Magnitude
                if distance <= settings.maxDistance then
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
        end
        return closestPlayer
    end

    local function isTargetValid(target)
        if not target or not target.Parent or not target.Character or not target.Character:FindFirstChild(settings.aimPart) then
            return false
        end
        local targetPos = target.Character[settings.aimPart].Position
        local distance = (targetPos - Camera.CFrame.Position).Magnitude
        return distance <= settings.maxDistance and wtf[target] and wtf[target].isESPActive
    end

    local function toggleSpeedBoost()
        if not isScriptActive or not LocalPlayer.Character then return end
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        isSpeedBoosted = not isSpeedBoosted
        if isSpeedBoosted then
            originalWalkSpeed = humanoid.WalkSpeed
            humanoid.WalkSpeed = originalWalkSpeed * settings.speedMultiplier
        else
            humanoid.WalkSpeed = originalWalkSpeed
        end
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
            if highlight then
                highlight:Destroy()
            end
        end
    end

    local inputConnection = UserInputService.InputBegan:Connect(function(Input)
        if not isScriptActive then return end
        if Input.KeyCode == Enum.KeyCode.O then
            if not isConfirming then
                showConfirmation()
            else
                hideConfirmation()
                disableScript()
            end
        elseif Input.KeyCode == settings.lockOnKey then
            settings.aimbotEnabled = not settings.aimbotEnabled
            if settings.aimbotEnabled and not settings.lockOnTarget then
                settings.lockOnTarget = GetClosestInFOV()
                originalCameraCFrame = Camera.CFrame
            elseif not settings.aimbotEnabled then
                settings.lockOnTarget = nil
            end
        elseif Input.KeyCode == settings.speedBoostKey then
            toggleSpeedBoost()
        elseif Input.KeyCode == settings.reloadKey then
            reloadScript()
        elseif Input.KeyCode == Enum.KeyCode.I then
            showTracers = not showTracers
            for _, data in pairs(wtf) do
                if data.tracer then
                    data.tracer.Visible = showTracers
                end
            end
        elseif Input.KeyCode == Enum.KeyCode.U then
            showSkeleton = not showSkeleton
            for _, data in pairs(wtf) do
                if data.skeleton then
                    for _, line in pairs(data.skeleton) do
                        if line then
                            line.Visible = showSkeleton
                        end
                    end
                end
            end
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
        elseif Input.KeyCode == Enum.KeyCode.F2 then
            settings.isBox3D = not settings.isBox3D
        elseif Input.KeyCode == Enum.KeyCode.F3 then
            showMenu()
        elseif Input.KeyCode == Enum.KeyCode.F4 then
            changeHandsAndViewModelMaterial()
        elseif Input.KeyCode == Enum.KeyCode.X then
            local newState = not next(highlightedPlayers)
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and canAttack(player) then
                    applyHighlight(player, newState)
                    highlightedPlayers[player] = newState or nil
                end
            end
        end
    end)

    local function changeHandsAndViewModelMaterial()
        if not isScriptActive or not LocalPlayer.Character then return end

        local character = LocalPlayer.Character
        local arms = {
            character:FindFirstChild("RightHand"),
            character:FindFirstChild("LeftHand"),
            character:FindFirstChild("RightLowerArm"),
            character:FindFirstChild("LeftLowerArm")
        }

        for _, arm in pairs(arms) do
            if arm and arm:IsA("BasePart") then
                arm.Material = Enum.Material.Glass
                arm.Color = Color3.new(1, 1, 1)
                arm.Transparency = 0.3
            end
        end

        local viewModel = workspace:FindFirstChild("ViewModel")
        if viewModel then
            for _, part in pairs(viewModel:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.Glass
                    part.Color = Color3.new(1, 1, 1)
                    part.Transparency = 0.3
                end
            end
        end
    end

    LocalPlayer.CharacterAdded:Connect(function(character)
        character:WaitForChild("Humanoid")
        if isSpeedBoosted and isScriptActive then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = originalWalkSpeed * settings.speedMultiplier
            end
        end
    end)

    Players.PlayerAdded:Connect(function(player)
        if isScriptActive then
            add(player)
        end
    end)
    for _, player in pairs(Players:GetPlayers()) do
        add(player)
    end

    Players.PlayerRemoving:Connect(function(player)
        remove(player)
    end)

    RunService.RenderStepped:Connect(function()
        if not isScriptActive then return end
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
                if settings.lockOnTarget then
                    originalCameraCFrame = Camera.CFrame
                end
            end
        else
            originalCameraCFrame = Camera.CFrame
        end
    end)
end
