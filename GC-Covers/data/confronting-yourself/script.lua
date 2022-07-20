local aloex = 0
local aloey = 0
local bfx = 0
local bfy = 0
local aetherx = 0
local aethery = 0

function onCreate()
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

	setPropertyFromClass('GameOverSubstate', 'characterName', 'sonic')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'cys_fnf_loss_sfx')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'cysgameOver')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'cysgameOverEnd')

    setProperty('dad.scale.x', 0.8)
    setProperty('dad.scale.y', 0.8)
    setProperty('boyfriend.scale.x', 0.8)
    setProperty('boyfriend.scale.y', 0.8)

    makeAnimatedLuaSprite('aetherrock', 'shaggy/god_bg', 2250, 400)
    addAnimationByPrefix('aetherrock', 'rock', 'rock', 24, true)
    scaleObject('aetherrock', 0.5, 0.5)
    updateHitbox('aetherrock')
    objectPlayAnimation('aetherrock', 'rock', true)
    addLuaSprite('aetherrock', false)

    makeAnimatedLuaSprite('aether', 'characters/aether-battle', getProperty('aetherrock.x') - 150, getProperty('aetherrock.y') - 550)
	addAnimationByPrefix('aether', 'idle', 'aether-battle idle', 24, false)
    addAnimationByPrefix('aether', '0', 'aether-battle right', 24, false)
    addAnimationByPrefix('aether', '1', 'aether-battle down', 24, false)
    addAnimationByPrefix('aether', '2', 'aether-battle up', 24, false)
    addAnimationByPrefix('aether', '3', 'aether-battle left', 24, false)
    scaleObject('aether', 0.7, 0.7)
    updateHitbox('aether')
    setProperty('aether.flipX', true)
	addLuaSprite('aether', false)

    makeAnimatedLuaSprite('aloerock', 'shaggy/god_bg', 2250, 300)
    addAnimationByPrefix('aloerock', 'rock', 'rock', 24, true)
    scaleObject('aloerock', 0.5, 0.5)
    updateHitbox('aloerock')
    objectPlayAnimation('aloerock', 'rock', true)
    addLuaSprite('aloerock', false)

    makeAnimatedLuaSprite('aloe', 'characters/Aloe', getProperty('aloerock.x') + 50, getProperty('aloerock.y') - 200)
    addAnimationByPrefix('aloe', 'idle', 'BF idle dance', 24, false)
    addAnimationByPrefix('aloe', '0', 'BF NOTE LEFT0', 24, false)
    addAnimationByPrefix('aloe', '1', 'BF NOTE DOWN0', 24, false)
    addAnimationByPrefix('aloe', '2', 'BF NOTE UP0', 24, false)
    addAnimationByPrefix('aloe', '3', 'BF NOTE RIGHT0', 24, false)
    scaleObject('aloe', 0.7, 0.7)
    updateHitbox('aloe')
    addLuaSprite('aloe', false)

    makeAnimatedLuaSprite('aloe2', 'characters/Aloe', getProperty('aloerock.x') + 50, getProperty('aloerock.y') - 200)
    addAnimationByPrefix('aloe2', 'idle', 'BF idle fard', 24, false)
    addAnimationByPrefix('aloe2', '0', 'BF NOTE LEFT alt', 24, false)
    addAnimationByPrefix('aloe2', '1', 'BF NOTE DOWN alt', 24, false)
    addAnimationByPrefix('aloe2', '2', 'BF NOTE UP alt', 24, false)
    addAnimationByPrefix('aloe2', '3', 'BF NOTE RIGHT alt', 24, false)
    addAnimationByPrefix('aloe2', 'hey', 'BF HEY!!', 24, false)
    scaleObject('aloe2', 0.7, 0.7)
    updateHitbox('aloe2')
    addLuaSprite('aloe2', false)
    setProperty('aloe2.alpha', 0)

    makeAnimatedLuaSprite('bfrock', 'shaggy/god_bg', 2350, 300)
    addAnimationByPrefix('bfrock', 'rock', 'rock', 24, true)
    scaleObject('bfrock', 0.5, 0.5)
    updateHitbox('bfrock')
    objectPlayAnimation('bfrock', 'rock', true)
    addLuaSprite('bfrock', false)

    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', getProperty('bfrock.x') + 50, getProperty('bfrock.y') - 200)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addAnimationByPrefix('bf', '0', 'BF NOTE LEFT0', 24, false)
    addAnimationByPrefix('bf', '1', 'BF NOTE DOWN0', 24, false)
    addAnimationByPrefix('bf', '2', 'BF NOTE UP0', 24, false)
    addAnimationByPrefix('bf', '3', 'BF NOTE RIGHT0', 24, false)
    scaleObject('bf', 0.7, 0.7)
    updateHitbox('bf')
    addLuaSprite('bf', false)

    makeAnimatedLuaSprite('bf2', 'characters/BOYFRIEND_TABI', getProperty('bfrock.x') + 50, getProperty('bfrock.y') - 200)
    addAnimationByPrefix('bf2', 'idle', 'BF idle dance', 24, false)
    addAnimationByPrefix('bf2', '0', 'BF NOTE LEFT0', 24, false)
    addAnimationByPrefix('bf2', '1', 'BF NOTE DOWN0', 24, false)
    addAnimationByPrefix('bf2', '2', 'BF NOTE UP0', 24, false)
    addAnimationByPrefix('bf2', '3', 'BF NOTE RIGHT0', 24, false)
    addAnimationByPrefix('bf2', 'pre-attack', 'bf pre attack', 24, false)
    addAnimationByPrefix('bf2', 'attack', 'boyfriend attack', 24, false)
    scaleObject('bf2', 0.7, 0.7)
    updateHitbox('bf2')
    addLuaSprite('bf2', false)
    setProperty('bf2.alpha', 0)

    makeLuaSprite('jumpscare', 'genshin/EI', -200, -200)
    setObjectCamera('jumpscare', 'other')

    makeLuaSprite('particle', 'genshin/electro', 500, 300)
    scaleLuaSprite('particle', 0.1, 0.1)
    updateHitbox('particle')
end

function onStartCountdown()
    setCharacterX('dad', -500)
    setCharacterY('dad', 0)
    setCharacterX('boyfriend', 700)
    setCharacterY('boyfriend', 250)
    return Function_Continue;
end
local eitime = true
local bftime = false
local bf2time = false
local aloetime = false
local aloe2time = false
local aethertime = false

local xx = 300;
local yy = 300;
local xx2 = 500
local yy2 = 400
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;
local exception = 0

function onUpdate(elapsed)
    aloex = getProperty('aloerock.x') + 50
    aloey = getProperty('aloerock.y') - 200
    bfx = getProperty('bfrock.x') + 50
    bfy = getProperty('bfrock.y') - 200
    aetherx = getProperty('aetherrock.x') - 150
    aethery = getProperty('aetherrock.y') - 550

    if curStep >= 208 and curStep <= 255 then
        exception = 1
    elseif curStep >= 2000 and curStep <= 2047 then
        exception = 1
    else
        exception = 0
    end

    if eitime and (getProperty('boyfriend.curCharacter') == 'ei-fly' or getProperty('boyfriend.curCharacter') == 'ei-fly2') then
        yy2 = 400
    else
        yy2 = 300
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
            if eitime then
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
            elseif aloetime then
                if getProperty('aloe.animation.curAnim.name') == '0' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                end
                if getProperty('aloe.animation.curAnim.name') == '3' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('aloe.animation.curAnim.name') == '2' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('aloe.animation.curAnim.name') == '1' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
	            if getProperty('aloe.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                end
            elseif aloe2time then
                if getProperty('aloe2.animation.curAnim.name') == '0' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                end
                if getProperty('aloe2.animation.curAnim.name') == '3' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('aloe2.animation.curAnim.name') == '2' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('aloe2.animation.curAnim.name') == '1' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
	            if getProperty('aloe2.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                end
            elseif bftime then
                if getProperty('bf.animation.curAnim.name') == '0' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                end
                if getProperty('bf.animation.curAnim.name') == '3' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('bf.animation.curAnim.name') == '2' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('bf.animation.curAnim.name') == '1' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
	            if getProperty('bf.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                end
            elseif bf2time then
                if getProperty('bf2.animation.curAnim.name') == '0' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                end
                if getProperty('bf2.animation.curAnim.name') == '3' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('bf2.animation.curAnim.name') == '2' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('bf2.animation.curAnim.name') == '1' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
	            if getProperty('bf2.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                end
            elseif aethertime then
                if getProperty('aether.animation.curAnim.name') == '0' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                end
                if getProperty('aether.animation.curAnim.name') == '3' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('aether.animation.curAnim.name') == '2' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('aether.animation.curAnim.name') == '1' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
	            if getProperty('aether.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                end
            end
        end
    elseif followchars == false and exception == 0 then
        triggerEvent('Camera Follow Pos','','')
    end
    
    setProperty('dad.scale.x', 0.8)
    setProperty('dad.scale.y', 0.8)
    setProperty('boyfriend.scale.x', 0.8)
    setProperty('boyfriend.scale.y', 0.8)

    if getProperty('aloe.animation.curAnim.name') == '0' then
		setProperty('aloe.x', aloex - 2.8)
		setProperty('aloe.y', aloey + 7.7)
	elseif getProperty('aloe.animation.curAnim.name') == '1' then
		setProperty('aloe.x', aloex - 16.8)
		setProperty('aloe.y', aloey + 37.1)
	elseif getProperty('aloe.animation.curAnim.name') == '2' then
		setProperty('aloe.x', aloex + 12.6)
		setProperty('aloe.y', aloey - 15.4)
	elseif getProperty('aloe.animation.curAnim.name') == '3' then
		setProperty('aloe.x', aloex + 16.8)
		setProperty('aloe.y', aloey + 2.1)
	else
		setProperty('aloe.x', aloex)
		setProperty('aloe.y', aloey)
	end
    if getProperty('aloe2.animation.curAnim.name') == '0' then
		setProperty('aloe2.x', aloex - 2.8)
		setProperty('aloe2.y', aloey + 7.7)
	elseif getProperty('aloe2.animation.curAnim.name') == '1' then
		setProperty('aloe2.x', aloex - 16.8)
		setProperty('aloe2.y', aloey + 37.1)
	elseif getProperty('aloe2.animation.curAnim.name') == '2' then
		setProperty('aloe2.x', aloex + 12.6)
		setProperty('aloe2.y', aloey - 15.4)
	elseif getProperty('aloe2.animation.curAnim.name') == '3' then
		setProperty('aloe2.x', aloex + 16.8)
		setProperty('aloe2.y', aloey + 2.1)
    elseif getProperty('aloe2.animation.curAnim.name') == 'hey' then
        setProperty('aloe2.x', aloex + 7.7)
        setProperty('aloe2.y', aloey + 0.7)
	else
		setProperty('aloe2.x', aloex)
		setProperty('aloe2.y', aloey)
	end

    if getProperty('bf.animation.curAnim.name') == '0' then
		setProperty('bf.x', bfx - 7)
		setProperty('bf.y', bfy + 4.2)
	elseif getProperty('bf.animation.curAnim.name') == '1' then
		setProperty('bf.x', bfx + 3.5)
		setProperty('bf.y', bfy + 35)
	elseif getProperty('bf.animation.curAnim.name') == '2' then
		setProperty('bf.x', bfx + 16.8)
		setProperty('bf.y', bfy - 18.9)
	elseif getProperty('bf.animation.curAnim.name') == '3' then
		setProperty('bf.x', bfx + 30.1)
		setProperty('bf.y', bfy + 4.9)
	else
		setProperty('bf.x', bfx)
		setProperty('bf.y', bfy)
	end
    if getProperty('bf2.animation.curAnim.name') == '0' then
		setProperty('bf2.x', bfx - 7)
		setProperty('bf2.y', bfy + 4.2)
	elseif getProperty('bf2.animation.curAnim.name') == '1' then
		setProperty('bf2.x', bfx + 3.5)
		setProperty('bf2.y', bfy + 35)
	elseif getProperty('bf2.animation.curAnim.name') == '2' then
		setProperty('bf2.x', bfx + 23.8)
		setProperty('bf2.y', bfy - 18.9)
	elseif getProperty('bf2.animation.curAnim.name') == '3' then
		setProperty('bf2.x', bfx + 30.1)
		setProperty('bf2.y', bfy + 4.9)
    elseif getProperty('bf2.animation.curAnim.name') == 'pre-attack' then
        setProperty('bf2.x', bfx + 24.5)
        setProperty('bf2.y', bfy + 28)
    elseif getProperty('bf2.animation.curAnim.name') == 'attack' then
        setProperty('bf2.x', bfx - 209.3)
        setProperty('bf2.y', bfy - 186.9)
	else
		setProperty('bf2.x', bfx)
		setProperty('bf2.y', bfy)
	end

    if getProperty('aether.animation.curAnim.name') == '0' then
        setProperty('aether.x', aetherx - 35)
    elseif getProperty('aether.animation.curAnim.name') == '1' then
        setProperty('aether.x', aetherx - 53.2)
    elseif getProperty('aether.animation.curAnim.name') == '2' then
        setProperty('aether.x', aetherx - 14)
    elseif getProperty('aether.animation.curAnim.name') == '3' then
        setProperty('aether.x', aetherx - 25.2)
    else
        setProperty('aether.x', aetherx)
        setProperty('aether.y', aethery)
    end
end

lastNote = {0, ""}
local allowIdleAloe = true
local allowIdleBF = true
local allowIdleAether = true

function goodNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "Special Sing" or lastNote[2] == "Special Static" or lastNote[2] == "Special Phantom" or lastNote[2] == "Duet Note" or lastNote[2] == "Static Note" or lastNote[2] == "Phantom Note" then
        if (curStep >= 320 and curStep < 384) or (curStep >= 1664 and curStep < 1792) or (curStep >= 2272 and curStep < 2432) or (curStep >= 2624 and curStep < 2656) then
	        objectPlayAnimation('aloe', lastNote[1], true)
            objectPlayAnimation('aloe2', lastNote[1], true)
            allowIdleAloe = false
            runTimer('resumeIdleAloe', 0.5, 1)
        end
        if (curStep >= 384 and curStep < 448) or (curStep >= 1792 and curStep < 2016) or (curStep >= 2487 and curStep < 2560) or (curStep >= 2720 and curStep < 2784) then
            objectPlayAnimation('bf', lastNote[1], true)
            objectPlayAnimation('bf2', lastNote[1], true)
            allowIdleBF = false
            runTimer('resumeIdleBF', 0.5, 1)
        end
        if (curStep >= 448 and curStep < 512) or (curStep >= 2487 and curStep < 2560) or (curStep >= 2656 and curStep < 2720) then
            objectPlayAnimation('aether', lastNote[1], true)
            allowIdleAether = false
            runTimer('resumeIdleAether', 0.5, 1)
        end
    end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.3 then
        setProperty('health', health- 0.01);
    end
end

function onStepHit()
    if curStep == 208 then
        triggerEvent('Camera Follow Pos', 200, 200)
    end

    if curStep == 224 then
        cameraFlash('game', 'ff0000', 0.8, false)
    end

    if curStep == 320 then
        doTweenX('go1', 'aloerock', 600, 1, 'linear')
        eitime = false
        aloetime = true
    end

    if curStep == 376 then
        doTweenX('back1', 'aloerock', 2250, 1, 'linear')
    end

    if curStep == 384 then
        doTweenX('go2', 'bfrock', 500, 1, 'linear')
        aloetime = false
        bftime = true
    end

    if curStep == 440 then
        doTweenX('back2', 'bfrock', 2150, 1, 'linear')
    end

    if curStep == 448 then
        doTweenX('go3', 'aetherrock', 600, 1, 'linear')
        bftime = false
        aethertime = true
    end

    if curStep == 504 then
        doTweenX('back3', 'aetherrock', 2250, 1, 'linear')
    end

    if curStep == 512 then
        aethertime = false
        eitime = true
    end

    if curStep == 768 then
        addLuaSprite('jumpscare', true)
        doTweenAlpha('bye', 'jumpscare', 0, 0.8, 'linear')
    end

    if curStep == 992 then
        cameraFlash('game', 'ff0000', 0.8, false)
    end

    if curStep == 1024 then
        doTweenX('gaining', 'dad', 100, 8, 'linear')
    end

    if curStep == 1152 then
        triggerEvent('Change Character', 0, 'ei-fly2')
    end

    if curStep == 1280 then
        doTweenX('losing', 'dad', -450, 8, 'linear')
    end

    if curStep == 1408 then
        triggerEvent('Change Character', 0, 'ei-fly')
    end

    if curStep == 1536 then
        doTweenX('slowing', 'boyfriend', -200, 16, 'linear')
        setProperty('aloe.alpha', 0)
        setProperty('aloe2.alpha', 1)
        setProperty('bf.alpha', 0)
        setProperty('bf2.alpha', 1)
    end

    if curStep == 1648 then
        doTweenX('gogo1', 'aloerock', 600, 1, 'linear')
        eitime = false
        aloe2time = true
    end

    if curStep == 1784 then
        doTweenX('backback1', 'aloerock', 2250, 1, 'linear')
    end

    if curStep == 1792 then
        triggerEvent('Change Character', 0, 'ei-fly2')
        setProperty('boyfriend.x', -200)
        doTweenX('speeding', 'boyfriend', 300, 16, 'linear')
        doTweenX('gogo2', 'bfrock', 500, 1, 'linear')
        aloe2time = false
        bf2time = true
    end

    if curStep == 1984 then
        doTweenX('gogo1.5', 'aloerock', 750, 1, 'linear')
    end

    if curStep == 2000 then
        triggerEvent('Camera Follow Pos', 700, 200)
    end

    if curStep == 2016 then
        bf2time = false
        eitime = true
    end

    if curStep == 2020 then
        cancelTimer('resumeBFIdle')
        allowIdleBF = false
        allowIdleAloe = false
        objectPlayAnimation('bf2', 'pre-attack', true)
    end

    if curStep == 2024 then
        objectPlayAnimation('bf2', 'attack', true)
        objectPlayAnimation('aloe2', 'hey', true)
        addLuaSprite('particle', false)
        doTweenX('chargex', 'particle', 900, 0.5, 'linear')
        doTweenY('chargey', 'particle', 600, 0.5, 'linear')
    end

    if curStep == 2032 then
        triggerEvent('Camera Follow Pos', 800, 400)
        playSound('ultready', 1)
        doTweenX('backback1.5', 'aloerock', 2250, 1, 'linear')
        doTweenX('backback2', 'bfrock', 2150, 1, 'linear')
    end

    if curStep == 2040 then
        playSound('eiult', 1)
    end

    if curStep == 2048 then
        cameraFlash('game', 'ffffff', 0.8, false)
        allowIdleBF = true
        allowIdleAloe = true
        setProperty('aloe2.alpha', 0)
        setProperty('aloe.alpha', 1)
        setProperty('bf2.alpha', 0)
        setProperty('bf.alpha', 1)
        setCharacterY('boyfriend', 150)
    end

    if curStep == 2272 then
        doTweenX('gogogo1', 'aloerock', 600, 1, 'linear')
    end

    if curStep == 2425 then
        doTweenX('backbackback1', 'aloerock', 2250, 1, 'linear')
    end

    if curStep == 2488 then
        eitime = false
        bftime = true
        setProperty('bfrock.y', 450)
        doTweenX('gogogo2', 'bfrock', 550, 1, 'linear')
        doTweenX('gogogo3', 'aetherrock', 400, 1, 'linear')
    end

    if curStep == 2552 then
        doTweenX('backbackback2', 'bfrock', 2150, 1, 'linear')
        doTweenX('backbackback3', 'aetherrock', 2250, 1, 'linear')
    end

    if curStep == 2608 then
        setProperty('bfrock.y', 300)
        doTweenX('gogogogo1', 'aloerock', 600, 1, 'linear')
    end

    if curStep == 2624 then
        bftime = false
        aloetime = true
    end

    if curStep == 2648 then
        doTweenX('backbackbackback1', 'aloerock', 2250, 1, 'linear')
    end

    if curStep == 2656 then
        aloetime = false
        aethertime = true
        doTweenX('gogogogo3', 'aetherrock', 600, 1, 'linear')
    end

    if curStep == 2712 then
        doTweenX('backbackbackback3', 'aetherrock', 2250, 1, 'linear')
    end

    if curStep == 2720 then
        aethertime = false
        bftime = true
        doTweenX('gogogogo2', 'bfrock', 500, 1, 'linear')
    end

    if curStep == 2776 then
        doTweenX('backbackbackback2', 'bfrock', 2150, 1, 'linear')
    end

    if curStep == 2784 then
        bftime = false
        eitime = true
    end

    if curStep % 8 == 0 then
        if allowIdleAloe then
            objectPlayAnimation('aloe', 'idle', true)
            objectPlayAnimation('aloe2', 'idle', true)
        end
        if allowIdleBF then
            objectPlayAnimation('bf', 'idle', true)
            objectPlayAnimation('bf2', 'idle', true)
        end
        if allowIdleAether then
            objectPlayAnimation('aether', 'idle', true)
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'chargey' then
        removeLuaSprite('particle', false)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeIdleAloe' then
        allowIdleAloe = true
    end
    if tag == 'resumeIdleBF' then
        allowIdleBF = true
    end
    if tag == 'resumeIdleAether' then
        allowIdleAether = true
    end
end