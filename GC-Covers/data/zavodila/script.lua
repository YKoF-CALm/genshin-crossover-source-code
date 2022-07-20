function onCreate()
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 20)

    makeLuaSprite('black', '', -660, -1060)
    makeGraphic('black', 10000, 10000, '000000')
    setProperty('black.alpha', 0)
    addLuaSprite('black', false)
    setObjectOrder('black', getObjectOrder('pillarbroke') + 1)
    setObjectOrder('dadGroup', getObjectOrder('black') + 1)
end

function onStepHit()
    if curStep == 110 then
        doTweenAlpha('blacken', 'black', 0.8, 1.13, 'linear')
    end

    if curStep == 125 then
        setProperty('black.alpha', 0)
        cameraSetTarget('dad')
    end

    if curStep == 909 then
        doTweenAlpha('blacken', 'black', 0.8, 0.91, 'linear')
    end

    if curStep == 923 then
        setProperty('black.alpha', 0)
    end
end

function opponentNoteHit(id,d,t,s)
    cameraShake('game', 0.005, 0.05)
end