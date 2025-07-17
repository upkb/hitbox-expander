local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Notification function
local function showNotification(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title or "Notification";
        Text = text or "";
        Duration = duration or 1;
    })
end

-- Startup notification
showNotification("†", "Made By Upkb.", 1.5)

-- Anti-AFK
local vu = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- Hitbox Expansion settings
_G.HeadSize = 17
_G.Disabled = true

-- Toggle on RightControl press
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
        _G.Disabled = not _G.Disabled
        if _G.Disabled then
            showNotification("†", "Toggled On", 1.5)
        else
            showNotification("†", "Toggled Off", 1.5)
        end
    end
end)

-- Hitbox Expansion loop
RunService.RenderStepped:Connect(function()
    if _G.Disabled then
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
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
