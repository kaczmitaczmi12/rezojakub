local config = {
	bosses = {
		{'Baron Brute', 'The Axeorcist'},
		{'Menace', 'Fatality'},
		{'Incineron', 'Coldheart'},
		{'Dreadwing', 'Doomhowl'},
		{'Haunter', 'The Dreadorian'},
		{'Rocko', 'Tremorak'},
		{'Tirecz'}
	},

	teleportPositions = {
		Position(33059, 31032, 3),
		Position(33057, 31034, 3)
	},

	positions = {
		-- other bosses
		Position(33065, 31035, 3),
		Position(33068, 31034, 3),

		-- first 2 bosses
		Position(33065, 31033, 3),
		Position(33066, 31037, 3)
	}
}
local TheNewFrontier = Storage.Quest.U8_54.TheNewFrontier

local function summonBoss(name, position)
	Game.createMonster(name, position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
end

local function clearArena()
	local spectators = Game.getSpectators(Position(33063, 31034, 3), false, false, 10, 10, 10, 10)
	local exitPosition = Position(33049, 31017, 2)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		else
			spectator:remove()
		end
	end
end

local theNewFrontierArena = Action()
function theNewFrontierArena.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local player1 = Tile(Position(33080, 31014, 2)):getTopCreature()
	if not(player1 and player1:isPlayer()) then
		return false
	end

	local player2 = Tile(Position(33081, 31014, 2)):getTopCreature()
	if not(player2 and player2:isPlayer()) then
		return false
	end

	if player1:getStorageValue(TheNewFrontier.Questline) >= 26 then
		return player1:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already finished this battle.')
	end

	if Game.getStorageValue(TheNewFrontier.Mission09[1]) == 1 then
		return player1:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The arena is already in use.')
	end

	Game.setStorageValue(TheNewFrontier.Mission09[1], 1)
	addEvent(clearArena, 30 * 60 * 1000)
	player1:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player1:teleportTo(config.teleportPositions[1])
	player1:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player2:teleportTo(config.teleportPositions[2])
	player2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

	for i = 1, #config.bosses do
		for j = 1, #config.bosses[i] do
			addEvent(summonBoss, (i - 1) * 90 * 1000, config.bosses[i][j], config.positions[j + (i == 1 and 2 or 0)])
		end
	end
	return true
end

theNewFrontierArena:aid(30003)
theNewFrontierArena:register()
