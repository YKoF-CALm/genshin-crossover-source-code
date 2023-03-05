local bfx = 0
local bfy = 0
local dadx = 0
local dady = 0

function onCreate()
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 115)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 400)
    bfy = getProperty('boyfriend.y')
    bfx = getProperty('boyfriend.x')
    dadx = getProperty('dad.x')
    dady = getProperty('dad.y')
    setProperty('gf.flipX', false)
    setProperty('gf.y', getProperty('gf.y') + 20)
    setProperty('gf.x', getProperty('gf.x') + 400)
    setProperty('dad.y', getProperty('dad.y') + 100)
    cameraSetTarget('dad')

    makeLuaSprite('ready', 'corruption/fcr/ready', screenWidth / 4 - 50, screenHeight / 4)
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'corruption/fcr/set', screenWidth / 4 - 20, screenHeight / 4)
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'corruption/fcr/go', screenWidth / 4, screenHeight / 4 - 20)
    setObjectCamera('go', 'other')

    makeAnimatedLuaSprite('ganyu', 'characters/MAD GANYU', 1500, 200)
    addAnimationByPrefix('ganyu', 'idle', 'idle ganyu', 24, false)
    setProperty('ganyu.flipX', true)
    addLuaSprite('ganyu', false)

    makeLuaSprite('preflash', '', 0, 0)
    makeGraphic('preflash', screenWidth, screenHeight, 'FFFFFF')
    setObjectCamera('preflash', 'hud')
    addLuaSprite('preflash', false)
    setProperty('preflash.alpha', 0)
end

function onCountdownTick(counter)
	setProperty('countdownReady.visible', 0)
    setProperty('countdownSet.visible', 0)
    setProperty('countdownGo.visible', 0)
	if counter == 1 then
        addLuaSprite('ready', true)
        doTweenAlpha('Ready', 'ready', '0', crochet/1000, 'cubeInOut')
    end
    if counter == 2 then
        addLuaSprite('set', true)
        doTweenAlpha('Set', 'set', '0', crochet/1000, 'cubeInOut')
    end
    if counter == 3 then
        addLuaSprite('go', true)
        doTweenAlpha('Go', 'go', '0', crochet/1000, 'cubeInOut')
    end
end

local xx = 500
local yy = 500
local xx2 = 1200
local yy2 = 500

function onUpdate(elapsed)
    if not mustHitSection then
        triggerEvent('Camera Follow Pos', xx, yy)
    else
        triggerEvent('Camera Follow Pos', xx2, yy2)
    end
end

function onBeatHit()
    if curBeat == 128 then
        setProperty('boyfriend.x', bfx - 150)
        setProperty('boyfriend.y', bfy - 10)
        cameraFlash('hud', '000000', 0.3, true)
        cancelTween('preflash')
        setProperty('preflash.alpha', 0)
    end

    if curBeat == 336 then
        setProperty('dad.x', dadx)
        setProperty('dad.y', dady + 240)
    end

    if curBeat % 2 == 0 then
        playAnim('ganyu', 'idle', true)
    end
end

function onStepHit()
    if curStep == 511 then
        doTweenAlpha('preflash', 'preflash', 1, 0.1, 'quadIn')
    end
end