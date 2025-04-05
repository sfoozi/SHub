local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Настройки
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
    bulletSpeed = 700,
    prediction = true,
    lockOnKey = Enum.KeyCode.Z,
    speedBoostKey = Enum.KeyCode.V,
    speedMultiplier = 2,
    lockOnTarget = nil
}

-- Переменные
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

-- Функции ESP
function canAttack(player)
    if not settings.teamCheck then return true end
    if not LocalPlayer.Team or not player.Team then return true end
    return LocalPlayer.Team ~= player.Team
end

function esp(player)
    if not settings.enabled then return end
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
    Box.Filled = false

    local tracer = Drawing.new("Line")
    tracer.Color = settings.tracerColor
    tracer.Thickness = 1
    tracer.Transparency = 1

    local name = Drawing.new("Text")
    name.Text = player.Name
    name.Color = settings.nameColor
    name.Size = 20
    name.Center = true
    name.Outline = true
    name.Transparency = 1

    local skeleton = {}
    for _, partName in pairs({"Head", "LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg"}) do
        skeleton[partName] = Drawing.new("Line")
        skeleton[partName].Color = settings.skeletonColor
        skeleton[partName].Thickness = 2
        skeleton[partName].Transparency = 1
    end

    wtf[player] = {box = Box, tracer = tracer, name = name, skeleton = skeleton}

    local wasVisible = false
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            Box.Visible = false
            tracer.Visible = false
            name.Visible = false
            for _, line in pairs(skeleton) do
                line.Visible = false
            end
            return
        end

        local hrpPosition, onScreen = Camera:WorldToViewportPoint(humanoidRootPart.Position)
        if onScreen then
            local head = character:FindFirstChild("Head")
            local leftArm = character:FindFirstChild("LeftUpperArm")
            local rightArm = character:FindFirstChild("RightUpperArm")
            local leftLeg = character:FindFirstChild("LeftUpperLeg")
            local rightLeg = character:FindFirstChild("RightUpperLeg")

            if head and leftArm and rightArm and leftLeg and rightLeg then
                local headPos = Camera:WorldToViewportPoint(head.Position)
                local leftArmPos = Camera:WorldToViewportPoint(leftArm.Position)
                local rightArmPos = Camera:WorldToViewportPoint(rightArm.Position)
                local leftLegPos = Camera:WorldToViewportPoint(leftLeg.Position)
                local rightLegPos = Camera:WorldToViewportPoint(rightLeg.Position)

                local minX = math.min(headPos.X, leftArmPos.X, rightArmPos.X, leftLegPos.X, rightLegPos.X)
                local maxX = math.max(headPos.X, leftArmPos.X, rightArmPos.X, leftLegPos.X, rightLegPos.X)
                local minY = math.min(headPos.Y, leftArmPos.Y, rightArmPos.Y, leftLegPos.Y, rightLegPos.Y)
                local maxY = math.max(headPos.Y, leftArmPos.Y, rightArmPos.Y, leftLegPos.Y, rightLegPos.Y)

                local boxWidth = maxX - minX
                local boxHeight = maxY - minY

                Box.Size = Vector2.new(boxWidth, boxHeight)
                Box.Position = Vector2.new(minX, minY)

                tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                tracer.To = Vector2.new(hrpPosition.X, hrpPosition.Y)

                name.Position = Vector2.new(minX + boxWidth / 2, minY - 20)

                skeleton.Head.From = Vector2.new(headPos.X, headPos.Y)
                skeleton.Head.To = Vector2.new(hrpPosition.X, hrpPosition.Y)

                skeleton.LeftUpperArm.From = Vector2.new(leftArmPos.X, leftArmPos.Y)
                skeleton.LeftUpperArm.To = Vector2.new(hrpPosition.X, hrpPosition.Y)

                skeleton.RightUpperArm.From = Vector2.new(rightArmPos.X, rightArmPos.Y)
                skeleton.RightUpperArm.To = Vector2.new(hrpPosition.X, hrpPosition.Y)

                skeleton.LeftUpperLeg.From = Vector2.new(leftLegPos.X, leftLegPos.Y)
                skeleton.LeftUpperLeg.To = Vector2.new(hrpPosition.X, hrpPosition.Y)

                skeleton.RightUpperLeg.From = Vector2.new(rightLegPos.X, rightLegPos.Y)
                skeleton.RightUpperLeg.To = Vector2.new(hrpPosition.X, hrpPosition.Y)
            end

            if not wasVisible then
                Box.Visible = true
                tracer.Visible = true
                name.Visible = true
                for _, line in pairs(skeleton) do
                    line.Visible = true
                end
                wasVisible = true
            end
        else
            if wasVisible then
                Box.Visible = false
                tracer.Visible = false
                name.Visible = false
                for _, line in pairs(skeleton) do
                    line.Visible = false
                end
                wasVisible = false
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
        wtf[player].box:Remove()
        wtf[player].tracer:Remove()
        wtf[player].name:Remove()
        for _, line in pairs(wtf[player].skeleton) do
            line:Remove()
        end
        wtf[player] = nil
    end
end

function add(player)
    player.CharacterAdded:Connect(function(character)
        esp(player)
    end)
    player.CharacterRemoving:Connect(function(character)
        remove(player)
    end)
    player:GetPropertyChangedSignal("Team"):Connect(function()
        if not canAttack(player) then
            remove(player)
        else
            esp(player)
        end
    end)
    if player.Character then
        esp(player)
    end
end

-- Функции аимбота
function getTargetVelocity(player)
    if not player.Character then return Vector3.new() end
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return Vector3.new() end
    
    lastPositions[player] = lastPositions[player] or {}
    table.insert(lastPositions[player], {
        position = hrp.Position,
        time = tick()
    })
    
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

function GetClosestToCrosshair()
    if settings.lockOnTarget and settings.lockOnTarget.Character and settings.lockOnTarget.Character:FindFirstChild(settings.aimPart) then
        local targetPos = settings.lockOnTarget.Character[settings.aimPart].Position
        local screenPoint = Camera:WorldToScreenPoint(targetPos)
        local mousePos = UserInputService:GetMouseLocation()
        local angle = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
        
        if angle <= settings.fov then
            return settings.lockOnTarget
        end
    end
    
    local closestPlayer = nil
    local smallestAngle = math.huge
    local mousePos = UserInputService:GetMouseLocation()
    local cameraPos = Camera.CFrame.Position

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and canAttack(player) then
            if player.Character and player.Character:FindFirstChild(settings.aimPart) then
                local targetPos = player.Character[settings.aimPart].Position
                local distance = (targetPos - cameraPos).Magnitude
                
                if distance <= settings.maxDistance then
                    local screenPoint = Camera:WorldToScreenPoint(targetPos)
                    if screenPoint then
                        local angle = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
                        
                        if angle <= settings.fov then
                            if angle < smallestAngle then
                                smallestAngle = angle
                                closestPlayer = player
                            end
                        end
                    end
                end
            end
        end
    end
    
    settings.lockOnTarget = closestPlayer
    return closestPlayer
end

-- Функция ускорения
local function toggleSpeedBoost()
    if not LocalPlayer.Character then return end
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

-- Обработчики событий
UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == settings.lockOnKey then
        settings.aimbotEnabled = not settings.aimbotEnabled
        if not settings.aimbotEnabled then
            settings.lockOnTarget = nil
        end
    elseif Input.KeyCode == settings.speedBoostKey then
        toggleSpeedBoost()
    end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    if isSpeedBoosted then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = originalWalkSpeed * settings.speedMultiplier
        end
    end
end)

-- Инициализация
Players.PlayerAdded:Connect(add)
for _, player in pairs(Players:GetPlayers()) do
    add(player)
end

Players.PlayerRemoving:Connect(function(player)
    remove(player)
    if settings.lockOnTarget == player then
        settings.lockOnTarget = nil
    end
end)

-- Основной цикл
RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOVCircle.Radius = settings.fov
    FOVCircle.Visible = settings.showFOV

    if settings.aimbotEnabled then
        local Target = GetClosestToCrosshair()
        if Target and Target.Character and Target.Character:FindFirstChild(settings.aimPart) then
            local targetPosition = Target.Character[settings.aimPart].Position
            local distance = (targetPosition - Camera.CFrame.Position).Magnitude
            
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
end)