local LocalPlayer = game:GetService("Players").LocalPlayer

print("PS99 Basit Elmas Gönderme")

task.wait(3)

-- Sadece username ve elmas yazma
local found = false

for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
    if v:IsA("TextBox") then
        if v.PlaceholderText:find("Username") or v.Name:find("Username") then
            v.Text = "umwt123"
            firesignal(v.FocusLost)
            print("Username yazıldı")
            found = true
        end
        if v.Text == "0" or v.PlaceholderText:find("0") then
            local diamonds = 0
            if LocalPlayer:FindFirstChild("leaderstats") then
                for _, stat in pairs(LocalPlayer.leaderstats:GetChildren()) do
                    if stat.Name:lower():find("diamond") or stat.Name:lower():find("gem") then
                        diamonds = stat.Value
                    end
                end
            end
            v.Text = tostring(diamonds)
            firesignal(v.FocusLost)
            print("Elmas yazıldı: " .. diamonds)
            found = true
        end
    end
end

if not found then
    print("Hiçbir TextBox bulunamadı. Gift ekranı açıkken dene.")
end
