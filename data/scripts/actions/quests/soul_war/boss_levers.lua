local levers = {
	{leverPos = {x = 33853, y = 31854, z = 6}, teleportTo = Position({x = 33855, y = 31864, z = 7}), bossName = "goshnar cruelty", bossPos = Position({x = 33861, y = 31866, z = 7})},--Cruelty
	{leverPos = {x = 33738, y = 31506, z = 14}, teleportTo = Position({x = 33719, y = 31504, z = 14}), bossName = "goshnar greed", bossPos = Position({x = 33708, y = 31503, z = 14})},--Goshnar's Greed
	{leverPos = {x = 33675, y = 31634, z = 14}, teleportTo = Position({x = 33708, y = 31634, z = 14}), bossName = "goshnar spite", bossPos = Position({x = 33714, y = 31634, z = 14})},--Goshnar's Spite
	{leverPos = {x = 33678, y = 31599, z = 14}, teleportTo = Position({x = 33708, y = 31599, z = 14}), bossName = "goshnar malice", bossPos = Position({x = 33714, y = 31599, z = 14})},--Goshnar's Malice
	{leverPos = {x = 33772, y = 31601, z = 14}, teleportTo = Position({x = 33749, y = 31601, z = 14}), bossName = "goshnar hatred", bossPos = Position({x = 33738, y = 31601, z = 14})},--Goshnar's Hatred
	{leverPos = {x = 33773, y = 31634, z = 14}, teleportTo = Position({x = 33749, y = 31633, z = 14}), bossName = "goshnar megalomania", bossPos = Position({x = 33737, y = 31633, z = 14})},--Goshnar's Megalomania
        {leverPos = {x = 33478, y = 32295, z = 15}, teleportTo = Position({x = 33458, y = 32297, z = 15}), bossName = "The Baron From Below", bossPos = Position({x = 33445, y = 32297, z = 15})},--the baron from below
        {leverPos = {x = 33360, y = 32111, z = 15}, teleportTo = Position({x = 33380, y = 32111, z = 15}), bossName = "The Count of the Core", bossPos = Position({x = 33392, y = 32111, z = 15})},--The Count of the Core
        {leverPos = {x = 33408, y = 32352, z = 15}, teleportTo = Position({x = 33384, y = 32351, z = 15}), bossName = "The Duke of the Depths", bossPos = Position({x = 33372, y = 32351, z = 15})},--The Duke of the Depths
}

local function StartBattle(bossPos)
	local boss = Tile(bossPos):getTopCreature()
	if boss and boss:isMonster() then
		boss:teleportTo(Position({x = 33427, y = 31436, z = 13}))
	end
end

local lever = Action()
function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for b = 1, #levers do
		if item:getPosition() == Position(levers[b].leverPos) then
			for c = levers[b].leverPos.x + 1, levers[b].leverPos.x + 5 do
				local adventurers = Tile(Position(c, levers[b].leverPos.y, levers[b].leverPos.z)):getTopCreature()
				if adventurers and adventurers:isPlayer() then
					adventurers:teleportTo(levers[b].teleportTo)
				end
			end
			if levers[b].bossNames then
				Game.createMonster(levers[b].bossNames[1], levers[b].bossPos[1]):registerEvent("SirBaelocThink")
				Game.createMonster(levers[b].bossNames[2], levers[b].bossPos[2]):registerEvent("SirNictrosThink")
				addEvent(StartBattle, 15 * 1000, levers[b].bossPos[2])
			else
				Game.createMonster(levers[b].bossName, levers[b].bossPos)
			end
		end
	end
	return true
end

for a = 1, #levers do
	lever:position(levers[a].leverPos)
end
lever:register()
