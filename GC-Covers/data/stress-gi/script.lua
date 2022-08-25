local tankmanIdleAllowed = true

function onCreate()
    makeAnimatedLuaSprite('bfgf', 'characters/bfAndGF', 1100, 380)
    addAnimationByPrefix('bfgf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bfgf', false)

    makeAnimatedLuaSprite('tankman', 'characters/tankmanCaptain_Animations', -300, 300)
    addAnimationByPrefix('tankman', 'idle', 'Tankman Idle Dance', 24, false)
    addAnimationByPrefix('tankman', 'good', 'PRETTY GOOD', 24, false)
    addOffset('tankman', 'idle', -5, 0)
    addOffset('tankman', 'good', -5, 15)
    setProperty('tankman.flipX', true)
    addLuaSprite('tankman', false)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('bfgf', 'idle', true)
        
        if tankmanIdleAllowed then
            playAnim('tankman', 'idle', true)
        end
    end

    if curBeat == 184 then
        tankmanIdleAllowed = false
        playAnim('tankman', 'good', true)
        playSound('tankmanhuh', 1)
    end

    if curBeat == 189 then
        playSound('tankmanprettygood', 1)
    end

    if curBeat == 192 then
        tankmanIdleAllowed = true
    end
end