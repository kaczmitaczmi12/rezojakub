local internalNpcName = "Flickering Soul"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1219,
	lookHead = 30,
	lookBody = 30,
	lookLegs = 30,
	lookFeet = 30,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "task") then
		if player:getStorageValue(Storage.Quest.U12_40.SoulWar.Task) == -1 then
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.Task, 1)
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMalice, 0)
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarCruelty, 0)
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarGreed, 0)
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarHatred, 0)
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMegalomania, 0)
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarSpite, 0)
			npcHandler:say("I'm aware I have no right to ask and I have little to offer as a payment, but I ask you nonetheless. Will you face my fettered vices and destroy them for me? You have to defeat the following bosses: Goshnar Malice, Goshnar Cruelty, Goshnar Greed, Goshnar Hatred, Goshnar Megalomania and Goshnar Spite.", npc, creature)
		elseif player:getStorageValue(Storage.Quest.U12_40.SoulWar.Task) == 1 then
			local outmessage = "Do you want {report} something? "
			if player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMalice) == 0 then
				outmessage = outmessage .. "You haven't killed Malice yet. "
			end
			if player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarCruelty) == 0 then
				outmessage = outmessage .. "You haven't killed Cruelty yet. "
			end
			if player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarGreed) == 0 then
				outmessage = outmessage .. "You haven't killed Greed yet. "
			end
			if player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarHatred) == 0 then
				outmessage = outmessage .. "You haven't killed Hatred yet. "
			end
			if player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMegalomania) == 0 then
				outmessage = outmessage .. "You haven't killed Megalomania yet. "
			end
			if player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarSpite) == 0 then
				outmessage = outmessage .. "You haven't killed Spite yet."
			end
			npcHandler:say(outmessage, npc, creature)
		end
	elseif MsgContains(message, "report") then
		if player:getStorageValue(Storage.Quest.U12_40.SoulWar.Task) == 1 and 
		player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMalice) == 1 and 
	    player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarCruelty) == 1 and 
	    player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarGreed) == 1 and 
	    player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarHatred) == 1 and 
	    player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMegalomania) == 1 and 
	    player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarSpite) == 1 then
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.Task, 2)
			if player:getSex() == PLAYERSEX_FEMALE then
				player:addOutfit(1323)
				player:addOutfitAddon(1323, 1)
				player:addOutfitAddon(1323, 2)
			else
				player:addOutfit(1322)
				player:addOutfitAddon(1322, 1)
				player:addOutfitAddon(1322, 2)
			end
			player:addItem(34109,1)
			npcHandler:say("Thank you for accepting this burden.", npc, creature)
		else
			npcHandler:say("You have nothing to report.", npc, creature)
		end
	end
return true
end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted, living soul!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, living soul!.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Oh well.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
