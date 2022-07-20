function onCreate()
    makeLuaSprite('screamstatic', 'holofunk/russia/scream_overlay', -750, -1000);
    scaleLuaSprite('screamstatic', 100, 100);
    addLuaSprite('screamstatic', true)
    setPropertyLuaSprite('screamstatic', 'alpha', 0)

    precacheImage('holofunk/russia/scream_overlay')
    precacheSound('staticSound')

    setProperty('camHUD.visible', false)

    triggerEvent('Camera Follow Pos', 500, 300)
    setProperty("camGame.zoom", 0.55)
    setCharacterY(boyfriend, 150)

    setProperty('skipCountdown', true)

    makeLuaSprite('ready', 'holofunk/ready', screenWidth / 4 + 50, screenHeight / 4 + 20)
    scaleObject('ready', 0.6, 0.6)
    updateHitbox('ready')
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'holofunk/set', screenWidth / 4 + 10, screenHeight / 4 + 10)
    scaleObject('set', 0.6, 0.6)
    updateHitbox('set')
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'holofunk/go', screenWidth / 4 + 40, screenHeight / 4 + 20)
    scaleObject('go', 0.6, 0.6)
    updateHitbox('go')
    setObjectCamera('go', 'other')
end

function onStepHit()
    if curStep == 240 then
        playSound('intro3')
    end

    if curStep == 244 then
        playSound('intro2')
        addLuaSprite('ready', true)
        doTweenAlpha('Ready', 'ready', '0', crochet/1000, 'cubeInOut')
    end

    if curStep == 248 then
        playSound('intro1')
        addLuaSprite('set', true)
        doTweenAlpha('Set', 'set', '0', crochet/1000, 'cubeInOut')
    end

    if curStep == 252 then
        playSound('introGo')
        addLuaSprite('go', true)
        doTweenAlpha('Go', 'go', '0', crochet/1000, 'cubeInOut')
    end

    if curStep == 256 then
        setProperty('camHUD.visible', true)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
    setProperty('health', health + 0.02);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    health = getProperty('health')
    if getProperty('health') > 0.01 then
        setProperty('health', health- 0.01);
    end

    if curBeat >= 544 and curBeat <= 607 then
        --do nothing
    else
        triggerEvent('Screen Shake', '0.05, 0.005', '0.05, 0.005')
    end
    
    if noteType == 'screamnote' then
        runTimer('ScreamTime', 0, 1)
        runTimer('ScreamAlpha', 0.3, 1)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'ScreamTime' then
        playSound('staticSound', 0.6)
        setPropertyLuaSprite('screamstatic', 'alpha', 1)
	end

    if tag == 'ScreamAlpha' then
        setPropertyLuaSprite('screamstatic', 'alpha', 0)
    end
end