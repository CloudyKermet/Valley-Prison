local vesp = Instance.new("Highlight")
vesp.Name = "ESP"
vesp.FillTransparency = 1
vesp.OutlineTransparency = 0
vesp.OutlineColor = Color3.fromRGB(255, 255, 255)

for _, bin in ipairs(workspace.Map.Functional.Storages.Searchable:GetChildren()) do
if bin.Name == "Bin" then
        for _, prox in ipairs(bin:GetChildren()) do
if prox.Name == "Proximity" then
local prompt = prox:FindFirstChild("ProximityPrompt")
                prompt.HoldDuration = 0.01
                                if workspace.part:GetAttribute("Searched") == false then
local hl = vesp:Clone()
    hl.Parent = prox
         else
        prox:FindFirstChild("ESP"):Destroy()
end
                                 
            end
        end
  end
end
