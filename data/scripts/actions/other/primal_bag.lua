local rewards = {
    { id = 26046, name = "rezodus slayer" },
    { id = 3203, name = "rezodus super rune" },
    { id = 26052, name = "rezodus headchopper" },
    { id = 26000, name = "rezodus hammer" },
    { id = 26064, name = "rezodus bow" },
	{ id = 37608, name = "rezodus armor" },
    { id = 37607, name = "rezodus legs" },
    { id = 37609, name = "rezodus helmet" },
    { id = 37610, name = "rezodus slippers" },
	{ id = 3437, name = "rezodus shield" }
	
}

local primalBag = Action()

function primalBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received one ' .. rewardItem.name .. '.')
	return true
end

primalBag:id(39546)
primalBag:register()
