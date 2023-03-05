function onCreate()
    addCharacterToList('yanfei', 'dad')
    precacheImage('characters/xiao')
    
    setTextFont('scoreTxt', 'PhantomMuff.ttf')
    setTextFont('timeTxt','PhantomMuff.ttf')
    setTextFont('botplayTxt', 'PhantomMuff.ttf')

    setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)
    cameraSetTarget('boyfriend')

    makeAnimatedLuaSprite('xiao', 'characters/xiao', -200, 80)
    addAnimationByPrefix('xiao', 'idle', 'idle xiao', 24, false)

    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black', screenWidth, screenHeight, '000000')
    setObjectCamera('black', 'hud')

    makeLuaText('lyrics', 'Hey!', 500, screenWidth / 4 + 80, screenHeight / 2 - 50)
    setTextSize('lyrics', 80)
    setTextColor('lyrics', 'FFAF7A')
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('xiao', 'idle', true)
    end
end

function onStepHit()
    if curStep == 672 then
        addLuaSprite('xiao', false)
        addLuaSprite('black', false)
        addLuaText('lyrics')
    end

    if curStep == 673 then
        setProperty('dad.y', getProperty('dad.y') - 8)
    end

    if curStep == 677 then
        setTextString('lyrics', 'Leave')
    end

    if curStep == 678 then
        setTextString('lyrics', 'It')
    end

    if curStep == 679 then
        runTimer('change', 0.1, 1)
    end

    if curStep == 681 then
        setTextString('lyrics', 'Me!')
    end

    if curStep == 688 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
        removeLuaSprite('black')
        removeLuaText('lyrics')
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if dadName == 'yanfei-annoyed-NEW' then
        if getProperty('health') > 0.02 then
            setProperty('health', getProperty('health') - 0.02)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'change' then
        setTextString('lyrics', 'To')
    end
end