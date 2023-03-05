hasSpawned = false
function onEvent(name, value1, value2)

	if name == 'Silhouette' then
		local stuff = {'boyfriend', 'dad', 'gf', 'healthBar', 'iconP1', 'iconP2'}

		if hasSpawned == false then
			makeLuaSprite('whitebg', '', -1000, -1000)
			makeGraphic('whitebg', 1000, 1000, 'ffffff')
			scaleObject('whitebg', 5, 5)
			setScrollFactor('whitebg', 0, 0)
			addLuaSprite('whitebg', false)
			setProperty('whitebg.alpha', 0)
			hasSpawned = true
		end

		if value1 == 'a' then		
			for i = 1, # stuff do
				doTweenColor('badapplexd'..i, stuff[i], '000000', value2, 'linear')
			end

			doTweenAlpha('applebadxd69', 'whitebg', 1, value2, 'linear')
		end

		if value1 == 'b' then
			doTweenAlpha('applebadxd', 'whitebg', 0, value2, 'linear')
			for i = 1, # stuff do
				doTweenColor('badapplexd'..i, stuff[i], 'FFFFFF', value2, 'linear')
			end
		end

		if value1 == 'c' then
			setProperty('whitebg.alpha', 1)
			for i = 1, # stuff do
				setProperty(stuff[i]..'.color', '000000')
			end
		end
	end
end