local binfolder = workspace.Map.Functional.Storages.Searchable

local Bespt = Instance.new("Highlight")
Bespt.Name = "Esp9"
Bespt.FillTransparency = 1
Bespt.OutlineTransparency = 0
Bepst.OutlineColor = Color3.fromRGB(255, 255, 255)

local binesp = true
RunService.RenderStepped:Connect(function(dt)
    if binesp then
        for _, bins in ipairs(binfolder:GetChildren()) do
        if bins.Name == "Bin" then
          local p = bins.Proximity
local pp = bins.Proximity.ProximityPrompt
          if pp:GetAttribute("Searched") == false then
    local b = Bespt:Clone()
            b.Parent = p
          else
            p:FindFirstChild("Esp9"):Destroy()
end
          end
       end
    end
end)
