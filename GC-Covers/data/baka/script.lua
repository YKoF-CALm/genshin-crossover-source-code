function onStartCountdown()
    addLuaSprite('yuri', false)
    setProperty('yuri.x', 30)
    setProperty('yuri.y', 176)
    addLuaSprite('sayori', false)
    setProperty('sayori.x', 450)
    setProperty('sayori.y', 250)
    addLuaSprite('monika', false)
    setProperty('monika.x', 1250)
    setProperty('monika.y', 176)
    return Function_Continue;
end

function onCountdownTick(counter)
    if counter == 0 then
        characterPlayAnim('gf', 'three', true)
    end

    if counter == 1 then
        characterPlayAnim('gf', 'two', true)
    end

    if counter == 2 then
        characterPlayAnim('gf', 'one', true)
    end
    
    if counter == 3 then
        characterPlayAnim('gf', 'cheer', true)
    end
end

function onCreate()
    makeAnimatedLuaSprite('bf', 'characters/DDLCBoyFriend_Assets', 500, 500)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf', true)

    precacheImage('doki/clubroom/BakaBGDoodles')
end

function onStepHit()
    if curStep == 64 then
        addLuaSprite('doodles', false)
        doTweenAlpha('hi', 'doodles', 1, 4, linear)
    end

    if curStep == 128 then
        objectPlayAnimation('doodles', 'party rock is', true)
    end

    if curStep == 448 then
        doTweenAlpha('bye', 'doodles', 0, 4, linear)
    end

    if curStep == 576 then
        objectPlayAnimation('doodles', 'normal', true)
        doTweenAlpha('hi2', 'doodles', 1, 4, linear)
    end

    if curStep == 704 then
        objectPlayAnimation('doodles', 'party rock is', true)
    end

    if curStep == 1056 then
        doTweenAlpha('bye2', 'doodles', 0, 4, linear)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('yuri', 'idle', true)
        objectPlayAnimation('sayori', 'idle', true)
        objectPlayAnimation('monika', 'idle', true)
        objectPlayAnimation('bf', 'idle', true)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if curStep >= 128 and curStep <= 160 then
        cameraShake('game', 0.01, 0.05)
    end
end
