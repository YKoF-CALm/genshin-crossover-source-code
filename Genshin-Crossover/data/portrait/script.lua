function onStartCountdown()
    setCharacterY('dad', 255)
	return Function_Continue;
end

function onCreate()
    precacheImage('fever/paintingShit')
end

function onBeatHit()
    if curBeat == 32 then
        removeLuaSprite('nopaint', false)
        addLuaSprite('paint', false)
        makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,2,'linear')
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
    if getProperty('health') > 0.02 then
        setProperty('health', health- 0.02);
    end
end

function onUpdate(elapsed)
    if not mustHitSection then
        triggerEvent('Camera Follow Pos', 1000, 600)
    else
        cameraSetTarget('boyfriend')
    end
    songPos = getSongPosition()
    local currentBeat = (songPos / 1000)*(bpm/60)
    if curStep >= 0 then
        noteTweenX('ox1', 0, defaultOpponentStrumX0 + 12.5 * math.sin((currentBeat + 0*50) * math.pi), 0.1, 'linear')
        noteTweenX('ox2', 1, defaultOpponentStrumX1 + 12.5 * math.sin((currentBeat + 1*50) * math.pi), 0.1, 'linear')
        noteTweenX('ox3', 2, defaultOpponentStrumX2 + 12.5 * math.sin((currentBeat + 2*50) * math.pi), 0.1, 'linear')
        noteTweenX('ox4', 3, defaultOpponentStrumX3 + 12.5 * math.sin((currentBeat + 3*50) * math.pi), 0.1, 'linear')
        noteTweenX('px1', 4, defaultPlayerStrumX0 + 12.5 * math.sin((currentBeat + 4*50) * math.pi), 0.1, 'linear')
        noteTweenX('px2', 5, defaultPlayerStrumX1 + 12.5 * math.sin((currentBeat + 5*50) * math.pi), 0.1, 'linear')
        noteTweenX('px3', 6, defaultPlayerStrumX2 + 12.5 * math.sin((currentBeat + 6*50) * math.pi), 0.1, 'linear')
        noteTweenX('px4', 7, defaultPlayerStrumX3 + 12.5 * math.sin((currentBeat + 7*50) * math.pi), 0.1, 'linear')
	end
end