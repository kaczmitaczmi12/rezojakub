local SoulWarTaskOnKill = CreatureEvent("SoulWarTask")
function SoulWarTaskOnKill.onKill(player, target)

	local targetPlayer = target:getPlayer()
	if targetPlayer then
		targetPlayer:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMalice, 0)
		targetPlayer:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarCruelty, 0)
		targetPlayer:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarGreed, 0)
		targetPlayer:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarHatred, 0)
		targetPlayer:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMegalomania, 0)
		targetPlayer:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarSpite, 0)
		return true
	end
	
	if target:getMaster() then
		return true
	end
		
	local targetMonster = target:getMonster()
	if player:getStorageValue(Storage.Quest.U12_40.SoulWar.Task) == 1 then
		if targetMonster:getName() == "Goshnar Malice" and player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMalice) == 0 then
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMalice, 1)
		elseif targetMonster:getName() == "Goshnar Cruelty" and player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarCruelty) == 0 then
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarCruelty, 1)
		elseif targetMonster:getName() == "Goshnar Greed" and player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarGreed) == 0 then
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarGreed, 1)
		elseif targetMonster:getName() == "Goshnar Hatred" and player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarHatred) == 0 then
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarHatred, 1)
		elseif targetMonster:getName() == "Goshnar Megalomania" and player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMegalomania) == 0 then
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMegalomania, 1)
		elseif targetMonster:getName() == "Goshnar Spite" and player:getStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarSpite) == 0 then
			player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarSpite, 1)
		end
	end

return true
end

SoulWarTaskOnKill:register()