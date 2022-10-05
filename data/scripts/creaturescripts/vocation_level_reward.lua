local table = {
  
        -- [1,5] = VOCATION ID
        -- [LEVEL] = {items = {{itemid = ITEM_ID, count = COUNT}}, storage = YOU_CHOOSE, msg = "MESSAGE FOR THE PLAYER"},

   [{1, 5}] = {
     [50] = {items = {{itemid = 3043, count = 30}}, storage = 40100, msg = "You won 30xCrystal Coins for reaching level 50!"},
     [150] = {items = {{itemid = 3043, count = 30}}, storage = 40100, msg = "You won 30xCrystal Coins for reaching level 150!"},

   }
}

local rewardLevel = CreatureEvent("RewardLevel")
function rewardLevel.onAdvance(player, skill, oldLevel, newLevel)


    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        
        return true
    
    end

        for voc, x in pairs(table) do
            if isInArray(voc, player:getVocation():getId()) then
            	for level, z in pairs(x) do
            		if newLevel >= level and player:getStorageValue(z.storage) ~= 1 then
                		for v = 1, #z.items do
                			local ret = ", "
                			if v == 1 then
                			ret = ""
                		
                                        end
				        player:addItem(z.items[v].itemid, z.items[v].count)
            				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, z.msg)
            				player:setStorageValue(z.storage, 1)
                		end
                        end
                end
      
   			player:save()

   			return true
   
            end
         end
end

rewardLevel:register()