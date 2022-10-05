local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	local maxsummons = 4
	if #summoncount < 4 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Infernal Demon", Position(math.random(33163, 33180), math.random(31497, 31506), 13), true, true)
			if not mid then
				return
			end
			mid:setMaster(creature)
		end
	end
	return
end

spell:name("infernal summon")
spell:words("###999")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()