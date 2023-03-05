function onCreate()
    setProperty('boyfriend.scale.x', 0.7)
    setProperty('boyfriend.scale.y', 0.7)
    setProperty('dad.scale.x', 0.7)
    setProperty('dad.scale.y', 0.7)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 80)
    setProperty('dad.y', getProperty('dad.y') + 50)
    setProperty('dad.x', getProperty('dad.x') - 100)

    makeLuaSprite('ready', 'corruption/takeover/ready', screenWidth / 4 - 100, screenHeight / 4)
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'corruption/takeover/set', screenWidth / 4 - 70, screenHeight / 4)
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'corruption/takeover/go', screenWidth / 4 + 50, screenHeight / 4 - 20)
    setObjectCamera('go', 'other')

    setProperty('introSoundsSuffix', '-corrupt')
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

local xx = 600
local yy = 350
local xx2 = 700
local yy2 = 350
local ofs = 20
local followchars = true

function onUpdate(elapsed)
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'attack' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'dodge' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    end
end

function onStepHit()
    if curStep == 1115 then
        setProperty('black.alpha', 1)
        setProperty('tvscreen.visible', true)
        setProperty('scoreTxt.alpha', 0);
		setProperty('healthBar.alpha', 0);
		setProperty('healthBarBG.alpha', 0);
		setProperty('iconP1.alpha', 0);
		setProperty('iconP2.alpha', 0);
    end

    if curStep == 1120 then
        doTweenAlpha('scene1', 'scenes', 1, 0.5, 'quartIn')
        doTweenAlpha('p1', 'p1', 1, 0.5, 'quartIn')
        playAnim('scenes', 'skidnene', true)
    end

    if curStep == 1136 then
        doTweenAlpha('scene1', 'scenes', 0, 0.8, 'quartIn')
        doTweenAlpha('p1', 'p1', 0, 0.8, 'quartIn')
    end

    if curStep == 1152 then
        setProperty('scenes.alpha', 1)
        playAnim('scenes', 'tabiwhitty', true)
    end

    if curStep == 1168 then
        doTweenAlpha('scene1', 'scenes', 0, 0.8, 'quartIn')
    end

    if curStep == 1184 then
        setProperty('scenes.alpha', 1)
        setProperty('p3.alpha', 1)
        playAnim('scenes', 'ruvsarv', true)
    end

    if curStep == 1200 then
        doTweenAlpha('scene1', 'scenes', 0, 0.8, 'quartIn')
        doTweenAlpha('p3', 'p3', 0, 0.8, 'quartIn')
    end

    if curStep == 1216 then
        setProperty('scenes.alpha', 1)
        playAnim('scenes', 'lemlila', true)
    end

    if curStep == 1232 then
        doTweenAlpha('scene1', 'scenes', 0, 0.8, 'quartIn')
    end

    if curStep == 1248 then
        setProperty('scenes.alpha', 1)
        setProperty('p2.alpha', 1)
        playAnim('scenes', 'dd1', true)
    end

    if curStep == 1264 or curStep == 1296 or curStep == 1328 or curStep == 1376 then
        doTweenAlpha('scene1', 'scenes', 0, 0.8, 'quartIn')
        doTweenAlpha('p2', 'p2', 0, 0.8, 'quartIn')
    end

    if curStep == 1280 then
        setProperty('scenes.alpha', 1)
        setProperty('p2.alpha', 1)
        playAnim('scenes', 'gf', true)
    end

    if curStep == 1312 then
        setProperty('scenes.alpha', 1)
        setProperty('p2.alpha', 1)
        playAnim('scenes', 'dd2', true)
    end

    if curStep == 1344 then
        setProperty('scenes.alpha', 1)
        setProperty('p2.alpha', 1)
        playAnim('scenes', 'dd3', true)
    end

    if curStep == 1376 then
        doTweenAlpha('score', 'scoreTxt', 1, 0.8, 'quartIn')
        doTweenAlpha('health', 'healthBar', 1, 0.8, 'quartIn')
        doTweenAlpha('healthbg', 'healthBarBG', 1, 0.8, 'quartIn')
        doTweenAlpha('icon1', 'iconP1', 1, 0.8, 'quartIn')
        doTweenAlpha('icon2', 'iconP2', 1, 0.8, 'quartIn')
    end

    if curStep == 1384 then
        removeLuaSprite('scenes', true)
        removeLuaSprite('tvscreen', false)
        removeLuaSprite('p2', true)
        removeLuaSprite('p1', true)
        removeLuaSprite('p3', true)
        doTweenAlpha('black', 'black', 0, 0.8, 'quartIn')
    end

    if curStep == 1663 then
        followchars = false
    end

    if curStep == 1664 then
        setProperty('black.alpha', 1)
        doTweenAlpha('bye', 'camHUD', 0, 0.8, 'quartIn')
        addLuaSprite('tvscreen', true)
        setProperty('tvscreen.visible', true)
    end

    if curStep == 1848 then
        doTweenAlpha('bye2', 'camGame', 0, 0.8, 'quartIn')
    end
end