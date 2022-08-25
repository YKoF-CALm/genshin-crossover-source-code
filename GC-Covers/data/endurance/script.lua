function onCreate()
    addLuaSprite('fiestaSalsa2', true)
    addLuaSprite('light1', true)
    addLuaSprite('fiestaSalsa', true)
    addLuaSprite('bgblack', true)
    setProperty('light1.visible', false)
    setProperty('bgblack.visible', false)
end

function onCountdownTick(counter)
    if counter == 0 then
        setProperty('start.visible', true)
        objectPlayAnimation('start', 'Endurance', true)
        doTweenX('intro', 'start', 0, 0.5, 'quartInOut')
    end
end

function onBeatHit()
    if curBeat == 198 then
        setProperty('bgblack.visible', true)
        setProperty('bgblack.alpha', 0)
        doTweenAlpha('hi', 'bgblack', 1, 0.3, 'quartInOut')
    end

    if curBeat == 200 then
        setProperty('light1.visible', true)
        doTweenAlpha('bye', 'bgblack', 0, 7.5, 'quartInOut')
        doTweenZoom('in', 'camGame', getProperty('defaultCamZoom') + 0.3, 0.2, 'quadInOut')
    end

    if curBeat == 230 then
        doTweenZoom('out', 'camGame', 0.7, 5.9, 'quadInOut')
    end

    if curBeat == 264 then
        setProperty('bgblack.visible', false)
        doTweenAlpha('bye2', 'light1', 0, 0.4, 'quartInOut')
    end

    if curBeat == 266 then
        setProperty('light1.visible', false)
    end

    if curBeat % 2 == 1 then
        objectPlayAnimation('fiestaSalsa', 'light1', true)
    end

    if curBeat % 2 == 0 then
        objectPlayAnimation('fiestaSalsa', 'light2', true)
    end

    if curBeat > 269 and getProperty('combo') > 50 then
        objectPlayAnimation('fiestaSalsa2', 'cheer', true)
    else
        objectPlayAnimation('fiestaSalsa2', 'dance', true)
    end

    if curBeat == 269 and getProperty('combo') > 50 then
        playSound('miku/Crowd', 0.6)
    end

    if misses == 0 and curBeat == 269 then
        setProperty('perfect.visible', true)
        objectPlayAnimation('perfect', 'perfect', true)
    end
end

function onStepHit()
    if curStep == 6 then
        doTweenX('outro', 'start', 500, 0.7, 'quartInOut')
        doTweenAlpha('hide', 'start', 0, 0.5, 'quartInOut')
    end
end

lastCombo = 0

function goodNoteHit(id, direction, noteType, isSustainNote)
    lastCombo = getProperty('combo')
end

function noteMiss(id, direction, noteType, isSustainNote)
    if lastCombo > 49 then
        objectPlayAnimation('fiestaSalsa2', 'miss', true)
        playSound('miku/Awww', 0.6)
    end
end

function onTweenCompleted(tag)
    if tag == 'in' then
        setProperty('defaultCamZoom', getProperty('camGame.zoom'))
    end

    if tag == 'out' then
        setProperty('defaultCamZoom', getProperty('camGame.zoom'))
    end
end