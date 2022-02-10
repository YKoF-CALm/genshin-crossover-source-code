function onStartCountdown()
    setCharacterY('dad', 255)
	return Function_Continue;
end

function onCreate()

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
end