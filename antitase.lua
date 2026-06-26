local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local antitase = true  -- Toggle this to false to disable

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

RunService.Heartbeat:Connect(function()
    if not antitase then return end
    
    if not character or not character.Parent then return end
    if not humanoid then 
        humanoid = character:FindFirstChild("Humanoid")
        return 
    end

    -- Reset states
    humanoid.PlatformStand = false
    humanoid.AutoRotate = true
    humanoid.Sit = false
    
    -- Force normal state
    if humanoid.Health > 0 then
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end

    -- Anti-Ragdoll cleanup
    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    if torso then
        for _, v in pairs(torso:GetChildren()) do
            if v.Name == "MRV2" or v:IsA("BallSocketConstraint") or (v:IsA("Attachment") and v.Parent == torso) then
                v:Destroy()
            end
        end
    end

    -- Reset values
    local sv = player:FindFirstChild("ServerVariables")
    if sv then
        if sv:FindFirstChild("Tased") then sv.Tased.Value = false end
        if sv:FindFirstChild("Stunned") then sv.Stunned.Value = false end
        if sv:FindFirstChild("Ragdolled") then sv.Ragdolled.Value = false end
    end

    local tasedVal = character:FindFirstChild("Tased") or script:FindFirstChild("Tased")
    if tasedVal then tasedVal.Value = false end

    local stunnedVal = character:FindFirstChild("Stunned") or script:FindFirstChild("Stunned")
    if stunnedVal then stunnedVal.Value = false end

    local ragdolledVal = character:FindFirstChild("Ragdolled") or script:FindFirstChild("Ragdolled")
    if ragdolledVal then ragdolledVal.Value = false end
end)

-- Re-apply on respawn
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
end)

print("✅ Anti-Tase loaded | antitase =", antitase)
