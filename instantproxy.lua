for _, bin in ipairs(workspace.Map.Functional.Storages.Searchable:GetChildren()) do
if bin.Name == "Bin" then
bin.Proximity.ProximityPrompt.HoldDuration = 0.01
  end
end
