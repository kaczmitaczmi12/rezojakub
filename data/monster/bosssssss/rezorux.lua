local mType = Game.createMonsterType("rezorux")
local monster = {}

monster.description = "a rezorux"
monster.experience = 4008000
monster.outfit = {
	lookType = 1468,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2000000
monster.maxHealth = 2000000
monster.race = "venom"
monster.corpse = 22495
monster.speed = 550
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 10,
	health = 10,
	damage = 60,
	random = 20,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 50,
	{text = "BOOOOOOOMMM!!!!!", yell = false},
	{text = "COME ON BEACH!", yell = true},
	{text = "WAKE UPP!", yell = true},
	{text = "I EAT YOUR SOUL!", yell = true}
}

monster.loot = {
	{id = 3043, chance = 98000, maxCount = 200}, -- gold coin
	{id = 22721, chance = 99000, maxCount = 10}, -- gold token
	{id = 3422, chance = 26000, unique = true}, -- great shield
	{id = 22516, chance = 99000, maxCount = 10}, -- silver token
	{id = 3278, chance = 20000}, -- magic long sword
	{id = 36996, chance = 5000}, -- luna
    {id = 34109, chance = 2000}, -- bag you desire
	{id = 39546, chance = 2000} -- primal bag
	}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1300, maxDamage = -5250},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -2400, maxDamage = -6000, radius = 4, effect = CONST_ME_FIREWORK_RED, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1200, maxDamage = -7000, range = 4, radius = 4, effect = CONST_ME_HITBYPOISON, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -2500, length = 10, spread = 3, effect = CONST_ME_SOUND_BLUE, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -1500, maxDamage = -1900, length = 10, spread = 3, effect = CONST_ME_CRAPS, target = false},
	{name ="speed", interval = 2000, chance = 20, speedChange = -600, radius = 7, effect = CONST_ME_MAGIC_GREEN, target = false, duration = 20000},
	{name ="plagirath bog", interval = 20000, chance = 25, target = false}
}

monster.defenses = {
	defense = 55,
	armor = 55,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 3000, maxDamage = 8000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 30, speedChange = 440, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000},
	{name ="boss summon", interval = 50000, chance = 55, target = false},
	{name ="plagirath heal", interval = 2000, chance = 17, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 10},
	{type = COMBAT_MANADRAIN, percent = 20},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
