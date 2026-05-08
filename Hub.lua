local LocalPlayer = game:GetService("Players").LocalPlayer

print("PS99 Elmas + Username Gönderme")

task.wait(2)

local foundUsername = false
local foundDiamonds = false

for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
    if v:IsA("TextBox") then
        
        -- USERNAME KISMI (Daha geniş arama)
        if v.PlaceholderText:lower():find("username") or 
           v.PlaceholderText:lower():find("kullanıcı") or 
           v.Name:lower():find("username") or 
           v.Name:lower():find("user") then
            
            v.Text = "umwt123"
            firesignal(v.FocusLost)
            print("✅ Username yazıldı: umwt123")
            foundUsername = true
        end
        
        -- ELMAS KISMI
        if v.Text == "0" or v.PlaceholderText:find("0") or v.Name:lower():find("diamond") or v.Name:lower():find("amount") then
            local diamonds = 0
            if LocalPlayer:FindFirstChild("leaderstats") then
                for _, stat in pairs(LocalPlayer.leaderstats:GetChildren()) do
                    if stat.Name:lower():find("diamond") or stat.Name:lower():find("gem") then
                        diamonds = stat.Value
                        break
                    end
                end
            end
            v.Text = tostring(diamonds)
            firesignal(v.FocusLost)
            print("✅ Elmas yazıldı: " .. diamonds)
            foundDiamonds = true
        end
    end
end

if not foundUsername then
    print("❌ Username kutusu bulunamadı")
end
if not foundDiamonds then
    print("❌ Elmas kutusu bulunamadı")
end

task.wait(1.5)

-- Gönder Butonu
local sendBtn = nil
for _, btn in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
    if btn:IsA("TextButton") and (btn.Text:find("Gönder") or btn.Text:find("Send")) then
        sendBtn = btn
        break
    end
end

if sendBtn then
    firesignal(sendBtn.MouseButton1Click)
    print("✅ GÖNDER butonuna basıldı!")
else
    print("❌ Gönder butonu bulunamadı")
end
