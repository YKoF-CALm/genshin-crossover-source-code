local y2y = 0;
local y2y2 = 0;
local ofs2 = 80;
local fy = 0;
local fy2 = 0;
local fx = 0;
local camSpeed = 1;
local u = 2
local e = ''
local tx = 0
local ty = 0

function onCreate() 
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

    makeLuaSprite('jumpscare', 'genshin/EI', -200, -200)
    setObjectCamera('jumpscare', 'other')

    makeLuaSprite('particle', 'genshin/electro', 500, 300)
    scaleLuaSprite('particle', 0.1, 0.1)
    updateHitbox('particle')

    e = 'Extended'
    tx = 900
    ty = 600
end

local allowCountdown = false

function onStartCountdown()
    setCharacterX('dad', -500)
    setCharacterY('dad', 0)
    setCharacterX('boyfriend', 700)
    setCharacterY('boyfriend', 250)
    if not allowCountdown then
		runTimer('startText', 0.1);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
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
local exception = 0

function onUpdate(elapsed)
    if curStep >= 104 and curStep < 128 then
        exception = 1
    elseif curStep >= 1000 and curStep < 1024 then
        exception = 1
    else
        exception = 0
    end

    if eitime and (getProperty('boyfriend.curCharacter') == 'ei-fly' or getProperty('boyfriend.curCharacter') == 'ei-fly2') then
        yy2 = 400
    else
        yy2 = 300
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

    if getProperty('dad.curCharacter') == 'ei-fake' or getProperty('dad.curCharacter') == 'raiden-shogun' then
        fy = fy+0.04;
        fy2 = fy2+0.1;
        fx = fx+1;
        y2y = getProperty('dad.y')
        y2y2 = getProperty('iconP2.y')

        setProperty('iconP2.y',y2y2-math.sin(fx)*3)
        if difficulty == 1 then
            setProperty('dad.y',y2y-math.sin(fy2)*5)
        else
            setProperty('dad.y',y2y-math.sin(fy)*3)
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
    if curStep == 104 then
        triggerEvent('Camera Follow Pos', 200, 200)
    end

    if curStep == 112 then
        cameraFlash('game', 'ff0000', 0.8, false)
    end

    if curStep == 160 then
        eitime = false
        aloetime = true
    end

    if curStep == 192 then
        aloetime = false
        bftime = true
    end

    if curStep == 224 then
        bftime = false
        aethertime = true
    end

    if curStep == 256 then
        aethertime = false
        eitime = true
    end

    if curStep == 384 then
        addLuaSprite('jumpscare', true)
        doTweenAlpha('bye', 'jumpscare', 0, 0.8, 'linear')
    end

    if curStep == 496 then
        cameraFlash('game', 'ff0000', 0.8, false)
    end

    if curStep == 512 then
        doTweenX('gaining', 'dad', 100, 8, 'linear')
    end

    if curStep == 576 then
        triggerEvent('Change Character', 0, 'ei-fly2')
    end

    if curStep == 640 then
        doTweenX('losing', 'dad', -450, 8, 'linear')
    end

    if curStep == 704 then
        triggerEvent('Change Character', 0, 'ei-fly')
    end

    if curStep == 768 then
        doTweenX('slowing', 'boyfriend', -200, 16, 'linear')
    end

    if curStep == 824 then
        eitime = false
        aloe2time = true
    end

    if curStep == 896 then
        triggerEvent('Change Character', 0, 'ei-fly2')
        setProperty('boyfriend.x', -200)
        doTweenX('speeding', 'boyfriend', 300, 16, 'linear')
        aloe2time = false
        bf2time = true
    end

    if curStep == 1000 then
        triggerEvent('Camera Follow Pos', 700, 200)
    end

    if curStep == 1008 then
        bf2time = false
        eitime = true
    end

    if curStep == 1012 then
        addLuaSprite('particle', false)
        doTweenX('chargex', 'particle', 900, 0.5, 'linear')
        doTweenY('chargey', 'particle', 600, 0.5, 'linear')
    end

    if curStep == 1016 then
        triggerEvent('Camera Follow Pos', 800, 400)
        playSound('ultready', 1)
        
    end

    if curStep == 1020 then
        playSound('eiult', 1)
    end

    if curStep == 1024 then
        cameraFlash('game', 'ffffff', 0.8, false)
        setCharacterY('boyfriend', 150)
    end

    if curStep == 1244 then
        eitime = false
        bftime = true
    end

    if curStep == 1312 then
        bftime = false
        aloetime = true
    end

    if curStep == 1328 then
        aloetime = false
        aethertime = true
    end

    if curStep == 1360 then
        aethertime = false
        bftime = true
    end

    if curStep == 1392 then
        bftime = false
        eitime = true
    end
end

function onTweenCompleted(tag)
    if tag == 'chargey' then
        removeLuaSprite('particle', false)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startText' then
		makeLuaSprite('blackscreen', 'exe/blackscreen', 0, 0);
		setObjectCamera('blackscreen', 'hud');
		addLuaSprite('blackscreen', true);
		makeLuaSprite('circle', 'exe/CircleCY', 777, 0);
		setObjectCamera('circle', 'hud');
		addLuaSprite('circle', true);
		makeLuaSprite('text', 'exe/TextCY', -1100, 0);
		setObjectCamera('text', 'hud');
		addLuaSprite('text', true);
		runTimer('appear', 0.6, 1);
		runTimer('fadeout', 1.9, 1);
	elseif tag == 'appear' then
		doTweenX('circletween', 'circle', 0, 0.5, 'linear');
		doTweenX('texttween', 'text', 0, 0.5, 'linear');
	elseif tag == 'fadeout' then
		doTweenAlpha('circlefade', 'circle', 0, 1, 'linear');
		doTweenAlpha('textfade', 'text', 0, 1, 'linear');
		doTweenAlpha('blackfade', 'blackscreen', 0, 1, 'linear');
	end
end