local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

firesignal(game:GetService("ReplicatedStorage").Hints.Remote.OnClientEvent, "Vortex Loaded")

loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudyKermet/Valley-Prison/refs/heads/main/viewui"))()

RunService.Heartbeat:Connect(function()
game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.MainMenu.TopFrame.TitleShadow.Text = "Vortex"
game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.MainMenu.TopFrame.TitleShadow.GameName.Text = "Vortex"
game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.MainMenu.TopFrame.TitleShadow.GameName.TextColor3 = Color3.fromRGB(137, 207, 240)
game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.MainMenu.TopFrame.TipShadow.Tip.Text = "By KermetDevelopment"
game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.MainMenu.TopFrame.TipShadow.Text = "By KermetDevelopment"
   end)

--aimbot variables--
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local aimlock = false
local teamcheck = true
local wallcheck = false
local aimpart = "Head"
local smoothness = 0

local Target = nil
local HoldingTrigger = false
local OriginalCameraType = Camera.CameraType


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
local alwayssprint = false
local infstamina = false
local showrope = false
local espitems = false
local gunrbg = false

local itemesp = Instance.new("Highlight")
itemesp.Name = "ESP"
itemesp.FillTransparency = 1
itemesp.OutlineTransparency = 0
itemesp.OutlineColor = Color3.fromRGB(255, 255, 255)

local rbgcolor = Color3.fromHSV((tick() % 6) / 6, 1, 1)

RunService.Heartbeat:Connect(function()
    if antitase then
    
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
      end

      if antirecoil then
for _, guns in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
if guns:IsA("Tool") then
for _, gconfigf in ipairs(guns:GetChildren()) do
if gconfigf.Name == "LocalConfig" then
gconfigf:FindFirstChild("Configuration"):FindFirstChild("Accuracy").Value = Vector3.new(0, 0, 0)
gconfigf:FindFirstChild("Configuration"):FindFirstChild("RecoilMax").Value = Vector3.new(0, 0, 0)
gconfigf:FindFirstChild("Configuration"):FindFirstChild("RecoilMin").Value = Vector3.new(0, 0, 0)
gconfigf:FindFirstChild("Configuration"):FindFirstChild("MaximumRange").Value = 99999                     
                  end
               end
            end
         end
      end
if alwayssprint then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 20
      end
if infstamina then
game:GetService("Players").LocalPlayer.ServerVariables.Sprint.Stamina.Value = 100
      end

      if showrope then
for _, rope in ipairs(workspace.Map.Functional.Ropes:GetChildren()) do
if rope.Name == "Rope" then
rope:FindFirstChild("Rope").Transparency = 0.4
rope:FindFirstChild("Truss").CanCollide = true               
            end
         end
      end

      if espitems then
for _, items in ipairs(game.workspace.DroppedTools:GetChildren()) do
            if not items:FindFirstChild("ESP") then
local itesp = itemesp:Clone()
            itesp.Parent = items
            itesp.OutlineColor = Color3.fromRGB(135, 206, 235)
         end
      end
   end
      if gunrbg then
for _, gun in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
if gun:IsA("Tool") then
if gun:FindFirstChild("LocalConfig"):FindFirstChild("Configuration"):FindFirstChild("RecoilMax") then
for _, meshpart in ipairs(gun:GetDescendants()) do 
if meshpart:IsA("Mesh") then
meshpart.Transparency = 0.9
local guncham = itemesp:Clone()
guncham.OutlineTransparency = 1
guncham.FillTransparency = 0.3 
guncham.FillColor = rgbcolor                        
guncham.Parent = meshpart                        
                        end
                     end
                  end
               end
            end
      end
end)

game.Players.LocalPlayer.Chatted:Connect(function(message)
      local args = message:split(" ")

      local cmd = args[1]
      local target = args[2]

      if cmd == "!checkinv" then
if game.Players:FindFirstChild(target) then
local vi = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ViewUi")
vi.Enabled = true
vi:FindFirstChild("View"):FindFirstChild("NameLabel").Text = target
vi:FindFirstChild("View"):FindFirstChild("LevelLabel").Text = ("Level: " .. game.Players:FindFirstChild(target).ServerVariables.Experience.Level.Value)
if game.Players:FindFirstChild(target).ServerVariables.Innocent.Value == true then
vi:FindFirstChild("View"):FindFirstChild("SafeLabel").Text = "Innocent"
            else
vi:FindFirstChild("View"):FindFirstChild("SafeLabel").Text = "Not Innocent"               
            end
for _, inv in ipairs(game.Players:FindFirstChild(target).Backpack:GetChildren()) do
local Label = Instance.new("TextLabel")
    Label.Name = "index"
    Label.Text = (inv.Name)
    Label.TextWrapped = true
    Label.TextScaled = true
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(155, 168, 234)
    Label.Size = UDim2.new(0, 114, 0, 22)
               Label.Parent = vi:FindFirstChild("View"):FindFirstChild("ScrollingFrame")
            end
         end
      end
   end)

Game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ViewUi").View.CloseButton.MouseButton1Click:Connect(function()
Game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ViewUi").Enabled = false
      for _, indexframe in ipairs(Game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ViewUi"):FindFirstChild("View"):FindFirstChild("ScrollingFrame"):GetChildren()) do
if indexframe.Name == "index" then
indexframe:Destroy()
      end
   end
end)      

-- Re-apply on respawn
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
end)

local function IsVisible(targetPart)
    if not wallcheck then return true end
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    local ray = Ray.new(root.Position, (targetPart.Position - root.Position))
    local hit = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character})
    return hit == nil or hit:IsDescendantOf(targetPart.Parent)
end

local function GetClosestToCenter()
    local closest = nil
    local closestDist = 9999
    local screenCenter = Camera.ViewportSize / 2

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local char = plr.Character
            local hum = char:FindFirstChild("Humanoid")
            local part = char:FindFirstChild(aimpart)
            
            if hum and hum.Health > 0 and part then
                if teamcheck and plr.Team == LocalPlayer.Team then continue end
                if not IsVisible(part) then continue end
                
                local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closest = part
                    end
                end
            end
        end
    end
    return closest
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonL2 then
        HoldingTrigger = true
        OriginalCameraType = Camera.CameraType
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonL2 then
        HoldingTrigger = false
        Target = nil
        Camera.CameraType = OriginalCameraType
    end
end)

RunService.RenderStepped:Connect(function()
    if not aimlock or not HoldingTrigger then
        Target = nil
         return
    end

    if not Target or not Target.Parent or (Target.Parent:FindFirstChild("Humanoid") and Target.Parent.Humanoid.Health <= 0) then
        Target = GetClosestToCenter()
    end

    if Target then
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local newCFrame = CFrame.new(Camera.CFrame.Position, Target.Position)
            if smoothness <= 0 then
                Camera.CFrame = newCFrame
            else
                Camera.CFrame = Camera.CFrame:Lerp(newCFrame, smoothness)
            end
        end
    end 
end)

local Tab1 = Window:CreateTab("Combat", 4483362458)
local Tab2 = Window:CreateTab("Visuals", 4483362458)
local Tab3 = Window:CreateTab("Client", 4483362458)
local Tab4 = Window:CreateTab("Misc", 4483362458)

local tgl1 = Tab3:CreateToggle({
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

local tgl3 = Tab3:CreateToggle({
   Name = "Always Sprint",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
  alwayssprint = Value
         if not Value then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 14
         end
   end,
})

local tgl4 = Tab3:CreateToggle({
   Name = "Inf Stamina",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
  infstamina = Value
   end,
})

local tgl5 = Tab1:CreateToggle({
   Name = "Aimlock",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
  aimlock = Value
   end,
})

local tgl6 = Tab1:CreateToggle({
   Name = "WallCheck",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
  wallcheck = Value
   end,
})

local tgl7 = Tab4:CreateToggle({
   Name = "Show Ropes",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
  showrope = Value
         if not Value then
for _, rope1 in ipairs(workspace.Map.Functional.Ropes:GetChildren()) do
if rope1.Name == "Rope" then
rope1:FindFirstChild("Rope").Transparency = 1
rope1:FindFirstChild("Truss").CanCollide = false               
            end
         end
      end
   end,
})

local tgl8 = Tab2:CreateToggle({
   Name = "Esp Items",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      espitems = Value
      if not Value then
         for _, item in ipairs(game.workspace.DroppedTools:GetChildren()) do
            if item:FindFirstChild("ESP") then
               item:FindFirstChild("ESP"):Destroy()
            end
         end
      end
   end,
})

local tgl6 = Tab1:CreateToggle({
   Name = "Gun RBG",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
   gunrbg = Value
   end,
})
