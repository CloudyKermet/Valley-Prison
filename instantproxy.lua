for _, bin in ipairs(workspace.Map.Functional.Storages.Searchable:GetChildren()) do
if bin.Name == "Bin" then
for _, prox in ipairs(bin:GetChildren()) do
local prompt = prox:FindFirstChild("ProximityPrompt")
prompt.MaxActivationDistance = 9999
prompt.HoldDuration = 0.01
prompt:InputHoldBegin()
task.wait(0.08)
prompt:InputHoldEnd()                        
                end
        end
end
				
