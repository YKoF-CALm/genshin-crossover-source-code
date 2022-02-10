function onCreate()

	makeLuaSprite('inazuma', 'genshin/inazuma', -650,-230)
	addLuaSprite('inazuma', false)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end