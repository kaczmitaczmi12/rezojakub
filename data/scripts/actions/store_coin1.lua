local storeCoin = Action()

function storeCoin.onUse(player, item, fromPosition, target, toPosition, isHotkey)
        local storeCoin = Player(cid)
        local storeCoin = player:getCoinsBalance()+item:getCount()
        player:getPosition():sendMagicEffect(15)
        item:remove()
        player:setCoinsBalance(storeCoin)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to carry store coins in your backpack.")
    end

storeCoin:id(22118)
storeCoin:register()