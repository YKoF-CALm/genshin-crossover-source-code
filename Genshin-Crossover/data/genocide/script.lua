local allowCountdown = false
function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
        startVideo('genocide');
        allowCountdown = true;
        return Function_Stop;
    end
    if difficulty >= 2 then
        setProperty('health', 2)
    end
    return Function_Continue;
end
function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf_knife_death'); --Character json file for the death animation

    makeAnimatedLuaSprite('bf', 'characters/BF_exp', 550, 450)
    luaSpriteAddAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf', false)

    precacheImage('characters/BF_exp')
end
function opponentNoteHit()
    health = getProperty('health')
    if difficulty >= 2 then
        setProperty('health', health- 0.02);
    end
end
function onBeatHit()
    if curBeat % 2 == 0 then
        luaSpritePlayAnimation('bf', 'idle', true)
    end
end
function onStepHit()
    if curStep == 112 then
        if difficulty >= 2 then
            runTimer('drain', 1, 0)
        else
            runTimer('drain2', 1, 0)
        end
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'drain' then
        helth = getProperty('health')
        setProperty('health', helth - 0.01)
    end
    if tag == 'drain2' then
        helth = getProperty('health')
        setProperty('health', helth - 0.02)
    end
end