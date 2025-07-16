local StarterGui = game:GetService("StarterGui")

local function showNotification(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title or "Notification";
        Text = text or "";
        Duration = duration or 1;
    })
end

showNotification("†", "Made By Upkb.", 1.5)

-- Anti-AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- Hitbox Expansion (Invisible and non-colliding)
_G.HeadSize = 10
_G.Disabled = true

game:GetService("RunService").RenderStepped:Connect(function()
    if _G.Disabled then
        for _, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= game:GetService("Players").LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    local part = v.Character.HumanoidRootPart
                    part.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                    part.Transparency = 1
                    part.CanCollide = false
                    part.Material = Enum.Material.SmoothPlastic
                end)
            end
        end
    end
end)
