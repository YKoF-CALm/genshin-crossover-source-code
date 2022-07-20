function onCreate()
    setProperty('dad.x', getProperty('dad.x') - 70)
    setProperty('dad.y', getProperty('dad.y') - 130)
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 240)
    cameraSetTarget('dad')
end

function onBeatHit()
    if curBeat == 3 then
        objectPlayAnimation('speakers', 'boom', true)
    end

    if curBeat % 1 == 0 and curBeat >= 3 and curBeat < 228 then
        cameraShake('game', 0.005, 0.5)
    end

    if curBeat == 100 then
        objectPlayAnimation('garage', 'not', true)
        setProperty('garage.alpha', 0.2)
    end

    if curBeat == 195 then
        objectPlayAnimation('garage', 'idle', true)
        setProperty('garage.alpha', 1)
    end
end