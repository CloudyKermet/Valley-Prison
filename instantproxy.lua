local vesp = Instance.new("Highlight")
vesp.Name = "ESP"
vesp.FillTransparency = 1
vesp.OutlineTransparency = 0
vesp.OutlineColor = Color3.fromRGB(255, 255, 255)

for _, bin in ipairs(workspace.Map.Functional.Storages.Searchable:GetChildren()) do
if bin.Name == "Bin" then
    local hl = vesp:Clone()
    hl.Parent = bin
bin.Proximity.ProximityPrompt.HoldDuration = 0.01
  end
end
