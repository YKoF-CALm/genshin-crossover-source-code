local dady = 0

function onCreate()
    addCharacterToList('ganyu-indie-nightmare', 'dad')
    addCharacterToList('emptygf', 'dad')
    addCharacterToList('xiao-indie-nightmare-alt', 'dad')
    addCharacterToList('xiao-indie-nightmare', 'dad')
    addCharacterToList('zhongli-indie-nightmare', 'dad')
    addCharacterToList('keqing-nightmare', 'dad')
    addCharacterToList('kokomi-nightmare', 'dad')

    setProperty('boyfriend.x', getProperty('boyfriend.x') + 500)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 350)
    setProperty('dad.y', getProperty('dad.y') + 345)
    dady = getProperty('dad.y')
    triggerEvent('Camera Follow Pos', 550, 500)
    setProperty('defaultCamZoom', 1.25)
    setProperty('camGame.zoom', 1.25)
    setTextFont('scoreTxt', 'PermanentMarker.ttf')
    setTextFont('timeTxt', 'PermanentMarker.ttf')
end

function onBeatHit()
    if curBeat == 16 then
        setProperty('defaultCamZoom', 0.5)
        setProperty('dad.y', dady + 2)
    end

    if curBeat == 160 or curBeat == 168 then
        setProperty('dad.y', dady - 100)
    end

    if curBeat == 328 then
        setProperty('dad.y', dady - 320)
    end

    if curBeat == 480 then
        setProperty('dad.y', dady + 80)
    end

    if curBeat == 672 then
        setProperty('dad.y', dady - 200)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if (dadName == 'ganyu-indie-nightmare' or dadName == 'kokomi-nightmare') and (getProperty('health') > 0.01) then
        setProperty('health', getProperty('health') - 0.01)
    elseif dadName == 'xiao-indie-nightmare' and getProperty('health') > 0.02 then
        setProperty('health', getProperty('health') - 0.02)
    elseif dadName == 'zhongli-indie-nightmare' and getProperty('health') > 0.03 then
        setProperty('health', getProperty('health') - 0.03)
    end
end