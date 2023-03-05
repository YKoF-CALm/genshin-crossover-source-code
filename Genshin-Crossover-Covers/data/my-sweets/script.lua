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

    addLuaSprite('yuri', false)
    setProperty('yuri.x', 30)
    setProperty('yuri.y', 176)
    addLuaSprite('sayori', false)
    setProperty('sayori.x', 450)
    setProperty('sayori.y', 250)
    addLuaSprite('monika', false)
    setProperty('monika.x', 1250)
    setProperty('monika.y', 176)

    setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 2)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('yuri', 'idle', true)
        objectPlayAnimation('sayori', 'idle', true)
        objectPlayAnimation('monika', 'idle', true)
        objectPlayAnimation('bf', 'idle', true)
    end
end