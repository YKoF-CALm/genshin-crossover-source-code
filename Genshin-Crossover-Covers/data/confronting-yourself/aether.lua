local aetherx = 0
local aethery = 0

function onCreate()
    precacheImage('characters/aether-battle')

    makeAnimatedLuaSprite('aetherrock', 'shaggy/god_bg', 2250, 400)
    addAnimationByPrefix('aetherrock', 'rock', 'rock', 24, true)
    scaleObject('aetherrock', 0.5, 0.5)
    updateHitbox('aetherrock')
    playAnim('aetherrock', 'rock', true)
    addLuaSprite('aetherrock', false)

    makeAnimatedLuaSprite('aether', 'characters/aether-battle', getProperty('aetherrock.x') - 150, getProperty('aetherrock.y') - 550)
	addAnimationByPrefix('aether', 'idle', 'aether-battle idle', 24, false)
    addOffset('aether', 'idle', 0, 0)
    addAnimationByPrefix('aether', '0', 'aether-battle right', 24, false)
    addOffset('aether', '0', 35, 0)
    addAnimationByPrefix('aether', '1', 'aether-battle down', 24, false)
    addOffset('aether', '1', 53.2, 0)
    addAnimationByPrefix('aether', '2', 'aether-battle up', 24, false)
    addOffset('aether', '2', 14, 0)
    addAnimationByPrefix('aether', '3', 'aether-battle left', 24, false)
    addOffset('aether', '3', 25.2, 0)
    scaleObject('aether', 0.7, 0.7)
    updateHitbox('aether')
    setProperty('aether.flipX', true)
	addLuaSprite('aether', false)
end

function onUpdate(elapsed)
    if curStep < 16 then
        addLuaSprite('aether', false)
        addAnimationByPrefix('aether', '1', 'aether-battle down', 24, false)
        addOffset('aether', '1', 53.2, 0)
        addAnimationByPrefix('aether', '2', 'aether-battle up', 24, false)
        addOffset('aether', '2', 14, 0)
        addAnimationByPrefix('aether', '3', 'aether-battle left', 24, false)
        addOffset('aether', '3', 25.2, 0)
        scaleObject('aether', 0.7, 0.7)
        updateHitbox('aether')
        setProperty('aether.flipX', true)
    end
    aetherx = getProperty('aetherrock.x') - 300
    aethery = getProperty('aetherrock.y') - 700
    setProperty('aether.x', aetherx)
    setProperty('aether.y', aethery)
end

local allowIdleAether = true
function goodNoteHit(id,d,t,s) 
    if t == "Special Sing" or t == "Special Static" or t == "Special Phantom" or t == "Duet Note" or t == "Static Note" or t == "Phantom Note" then
        if (curStep >= 224 and curStep < 256) or (curStep >= 1244 and curStep < 1280) or (curStep >= 1328 and curStep < 1360) then
            playAnim('aether', d, true)
            allowIdleAether = false
            runTimer('resumeIdleAether', 0.5, 1)
        end
    end
end

function onStepHit()
    if curStep == 224 then
        doTweenX('go3', 'aetherrock', 600, 1, 'elasticInOut')
    end

    if curStep == 252 then
        doTweenX('back3', 'aetherrock', 2250, 1, 'elasticInOut')
    end

    if curStep == 1244 then
        doTweenX('gogogo3', 'aetherrock', 400, 1, 'elasticInOut')
    end

    if curStep == 1276 then
        doTweenX('backbackback3', 'aetherrock', 2250, 1, 'elasticInOut')
    end

    if curStep == 1328 then
        doTweenX('gogogogo3', 'aetherrock', 600, 1, 'elasticInOut')
    end

    if curStep == 1356 then
        doTweenX('backbackbackback3', 'aetherrock', 2250, 1, 'elasticInOut')
    end

    if curStep % 8 == 0 then
        if allowIdleAether then
            playAnim('aether', 'idle', true)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeIdleAether' then
        allowIdleAether = true
    end
end