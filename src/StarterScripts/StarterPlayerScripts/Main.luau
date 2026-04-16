-- Load gameData
_G.gameData = require(game.ReplicatedStorage:WaitForChild("gameData"))

-- Dependencies
local Tile = require(game.ReplicatedStorage:WaitForChild("Tile"))
local GrowthManager = require(game.ReplicatedStorage:WaitForChild("GrowthManager"))

-- Services
local RunService = game:GetService("RunService")

-- Espera a pasta Tiles existir no Workspace
local tilesFolder = game.Workspace:WaitForChild("Tiles")

-- Espera ter pelo menos 1 filho
repeat task.wait() until #tilesFolder:GetChildren() > 0

-- Create Tiles objects
local tilesChildren = tilesFolder:GetChildren()
for _, tileInstance in tilesChildren do
	local tile = Tile:new(tileInstance)
	table.insert(_G.gameData.tiles, tile)
	print(tile.position)
end

-- Criar loop pro GrowthManager com delta time
RunService.Heartbeat:Connect(function(deltaTime)
	GrowthManager:run(deltaTime)
end)