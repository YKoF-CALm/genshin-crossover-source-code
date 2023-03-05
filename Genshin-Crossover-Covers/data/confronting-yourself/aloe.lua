local aloex = 0
local aloey = 0

function onCreate()
    precacheImage('characters/Aloe')

    makeAnimatedLuaSprite('aloerock', 'shaggy/god_bg', 2250, 300)
    addAnimationByPrefix('aloerock', 'rock', 'rock', 24, true)
    scaleObject('aloerock', 0.5, 0.5)
    updateHitbox('aloerock')
    playAnim('aloerock', 'rock', true)
    addLuaSprite('aloerock', false)

    makeAnimatedLuaSprite('aloe', 'characters/Aloe', getProperty('aloerock.x') + 50, getProperty('aloerock.y') - 200)
    addAnimationByPrefix('aloe', 'idle', 'BF idle dance', 24, false)
    addOffset('aloe', 'idle', 0, 0)
    addAnimationByPrefix('aloe', '0', 'BF NOTE LEFT0', 24, false)
    addOffset('aloe', '0', 2.8, -7.7)
    addAnimationByPrefix('aloe', '1', 'BF NOTE DOWN0', 24, false)
    addOffset('aloe', '1', 16.8, -37.1)
    addAnimationByPrefix('aloe', '2', 'BF NOTE UP0', 24, false)
    addOffset('aloe', '2', -12.6, 15.4)
    addAnimationByPrefix('aloe', '3', 'BF NOTE RIGHT0', 24, false)
    addOffset('aloe', '3', -16.8, -2.1)
    scaleObject('aloe', 0.7, 0.7)
    updateHitbox('aloe')
    addLuaSprite('aloe', false)

    makeAnimatedLuaSprite('aloe2', 'characters/Aloe', getProperty('aloerock.x') + 50, getProperty('aloerock.y') - 200)
    addAnimationByPrefix('aloe2', 'idle', 'BF idle fard', 24, false)
    addOffset('aloe2', 'idle', 0, 0)
    addAnimationByPrefix('aloe2', '0', 'BF NOTE LEFT alt', 24, false)
    addOffset('aloe2', '0', 2.8, -7.7)
    addAnimationByPrefix('aloe2', '1', 'BF NOTE DOWN alt', 24, false)
    addOffset('aloe2', '1', 16.8, -37.1)
    addAnimationByPrefix('aloe2', '2', 'BF NOTE UP alt', 24, false)
    addOffset('aloe2', '2', -12.6, 15.4)
    addAnimationByPrefix('aloe2', '3', 'BF NOTE RIGHT alt', 24, false)
    addOffset('aloe2', '3', -16.8, -2.1)
    addAnimationByPrefix('aloe2', 'hey', 'BF HEY!!', 24, false)
    addOffset('aloe2', 'hey', -7.7, -0.7)
    scaleObject('aloe2', 0.7, 0.7)
    updateHitbox('aloe2')
    addLuaSprite('aloe2', false)
    setProperty('aloe2.alpha', 0)
end

function onUpdate(elapsed)
    aloex = getProperty('aloerock.x') + 20
    aloey = getProperty('aloerock.y') - 270
    setProperty('aloe.x', aloex)
    setProperty('aloe.y', aloey)
    setProperty('aloe2.x', aloex)
    setProperty('aloe2.y', aloey)
end

local allowIdleAloe = true
function goodNoteHit(id,d,t,s)   
    if t == "Special Sing" or t == "Special Static" or t == "Special Phantom" or t == "Duet Note" or t == "Static Note" or t == "Phantom Note" then
        if (curStep >= 160 and curStep < 192) or (curStep >= 832 and curStep < 896) or (curStep >= 1136 and curStep < 1224) or (curStep >= 1312 and curStep < 1328) then
	        playAnim('aloe', d, true)
            playAnim('aloe2', d, true)
            allowIdleAloe = false
            runTimer('resumeIdleAloe', 0.5, 1)
        end
    end
end

function onStepHit()
    if curStep == 160 then
        doTweenX('go1', 'aloerock', 600, 1, 'elasticInOut')
    end

    if curStep == 188 then
        doTweenX('back1', 'aloerock', 2250, 1, 'elasticInOut')
    end

    if curStep == 768 then
        setProperty('aloe.alpha', 0)
        setProperty('aloe2.alpha', 1)
    end

    if curStep == 824 then
        doTweenX('gogo1', 'aloerock', 600, 1, 'elasticInOut')
    end

    if curStep == 892 then
        doTweenX('backback1', 'aloerock', 2250, 1, 'elasticInOut')
    end

    if curStep == 992 then
        doTweenX('gogo1.5', 'aloerock', 750, 1, 'elasticInOut')
    end

    if curStep == 1010 then
        allowIdleAloe = false
    end

    if curStep == 1012 then
        playAnim('aloe2', 'hey', true)
    end

    if curStep == 1016 then
        doTweenX('backback1.5', 'aloerock', 2250, 1, 'elasticInOut')
    end

    if curStep == 1024 then
        allowIdleAloe = true
        setProperty('aloe2.alpha', 0)
        setProperty('aloe.alpha', 1)
    end

    if curStep == 1136 then
        doTweenX('gogogo1', 'aloerock', 600, 1, 'elasticInOut')
    end

    if curStep == 1212 then
        doTweenX('backbackback1', 'aloerock', 2250, 1, 'elasticInOut')
    end

    if curStep == 1304 then
        doTweenX('gogogogo1', 'aloerock', 600, 1, 'elasticInOut')
    end

    if curStep == 1324 then
        doTweenX('backbackbackback1', 'aloerock', 2250, 1, 'elasticInOut')
    end

    if curStep % 8 == 0 then
        if allowIdleAloe then
            playAnim('aloe', 'idle', true)
            playAnim('aloe2', 'idle', true)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeIdleAloe' then
        allowIdleAloe = true
    end
end