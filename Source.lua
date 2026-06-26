local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local player = game.Players.LocalPlayer
local character = player.Character
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local RunService = game:GetService("RunService")
local espon = false

local Window = Rayfield:CreateWindow({
   Name = "Valley Prison",
   LoadingTitle = "By Kermet",
   LoadingSubtitle = "Loading...",
   ShowText = "Rayfield",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "MqvCGQCcxm", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   }
})

local vesp = Instance.new("Highlight")
vesp.Name = "ESP"
vesp.FillTransparency = 1
vesp.OutlineTransparency = 0
vesp.OutlineColor = Color3.fromRGB(255, 255, 255)

RunService.RenderStepped:Connect(function(dt)
    if espon then
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr.Character and not plr.Character:FindFirstChild("Hilight") then
                local hl = vesp:Clone()
                hl.Parent = plr.Character
            end
        end
    else
        for _, plr2 in ipairs(game.Players:GetPlayers()) do
            if plr2.Character and plr2.Character:FindFirstChild("ESP") then
                plr2.Character:FindFirstChild("ESP"):Destroy()
            end
        end
    end
end)

local Tab1 = Window:CreateTab("Visuals", 4483362458)

local tgl1 = Tab1:CreateToggle({
   Name = "Esp",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
  espon = not espon
   end,
})

