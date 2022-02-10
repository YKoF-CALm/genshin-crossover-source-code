local allowCountdown = false
function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
        startVideo('genocide');
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end
function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf_knife_death'); --Character json file for the death animation

    makeAnimatedLuaSprite('bf', 'characters/BF_exp', 550, 450)
    luaSpriteAddAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf', false)
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end
end
function onBeatHit()
    if curBeat % 2 == 0 then
        luaSpritePlayAnimation('bf', 'idle', true)
    end
end