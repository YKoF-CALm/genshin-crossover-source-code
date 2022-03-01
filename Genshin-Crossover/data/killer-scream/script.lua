function onStartCountdown()
    triggerEvent('Camera Follow Pos', 500, 200)
    setProperty("camGame.zoom", 0.55)
    setCharacterY(boyfriend, 150)
	return Function_Continue;
end

function onCreate()
    makeLuaSprite('screamstatic', 'russia/scream_overlay', -750, -1000);
    scaleLuaSprite('screamstatic', 100, 100);
    addLuaSprite('screamstatic', true)
    setPropertyLuaSprite('screamstatic', 'alpha', 0)

    precacheImage('russia/scream_overlay')
    precacheSound('staticSound')
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
    setProperty('health', health + 0.02);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end

    if curBeat >= 544 and curBeat <= 607 then
        --do nothing
    else
        triggerEvent('Screen Shake', '0.05, 0.005', '0.05, 0.005')
    end
    
    if noteType == 'screamnote' then
        runTimer('ScreamTime', 0, 1)
        runTimer('ScreamAlpha', 0.3, 1)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'ScreamTime' then
        playSound('staticSound', 0.6)
        setPropertyLuaSprite('screamstatic', 'alpha', 1)
	end

    if tag == 'ScreamAlpha' then
        setPropertyLuaSprite('screamstatic', 'alpha', 0)
    end
end