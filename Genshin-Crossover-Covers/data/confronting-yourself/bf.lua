local bfx = 0
local bfy = 0

function onCreate()
    precacheImage('characters/BOYFRIEND_TABI')

    makeAnimatedLuaSprite('bfrock', 'shaggy/god_bg', 2350, 300)
    addAnimationByPrefix('bfrock', 'rock', 'rock', 24, true)
    scaleObject('bfrock', 0.5, 0.5)
    updateHitbox('bfrock')
    playAnim('bfrock', 'rock', true)
    addLuaSprite('bfrock', false)

    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', getProperty('bfrock.x') + 50, getProperty('bfrock.y') - 200)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addOffset('bf', 'idle', 0, 0)
    addAnimationByPrefix('bf', '0', 'BF NOTE LEFT0', 24, false)
    addOffset('bf', '0', 7, -4.2)
    addAnimationByPrefix('bf', '1', 'BF NOTE DOWN0', 24, false)
    addOffset('bf', '1', -3.5, -35)
    addAnimationByPrefix('bf', '2', 'BF NOTE UP0', 24, false)
    addOffset('bf', '2', -16.8, 18.9)
    addAnimationByPrefix('bf', '3', 'BF NOTE RIGHT0', 24, false)
    addOffset('bf', '3', -30.1, -4.9)
    scaleObject('bf', 0.7, 0.7)
    updateHitbox('bf')
    addLuaSprite('bf', false)

    makeAnimatedLuaSprite('bf2', 'characters/BOYFRIEND_TABI', getProperty('bfrock.x') + 50, getProperty('bfrock.y') - 200)
    addAnimationByPrefix('bf2', 'idle', 'BF idle dance', 24, false)
    addOffset('bf2', 'idle', 0, 0)
    addAnimationByPrefix('bf2', '0', 'BF NOTE LEFT0', 24, false)
    addOffset('bf2', '0', 7, -4.2)
    addAnimationByPrefix('bf2', '1', 'BF NOTE DOWN0', 24, false)
    addOffset('bf2', '1', -3.5, -35)
    addAnimationByPrefix('bf2', '2', 'BF NOTE UP0', 24, false)
    addOffset('bf2', '2', -23.8, 18.9)
    addAnimationByPrefix('bf2', '3', 'BF NOTE RIGHT0', 24, false)
    addOffset('bf2', '3', -30.1, -4.9)
    addAnimationByPrefix('bf2', 'pre-attack', 'bf pre attack', 24, false)
    addOffset('bf2', 'pre-attack', -24.5, -28)
    addAnimationByPrefix('bf2', 'attack', 'boyfriend attack', 24, false)
    addOffset('bf2', 'attack', 209.3, 186.9)
    scaleObject('bf2', 0.7, 0.7)
    updateHitbox('bf2')
    addLuaSprite('bf2', false)
    setProperty('bf2.alpha', 0)
end

function onUpdate(elapsed)
    if curStep < 16 then
        addLuaSprite('bf', false)
        addLuaSprite('bf2', false)
        addAnimationByPrefix('bf', '3', 'BF NOTE RIGHT0', 24, false)
        addOffset('bf', '3', -30.1, -4.9)
    end
    bfx = getProperty('bfrock.x') + 20
    bfy = getProperty('bfrock.y') - 270
    setProperty('bf.x', bfx)
    setProperty('bf.y', bfy)
    setProperty('bf2.x', bfx)
    setProperty('bf2.y', bfy)
end

local allowIdleBF = true
function goodNoteHit(id,d,t,s)  
    if t == "Special Sing" or t == "Special Static" or t == "Special Phantom" or t == "Duet Note" or t == "Static Note" or t == "Phantom Note" then
        if (curStep >= 192 and curStep < 224) or (curStep >= 896 and curStep < 1008) or (curStep >= 1244 and curStep < 1280) or (curStep >= 1360 and curStep < 1392) then
            playAnim('bf', d, true)
            playAnim('bf2', d, true)
            allowIdleBF = false
            runTimer('resumeIdleBF', 0.5, 1)
        end
    end
end

function onStepHit()
    if curStep == 16 then
        scaleObject('bf', 0.7, 0.7)
        updateHitbox('bf')
        scaleObject('bf2', 0.7, 0.7)
        updateHitbox('bf2')
    end

    if curStep == 192 then
        doTweenX('go2', 'bfrock', 500, 1, 'elasticInOut')
    end

    if curStep == 220 then
        doTweenX('back2', 'bfrock', 2150, 1, 'elasticInOut')
    end

    if curStep == 768 then
        setProperty('bf.alpha', 0)
        setProperty('bf2.alpha', 1)
    end

    if curStep == 896 then
        doTweenX('gogo2', 'bfrock', 500, 1, 'elasticInOut')
    end

    if curStep == 1010 then
        cancelTimer('resumeBFIdle')
        allowIdleBF = false
        playAnim('bf2', 'pre-attack', true)
    end

    if curStep == 1012 then
        playAnim('bf2', 'attack', true)
    end

    if curStep == 1016 then
        doTweenX('backback2', 'bfrock', 2150, 1, 'elasticInOut')
    end

    if curStep == 1024 then
        allowIdleBF = true
        setProperty('bf2.alpha', 0)
        setProperty('bf.alpha', 1)
    end

    if curStep == 1244 then
        setProperty('bfrock.y', 450)
        doTweenX('gogogo2', 'bfrock', 550, 1, 'elasticInOut')
    end

    if curStep == 1276 then
        doTweenX('backbackback2', 'bfrock', 2150, 1, 'elasticInOut')
    end

    if curStep == 1304 then
        setProperty('bfrock.y', 300)
    end

    if curStep == 1360 then
        doTweenX('gogogogo2', 'bfrock', 500, 1, 'elasticInOut')
    end

    if curStep == 1388 then
        doTweenX('backbackbackback2', 'bfrock', 2150, 1, 'elasticInOut')
    end

    if curStep % 8 == 0 then
        if allowIdleBF then
            playAnim('bf', 'idle', true)
            playAnim('bf2', 'idle', true)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeIdleBF' then
        allowIdleBF = true
    end
end