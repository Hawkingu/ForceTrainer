-- Carregar a biblioteca de interface (Rayfield)
loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Criar a janela
local Window = Rayfield:CreateWindow({
    Name = "Force Trainer",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "By Hawkingu",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Criar uma aba
local MainTab = Window:CreateTab("Força", 4483362458) -- 📊 Emoji

-- Criar uma seção
local Section = MainTab:CreateSection("Funções")

-- Variável de controle
globalFarm = false

-- Botão de toggle para adicionar +5 de força
local Toggle = MainTab:CreateToggle({
    Name = "+5 de Força (Auto)",
    CurrentValue = false,
    Flag = "ToggleForce",
    Callback = function(Value)
        globalFarm = Value
        if Value then
            while globalFarm do
                task.wait(1) -- Espera 1 segundo
                local args = {
                    [1] = "TrainStrength"
                }
                game:GetService("ReplicatedStorage").Remotes.Combat:FireServer(unpack(args))
            end
        end
    end,
})
