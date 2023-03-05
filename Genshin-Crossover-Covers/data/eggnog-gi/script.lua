function onCreate()
    precacheImage('secondicons/ganyu-normal')
    precacheImage('secondicons/ganyu-danger')
    precacheImage('secondicons/xiao-normal')
    precacheImage('secondicons/xiao-danger')
    makeAnimatedLuaSprite('ganyu', 'characters/Ganyu-Santa', 100, 80)
    addAnimationByPrefix('ganyu', 'idle', 'idle ganyu', 24, false)
    addOffset('ganyu', 'idle', 0, 0)
    addAnimationByPrefix('ganyu', '0', 'singleft ganyu', 24, false)
    addOffset('ganyu', '0', 59, 0)
    addAnimationByPrefix('ganyu', '1', 'singdown ganyu', 24, false)
    addOffset('ganyu', '1', 15, -30)
    addAnimationByPrefix('ganyu', '2', 'singup ganyu', 24, false)
    addOffset('ganyu', '2', 9, 0)
    addAnimationByPrefix('ganyu', '3', 'singright ganyu', 24, false)
    addOffset('ganyu', '3', 2, 0)
    addLuaSprite('ganyu', false)

    makeAnimatedLuaSprite('bf', 'characters/bfChristmas', 600, 450)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addOffset('bf', 'idle', 0, 0)
    addAnimationByPrefix('bf', 'hey', 'BF HEY!!', 24, false)
    addOffset('bf', 'hey', 0, 4)
    addLuaSprite('bf', true)

    setProperty('dad.x', getProperty('dad.x') - 300)
    setProperty('dad.y', getProperty('dad.y') + 20)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)

    triggerEvent('Camera Follow Pos', 1200, 400)
    setProperty('iconP2.visible', false)
end

function onCreatePost()
    makeLuaSprite('ganyuIcon', 'secondicons/ganyu-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('ganyuIcon', 'hud')
    addLuaSprite('ganyuIcon', true)
    setObjectOrder('ganyuIcon', getObjectOrder('iconP2') + 1)
    setProperty('ganyuIcon.flipX', false)
    setProperty('ganyuIcon.visible', true)

    makeLuaSprite('ganyuDangerIcon', 'secondicons/ganyu-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('ganyuDangerIcon', 'hud')
    addLuaSprite('ganyuDangerIcon', true)
    setObjectOrder('ganyuDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('ganyuDangerIcon.flipX', false)
    setProperty('ganyuDangerIcon.visible', false)

    makeLuaSprite('xiaoIcon', 'secondicons/xiao-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xiaoIcon', 'hud')
    addLuaSprite('xiaoIcon', true)
    setObjectOrder('xiaoIcon', getObjectOrder('ganyuIcon') - 1)
    setProperty('xiaoIcon.flipX', false)
    setProperty('xiaoIcon.visible', true)

    makeLuaSprite('xiaoDangerIcon', 'secondicons/xiao-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xiaoDangerIcon', 'hud')
    addLuaSprite('xiaoDangerIcon', true)
    setObjectOrder('xiaoDangerIcon', getObjectOrder('ganyuDangerIcon') - 1)
    setProperty('xiaoDangerIcon.flipX', false)
    setProperty('xiaoDangerIcon.visible', false)
end

function onUpdate(elapsed)
    if mustHitSection then
        triggerEvent('Camera Follow Pos', 1200, 400)
    else
        triggerEvent('Camera Follow Pos', 200, 400)
    end

    if getProperty('health') > 1.6 then
        setProperty('ganyuIcon.visible', false)
        setProperty('ganyuDangerIcon.visible', true)
        setProperty('xiaoIcon.visible', false)
        setProperty('xiaoDangerIcon.visible', true)
    else
        setProperty('ganyuIcon.visible', true)
        setProperty('ganyuDangerIcon.visible', false)
        setProperty('xiaoIcon.visible', true)
        setProperty('xiaoDangerIcon.visible', false)
    end
end

function onUpdatePost(elapsed)
    setProperty('xiaoIcon.x', getProperty('iconP2.x') - 25)
    setProperty('xiaoIcon.angle', getProperty('iconP2.angle'))
    setProperty('xiaoIcon.y', getProperty('iconP2.y') - 25)
    setProperty('xiaoIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('xiaoIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('xiaoDangerIcon.x', getProperty('iconP2.x') - 25)
    setProperty('xiaoDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('xiaoDangerIcon.y', getProperty('iconP2.y') - 25)
    setProperty('xiaoDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('xiaoDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('ganyuIcon.x', getProperty('iconP2.x') + 25)
    setProperty('ganyuIcon.angle', getProperty('iconP2.angle'))
    setProperty('ganyuIcon.y', getProperty('iconP2.y') + 25)
    setProperty('ganyuIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('ganyuIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('ganyuDangerIcon.x', getProperty('iconP2.x') + 25)
    setProperty('ganyuDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('ganyuDangerIcon.y', getProperty('iconP2.y') + 25)
    setProperty('ganyuDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('ganyuDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)
end

local ganyuidle = true
local bfidle = true

function onBeatHit()
    if curBeat % 2 == 0 then
        if ganyuidle then
            playAnim('ganyu', 'idle', true)
        end
        if bfidle then
            playAnim('bf', 'idle', true)
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Special Sing' then
        playAnim('ganyu', direction, true)
        ganyuidle = false
        runTimer('resumegidle', 0.5, 1)
    end
end

function onEvent(name, value1, value2)
    if name == 'Hey!' then
        playAnim('bf', 'hey', true)
        bfidle = false
        runTimer('resumebidle', 0.5, 1)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumegidle' then
        ganyuidle = true
    end

    if tag == 'resumebidle' then
        bfidle = true
    end
end