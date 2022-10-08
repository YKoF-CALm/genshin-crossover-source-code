function onCreate()
    makeAnimatedLuaSprite('aether', 'characters/aether-duality', 650, -70)
    addAnimationByPrefix('aether', 'idle', 'aether idle', 24, false)
    setProperty('aether.flipX', true)
    addLuaSprite('aether', false)

    setProperty('dad.x', getProperty('dad.x') - 200)
    setProperty('dad.y', getProperty('dad.y') + 20)
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 200)
    triggerEvent('Camera Follow Pos', 500, 420)

    makeLuaSprite('blackthing', '', 0, 0)
    makeGraphic('blackthing', screenWidth, screenHeight, '000000')
    setObjectCamera('blackthing', 'hud')

    makeLuaText("text", "It's not working!", 1000, screenWidth / 2 - 500, screenHeight / 2)
    setTextSize('text', 72)
    setProperty('text.alpha', 0)

    makeLuaText("text2", "You must remove her manually!", 1000, screenWidth / 2 - 500, screenHeight / 2)
    setTextSize('text2', 72)
    setProperty('text2.alpha', 0)

    makeLuaText("text3", "Good luck", 1000, screenWidth / 2 - 500, screenHeight / 2)
    setTextSize('text3', 72)
    setProperty('text3.alpha', 0)
end

function onBeatHit()
    if curBeat % 4 == 0 then
        objectPlayAnimation('aether', 'idle', true)
    end

    if curBeat == 648 then
        addLuaText('text')
        doTweenAlpha('hi', 'text', 1, 0.5, 'linear')
    end

    if curBeat == 664 then
        doTweenAlpha('bye', 'text', 0, 0.5, 'linear')
    end

    if curBeat == 680 then
        addLuaText('text2')
        doTweenAlpha('hi', 'text2', 1, 0.5, 'linear')
    end

    if curBeat == 696 then
        doTweenAlpha('bye', 'text2', 0, 0.5, 'linear')
    end

    if curBeat == 704 then
        addLuaText('text3')
        doTweenAlpha('hi', 'text3', 1, 0.5, 'linear')
    end

    if curBeat == 712 then
        doTweenAlpha('bye', 'text3', 0, 0.5, 'linear')
    end

    if curBeat == 790 then
        characterPlayAnim('boyfriend', 'pre-attack', true)
    end

    if curBeat == 792 then
        addLuaSprite('blackthing', false)
    end
end

function onStepHit()
    if curStep == 3166 then
        characterPlayAnim('boyfriend', 'attack', true)
    end
end