local setting = {
    [22721] = {count = 10},
    [22516] = {count = 5},
}

local tibiaCoin = Action()

function tibiaCoin.onUse(player, item, fromPosition, target, toPosition, isHotkey)
        local foundItem = setting[item.itemid]
            if not(foundItem) then
            return
        end
        player:addTibiaCoins(foundItem.count)
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received '..foundItem.count..' tibia coins.')
        item:remove(1)
        return true
end
for k, v in pairs(setting) do
    tibiaCoin:id(k)
end
tibiaCoin:register()