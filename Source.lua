local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local espon = false
local teamcheck = true

local Window = Rayfield:CreateWindow({
   Name = "Valley Prison",
   LoadingTitle = "By Kermet",
   LoadingSubtitle = "Loading...",
   ShowText = "Rayfield",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   Discord = {
      Enabled = true,
      Invite = "MqvCGQCcxm",
      RememberJoins = true
   }
})

-- Highlight Template
local vesp = Instance.new("Highlight")
vesp.Name = "ESP"
vesp.FillTransparency = 1
vesp.OutlineTransparency = 0
vesp.OutlineColor = Color3.fromRGB(128, 128, 128)

RunService.RenderStepped:Connect(function()
    if espon then
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local humanoid = plr.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.Health > 0 and not plr.Character:FindFirstChild("ESP") then
                    
                    -- Team Check: Skip own team when enabled
                    if teamcheck and plr.Team == player.Team then
                        continue
                    end
                    
                    local hl = vesp:Clone()
                    hl.Adornee = plr.Character
                    
                    -- Team Colors on Outline
                    if teamcheck and plr.Team then
                        local teamName = plr.Team.Name
                        if teamName == "State Police" or teamName == "Department of Corrections" then
                            hl.OutlineColor = Color3.fromRGB(0, 100, 255)      -- Blue
                        elseif teamName == "Maximum Security" or teamName == "Booking" 
                            or teamName == "Medium Security" or teamName == "Minimum Security" then
                            hl.OutlineColor = Color3.fromRGB(255, 165, 0)      -- Orange
                        elseif teamName == "Escapee" then
                            hl.OutlineColor = Color3.fromRGB(255, 0, 0)        -- Red
                        else
                            hl.OutlineColor = Color3.fromRGB(128, 128, 128)    -- Default Grey
                        end
                    else
                        hl.OutlineColor = Color3.fromRGB(128, 128, 128)        -- Grey if teamcheck off
                    end
                    
                    hl.Parent = plr.Character
                end
            end
        end
    else
        for _, plr2 in ipairs(game.Players:GetPlayers()) do
            if plr2.Character then
                local esp = plr2.Character:FindFirstChild("ESP")
                if esp then
                    esp:Destroy()
                end
            end
        end
    end
end)

local Tab1 = Window:CreateTab("Visuals", 4483362458)

local tgl1 = Tab1:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      espon = Value
   end,
})

local tgl2 = Tab1:CreateToggle({
   Name = "Team Check",
   CurrentValue = true,
   Flag = "TeamCheck",
   Callback = function(Value)
      teamcheck = Value
   end,
})
