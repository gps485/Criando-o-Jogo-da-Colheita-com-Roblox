local GrowthManager = {}

local growthChancePerSecond = 0.1

function GrowthManager:run(deltaTime: number)
	local tiles = _G.gameData.tiles
	for _, tile in tiles do
		
		-- Ignore complete tiles
		if tile:isComplete() then
			continue
		end
		
		--  Calculate chance
		local chance = growthChancePerSecond * deltaTime
		if math.random() > chance then
			continue
		end
		
		-- Grow
		tile:setStage(tile.stage + 1)
		
	end
end

return GrowthManager
