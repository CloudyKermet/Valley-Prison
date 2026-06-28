local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")


local Window = Rayfield:CreateWindow({
   Name = "Valley Prison",
   LoadingTitle = "By Kermet",
   LoadingSubtitle = "Loading v1",
   ShowText = "Rayfield",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "MqvCGQCcxm", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   }
})

local antitase = false
local antirecoil = false

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

      if antirecoil then
for _, guns in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
if guns:IsA("Tool") then
for _, gconfigf in ipairs(guns:GetChildren()) do
if gconfigf.Name == "LocalConfig" then
gconfigf:FindFirstChild("Configuration"):FindFirstChild("Accuracy").Value = 0, 0, 0
gconfigf:FindFirstChild("Configuration"):FindFirstChild("RecoilMax").Value = 0, 0, 0
gconfigf:FindFirstChild("Configuration"):FindFirstChild("RecoilMin").Value = 0, 0, 0                     
                  end
               end
            end
         end
      end
end)

-- Re-apply on respawn
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
end)

local Tab1 = Window:CreateTab("Main", 4483362458)

local tgl1 = Tab1:CreateToggle({
   Name = "Anti Tase",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
  antitase = Value
   end,
})

local tgl2 = Tab1:CreateToggle({
   Name = "Anti Recoil",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
  antirecoil = Value
   end,
})
