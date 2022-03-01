function onStartCountdown()
    setCharacterX('dad', -500)
    setCharacterY('dad', 0)
    setCharacterX('boyfriend', 700)
    setCharacterY('boyfriend', 250)
    return Function_Continue;
end

function onUpdate(elapsed)
    xx = 300;
    yy = 300;
    ofs = 60;
    followchars = true;
    del = 0;
    del2 = 0;

    if curStep >= 208 and curStep <= 255 then
        exception = 1
    elseif curStep >= 2000 and curStep <= 2047 then
        exception = 1
    else
        exception = 0
    end

    bfname = getProperty('boyfriend.curCharacter')
    if bfname == 'ei-sword' then
        xx2 = 500;
        yy2 = 300;
    else
        xx2 = 500;
        yy2 = 400;
    end

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true and exception == 0 then
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
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
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
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    elseif followchars == false and exception == 0 then
        triggerEvent('Camera Follow Pos','','')
    end
    
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.3 then
        setProperty('health', health- 0.01);
    end
end

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'sonic'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'cysgameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'cysgameOverEnd'); --put in mods/music/
    --[[
    addCharacterToList('aloe', 'boyfriend')
    addCharacterToList('bf_tabi', 'boyfriend')
    addCharacterToList('aether-battle-player', 'boyfriend')
    addCharacterToList('bf', 'boyfriend')
    addCharacterToList('ei-fly2', 'boyfriend')
    addCharacterToList('ei-sword-alt', 'boyfriend')
    addCharacterToList('ei-sword', 'boyfriend')
    addCharacterToList('raiden-shogun', 'dad')
    ]]

    makeAnimatedLuaSprite('bgrock', 'shaggy/god_bg', 300, 300)
    addAnimationByPrefix('bgrock', 'rock', 'rock', 24, true)
    objectPlayAnimation('bgrock', 'rock', true)
    addLuaSprite('bgrock', false)

    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND_TABI', 270, 50)
    addAnimationByPrefix('bf', 'stressed', 'BF idle dance', 24, false)
    addAnimationByPrefix('bf', 'prep', 'bf pre attack', 24, false)
    addAnimationByPrefix('bf', 'attack', 'boyfriend attack', 24, false)

    makeAnimatedLuaSprite('bf2', 'characters/BOYFRIEND', 270, 50)
    addAnimationByPrefix('bf2', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf2', false)

    makeAnimatedLuaSprite('bf3', 'characters/BOYFRIEND_TABI', -175, -225)
    addAnimationByPrefix('bf3', 'attack', 'boyfriend attack', 24, false)
    addLuaSprite('bf3', false)
    setProperty('bf3.visible', false)

    makeAnimatedLuaSprite('aether', 'characters/aether-battle', 400, -450)
    addAnimationByPrefix('aether', 'idle', 'aether-battle idle', 24, false)
    setProperty('aether.flipX', true)
    addLuaSprite('aether', false)

    makeAnimatedLuaSprite('aether2', 'characters/aether-battle', 400, -450)
    addAnimationByPrefix('aether2', 'stressed', 'aether-battle scared', 24, false)
    setProperty('aether2.flipX', true)

    makeAnimatedLuaSprite('aloe', 'characters/Aloe', 500, 60)
    addAnimationByPrefix('aloe', 'stressed', 'BF idle fard', 24, false)
    addAnimationByPrefix('aloe', 'hey', 'BF HEY!!', 24, false)

    makeAnimatedLuaSprite('aloe2', 'characters/Aloe', 500, 60)
    addAnimationByPrefix('aloe2', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('aloe2', false)
    --[[
    makeAnimatedLuaSprite('bgrock', 'shaggy/god_bg', 2000, 300)
    addAnimationByPrefix('bgrock', 'rock', 'gf_rock', 24, true)
    objectPlayAnimation('bgrock', 'rock', true)
    addLuaSprite('bgrock', false)

    makeAnimatedLuaSprite('ei-fly', 'characters/ei-fly', 300, 250)
    addAnimationByPrefix('ei-fly', 'idle', 'ei-fly idle0', 24, false)
    ]]
    makeLuaSprite('jumpscare', 'genshin/EI', -200, -200)
    setObjectCamera('jumpscare', 'other')

    makeLuaSprite('particle', 'genshin/electro', 500, 300)
    scaleLuaSprite('particle', 0.1, 0.1)
    updateHitbox('particle')

    precacheImage('characters/Aloe')
    precacheImage('characters/aether-battle')
    precacheImage('characters/BOYFRIEND')
    precacheImage('characters/BOYFRIEND_TABI')
    precacheImage('genshin/EI')
    precacheImage('genshin/electro')
    precacheImage('shaggy/god_bg')
    precacheSound('ultready')
    precacheSound('eiult')
    addCharacterToList('raiden-shogun', 'dad')
    addCharacterToList('ei-fly2', 'boyfriend')
    addCharacterToList('ei-sword', 'boyfriend')
    addCharacterToList('ei-sword-alt', 'boyfriend')
end

function onStepHit()
    if curStep == 1 then
        exec = 0
    end

    if curStep == 208 then
        triggerEvent('Camera Follow Pos', 200, 200)
        --triggerEvent('Set Cam Zoom', 1, '')
        --setProperty("camGame.zoom", 1)
        --setProperty("defaultCamZoom", 1)
    end

    if curStep == 224 then
        cameraFlash('game', 'ff0000', 0.8, false)
    end

    --if curStep == 256 then
        --setProperty("camGame.zoom", 0.75)
        --setProperty("defaultCamZoom", 0.75)
        --triggerEvent('Set Cam Zoom', 0.75, '')
    --end
--[[
    if curStep == 320 then
        doTweenX('aloepopin', 'bgrock', 500, 0.8, 'linear')
    end
]]
    if curStep == 768 then
        addLuaSprite('jumpscare', true)
        doTweenAlpha('bye', 'jumpscare', 0, 0.8, 'linear')
    end

    if curStep == 992 then
        cameraFlash('game', 'ff0000', 0.8, false)
    end

    if curStep == 1024 then
        doTweenX('gaining', 'dad', -100, 8, 'linear')
        removeLuaSprite('bf2', false)
        removeLuaSprite('aloe2', false)
        removeLuaSprite('aether', false)
        addLuaSprite('bf', false)
        addLuaSprite('aether2', false)
        addLuaSprite('aloe', false)
    end

    if curStep == 1152 then
        triggerEvent('Change Character', 0, 'ei-fly2')
    end

    if curStep == 1280 then
        doTweenX('losing', 'dad', -500, 8, 'linear')
    end

    if curStep == 1536 then
        doTweenX('slowing', 'boyfriend', -200, 16, 'linear')
    end

    if curStep == 1792 then
        doTweenX('speeding', 'boyfriend', 300, 8, 'linear')
    end

    if curStep == 2000 then
        triggerEvent('Camera Follow Pos', 700, 200)
    end

    if curStep == 2020 then
        exec = 1
        objectPlayAnimation('bf', 'prep', true)
    end

    if curStep == 2024 then
        exec = 1
        removeLuaSprite('bf', false)
        setProperty('bf3.visible', true)
        objectPlayAnimation('bf3', 'attack', true)
        objectPlayAnimation('aloe', 'hey', true)
        addLuaSprite('particle', false)
        doTweenX('chargex', 'particle', 900, 0.5, 'linear')
        doTweenY('chargey', 'particle', 600, 0.5, 'linear')
    end

    if curStep == 2032 then
        triggerEvent('Camera Follow Pos', 800, 400)
        playSound('ultready', 1)
    end

    if curStep == 2040 then
        playSound('eiult', 1)
    end

    if curStep == 2048 then
        exec = 0
        cameraFlash('game', 'ffffff', 0.8, false)
        removeLuaSprite('bf3', false)
        removeLuaSprite('aether2', false)
        removeLuaSprite('aloe', false)
        addLuaSprite('bf2', false)
        addLuaSprite('aether', false)
        addLuaSprite('aloe2', false)
    end

    if curStep % 8 == 0 then
        objectPlayAnimation('aether', 'idle', true)
        objectPlayAnimation('aether2', 'stressed', true)
        if exec == 0 then
            objectPlayAnimation('bf', 'stressed', true)
            objectPlayAnimation('aloe', 'stressed', true)
            objectPlayAnimation('bf2', 'idle', true)
            objectPlayAnimation('aloe2', 'idle', true)
        end
    end
end

function onTweenCompleted(tag)
    --if tag == 'aloepopin' then
    --end

    if tag == 'bye' then
    end

    if tag == 'gaining' then
    end

    if tag == 'losing' then
    end

    if tag == 'slowing' then
    end

    if tag == 'speeding' then
    end

    if tag == 'chargex' then
    end

    if tag == 'chargey' then
        removeLuaSprite('particle', false)
    end
end