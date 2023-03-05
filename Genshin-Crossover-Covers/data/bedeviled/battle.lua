local maxammo = 30
local ammo = maxammo

function onCreate()
    precacheImage('genshin/geo bullet')
    precacheSound('hankshoot')
    precacheSound('hankded')

    makeLuaSprite('line', '', 1200, 0)
    makeGraphic('line', 20, screenHeight, '000000')
    setObjectCamera('line', 'hud')
    setProperty('line.alpha', 0.2)
    addLuaSprite('line', false)

    makeLuaSprite('crosshair','crosshair',0,0)
    scaleLuaSprite('crosshair', 0.8, 0.8)
    setObjectCamera('crosshair', 'hud')
	addLuaSprite('crosshair',true)

    makeLuaText('ammocount', ammo..'/'..maxammo, 200, 1000, 600)
    setTextSize('ammocount', 48)
    addLuaText('ammocount')

    makeLuaText('inst', 'LClick to shoot, RClick to reload', 500, 400, 350)
    setTextSize('inst', 20)
    setProperty('inst.alpha', 0)
    addLuaText('inst')

    makeLuaText('inst2', 'Bullets spawn from the left\nShoot to regain health', 500, -50, 200)
    setTextSize('inst2', 20)
    setProperty('inst2.alpha', 0)
    addLuaText('inst2')

    makeLuaText('inst3', 'If bullets hit this line,\nyou lose health', 500, 800, 450)
    setTextSize('inst3', 20)
    setProperty('inst3.alpha', 0)
    addLuaText('inst3')
end

local num = 0
local num2 = 0
local bullety = 0
local spawn = 0
local canshoot = false
local canreload = false

function onSongStart()
    canshoot = true
end

function spawnBullet()
    makeAnimatedLuaSprite('bullet'..num, 'genshin/geo bullet', 0, bullety)
    addAnimationByPrefix('bullet'..num, 'idle', 'geo bullet', 24, true)
    setProperty('bullet'..num..'.angle', 90)
    setProperty('bullet'..num..'.velocity.x', 400)
    setObjectCamera('bullet'..num, 'hud')
    updateHitbox('bullet'..num)
    addLuaSprite('bullet'..num, false)
    playAnim('bullet'..num, 'idle', true)
    num = num + 1
end

function reload()
    playAnim('gf', 'reloading', true)
    setProperty('gf.specialAnim', true)
    playSound('reloading', 1)
    canshoot = false
    canreload = false
end

function onUpdate(elapsed)
    setProperty('crosshair.x',getMouseX('camHUD'));
	setProperty('crosshair.y',getMouseY('camHUD'));
    setProperty('crosshair.offset.x',75);
	setProperty('crosshair.offset.y',75);
    setTextString('ammocount', ammo..'/'..maxammo)
    bullety = math.random(150, 450)

    if objectsOverlap('bullet'..num2, 'line') then
        setProperty('health', getProperty('health') - 0.4)
        playSound('hankded', 0.6)
        removeLuaSprite('bullet'..num2)
        num2 = num2 + 1
    end

    if mousePressed('left') and ammo >= 1 and canshoot then
        playAnim('gf', 'attack', true)
        setProperty('gf.specialAnim', true)
        playSound('hankshoot', 1)
        ammo = ammo - 1
        if objectsOverlap('bullet'..num2, 'crosshair') then
            setProperty('health', getProperty('health') + 0.2)
            removeLuaSprite('bullet'..num2)
            num2 = num2 + 1
            addScore(1000)
        else
            setProperty('health', getProperty('health') + 0.01)
        end
        canshoot = false
        canreload = true
        runTimer('fire', 0.1, 1)
    end

    if mouseClicked('right') and canreload then
        reload()
    end

    if getProperty('gf.animation.curAnim.finished') and getProperty('gf.animation.curAnim.name') == 'reloading' then
        ammo = 30
        canshoot = true
    end

    if getProperty('gf.animation.curAnim.finished') and getProperty('gf.animation.curAnim.name') == 'attack' then
        canreload = true
    end
end

function onStepHit()
    if curStep == 1 then
        doTweenAlpha('hi', 'inst', 1, 0.5, 'quartIn')
        doTweenAlpha('hi2', 'inst2', 1, 0.5, 'quartIn')
        doTweenAlpha('hi3', 'inst3', 1, 0.5, 'quartIn')
    end

    if curStep == 49 then
        doTweenAlpha('bye', 'inst', 0, 0.5, 'quartIn')
        doTweenAlpha('bye2', 'inst2', 0, 0.5, 'quartIn')
        doTweenAlpha('bye3', 'inst3', 0, 0.5, 'quartIn')
    end

    if curStep == 64 then
        removeLuaText('inst')
        removeLuaText('inst2')
        removeLuaText('inst3')
    end

    if curBeat >= 16 and curBeat <= 287 then
        if curStep % 2 == 0 then
            spawn = math.random(0, 10)
            if spawn % 5 == 0 then
                spawnBullet()
            end
        end
    end
end

function onEndSong()
    canshoot = false
    canreload = false
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'fire' then
        canshoot = true
    end
end
