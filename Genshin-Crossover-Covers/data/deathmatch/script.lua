function onCreate()
    addCharacterToList('ganyu-mad-player', 'boyfriend')
    addCharacterToList('yanfei-player', 'boyfriend')
    addCharacterToList('xiao-player', 'boyfriend')
    addCharacterToList('hutao-player', 'boyfriend')
    addCharacterToList('zhongli-mad', 'dad')
    addCharacterToList('zhongli', 'dad')

    setProperty('boyfriend.x', getProperty('boyfriend.x') + 100)
    cameraSetTarget('boyfriend')

    if flashingLights then
        makeLuaSprite('preflash', '', 0, 0)
        makeGraphic('preflash', screenWidth, screenHeight, 'FFFFFF')
        setObjectCamera('preflash', 'hud')
        addLuaSprite('preflash', false)
        setProperty('preflash.alpha', 0)
    end
end

local theStep = 10000

function onStepHit()
    if flashingLights then
        if curStep == 762 or curStep == 1018 or curStep == 1402 or curStep == 1658 then
            doTweenAlpha('preflash', 'preflash', 1, 0.6, 'quadIn')
            theStep = curStep
        end
    
        if curStep == (theStep + 6) or curStep == 2176 then
            cameraFlash('hud', 'FFFFFF', 0.8, true)
            cancelTween('preflash')
            setProperty('preflash.alpha', 0)
        end

        if curStep == 2162 then
            doTweenAlpha('preflash', 'preflash', 1, 1.2, 'quadIn')
        end
    end

    if curStep == 768 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') - 15)
    end

    if curStep == 1024 or curStep == 1408 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
    end

    if curStep == 1664 then
        setProperty('boyfriend.x', getProperty('boyfriend.x') + 100)
    end
end