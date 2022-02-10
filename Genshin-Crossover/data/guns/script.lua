local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('inCutscene', true);
		startVideo('gunsCutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
	makeAnimatedLuaSprite('bf', 'characters/bf-accelerant', 1200, 400)
	luaSpriteAddAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
	addLuaSprite('bf', false)

	makeAnimatedLuaSprite('tankman', 'characters/tankmanCaptainRA', -300, 250)
	setProperty('tankman.flipX', true)
	luaSpriteAddAnimationByPrefix('tankman', 'idle', 'Tankman Idle Dance', 24, false)
	addLuaSprite('tankman', false)
end

function onBeatHit()
	if curBeat % 2 == 0 then
		luaSpritePlayAnimation('bf', 'idle', true)
		luaSpritePlayAnimation('tankman', 'idle', true)
	end
end