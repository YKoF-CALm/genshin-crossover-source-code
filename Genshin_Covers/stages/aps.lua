function onCreate()
	makeLuaSprite('feveraps', 'week2bgtaki', -500, -300)
	addLuaSprite('feveraps', false)
	setLuaSpriteScrollFactor('feveraps', 0.7, 0.7);

	makeAnimatedLuaSprite('fever', 'casFEVER', 500, 400)
	addAnimationByPrefix('fever', 'shiver', 'BF idle shaking', 24, true)
	addLuaSprite('fever', true)
	objectPlayAnimation('fever', 'shiver', true);

	makeAnimatedLuaSprite('tea', 'tea_assets', 400, 130)
	addAnimationByPrefix('tea', 'shiver1', 'GF FEAR', 24, true)
	addLuaSprite('tea', false)
	objectPlayAnimation('tea', 'shiver1', true);

	close(true)
end