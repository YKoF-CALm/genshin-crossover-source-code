local allowCountdown = false

function onStartCountdown()
    setCharacterX('dad', 200)
    setCharacterY('dad', 330)
    setCharacterX('boyfriend', 1050)
    setCharacterY('boyfriend', 330)
    if not allowCountdown then
		runTimer('startText', 0.1);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
    makeLuaSprite('blackscreen', 'exe/blackscreen', 0, 0);
	setObjectCamera('blackscreen', 'hud');
    makeLuaSprite('circle', 'exe/StartScreens/CircleTripleTrouble', 777, 0);
	setObjectCamera('circle', 'hud');
    makeLuaSprite('text', 'exe/StartScreens/TextTripleTrouble', -1100, 0);
	setObjectCamera('text', 'hud');

    makeAnimatedLuaSprite('static', 'exe/Phase3Static', 0, 0)
    addAnimationByPrefix('static', 'flash', 'Phase3Static instance 1', 24, false)
    setGraphicSize('static', getProperty('static.width') * 4)
    setProperty('static.alpha', 0)
    addLuaSprite('static', true)
    setObjectCamera('static', 'other')

    makeLuaSprite('js1', 'genshin/shenhejs', 0, 0)
    setObjectCamera('js1', 'other')

    makeLuaSprite('js2', 'genshin/xiaojs', 0, 0)
    setObjectCamera('js2', 'other')

    makeLuaSprite('js3', 'genshin/hutaojs', 0, 0)
    setObjectCamera('js3', 'other')

    makeAnimatedLuaSprite('jumpstatic', 'exe/screenstatic', 0, 0)
    addAnimationByPrefix('jumpstatic', 'static', 'screenSTATIC', 24, true)
    setProperty('jumpstatic.alpha', 0.3)
    setObjectCamera('jumpstatic', 'other')

    setProperty('introSoundsSuffix', '-blank')

    precacheImage('genshin/shenhejs')
    precacheImage('genshin/xiaojs')
    precacheImage('genshin/hutaojs')
    precacheImage('exe/screenstatic')
    precacheSound('P3Jumps/KnucklesScreamLOL')
    precacheSound('P3Jumps/TailsScreamLOL')
    precacheSound('P3Jumps/EggmanScreamLOL')
    addCharacterToList('ganyu', 'boyfriend')
    addCharacterToList('zhongli', 'dad')
    addCharacterToList('zhongli-player', 'dad')
    addCharacterToList('xiao-player', 'dad')
    addCharacterToList('hu-tao-alt', 'dad')
    addCharacterToList('ganyu-player', 'boyfriend')
end


function onUpdate()
    ofs = 35;
    followchars = true;
    del = 0;
    del2 = 0;

    if curStep >= 1296 and curStep <= 2823 then
        xx = 1700;
        yy = 600;
        xx2 = 1100;
        yy2 = 600;
    else
        xx = 500;
        yy = 600;
        xx2 = 1100;
        yy2 = 600;
    end

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
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
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

function onEvent(name,a,b)
    if name == 'Opponent Notes Left Side' then
        setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0)
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1)
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2)
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3)

        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0)
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1)
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2)
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3)
    end

    if name == 'Opponent Notes Right Side' then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
        setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
        setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
        setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

        setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
    end

    if name == 'Trigger Static' then
        setProperty('static.alpha', 0.3)
        objectPlayAnimation('static', 'flash', true)
        runTimer('bye', 1.625, 1)
    end
end

function onStepHit()
    if curStep == 1 then
        doTweenZoom('asf', 'camGame', 1.1, 2, 'cubeOut')
        setProperty('defaultCamZoom', 1.1)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 1024 or curStep == 1088 or curStep == 1216 or curStep == 1280 or curStep == 2305 or curStep == 2810 or curStep == 3199 or curStep == 4096 then
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 144 then
        addLuaSprite('js1', true)
        addLuaSprite('jumpstatic', true)
        objectPlayAnimation('jumpstatic', 'static', true)
        playSound('P3Jumps/TailsScreamLOL', 0.1)
        runTimer('bye2', 0.2, 1)
    end

    if curStep == 1040 then
        setProperty('exeglitch.visible', true)

        doTweenZoom('adffg', 'camGame', 0.9, 2, 'cubeOut')
        setProperty('defaultCamZoom', 0.9)
        setProperty('dad.y', getProperty('dad.y') - 20)
    end

    if curStep == 1296 then
        setProperty('exeglitch.visible', false)

        addLuaSprite('js2', true)
        addLuaSprite('jumpstatic', true)
        objectPlayAnimation('jumpstatic', 'static', true)
        playSound('P3Jumps/KnucklesScreamLOL', 0.1)
        runTimer('bye3', 0.2, 1)

        triggerEvent('Opponent Notes Right Side', 'among us is', 'not funny')
        
        doTweenZoom('asfyte', 'camGame', 1.1, 2, 'cubeOut')
        setProperty('defaultCamZoom', 1.1)

        setCharacterX('dad', 1500)
        setProperty('boyfriend.x', getProperty('boyfriend.x') - 200)
        setProperty('dad.flipX', true)
        setProperty('boyfriend.flipX', false)
    end

    if curStep == 2320 then
        doTweenZoom('adffgedfdfg', 'camGame', 0.9, 2, 'cubeOut')
        setProperty('defaultCamZoom', 0.9)

        setProperty('exeglitch.visible', true)
        setProperty('dad.flipX', true)
        setProperty('dad.y', getProperty('dad.y') - 20)
    end

    if curStep == 2823 then
        doTweenZoom('rrrrrr', 'camGame', 1, 2, 'cubeOut')
        setProperty('defaultCamZoom', 1)

        addLuaSprite('js3', true)
        addLuaSprite('jumpstatic', true)
        objectPlayAnimation('jumpstatic', 'static', true)
        runTimer('bye4', 0.2, 1)

        triggerEvent('Opponent Notes Left Side', 'a', 's')

        setProperty('exeglitch.visible', false)

        setCharacterX('dad', 200)
    end

    if curStep == 2832 then
        playSound('P3Jumps/EggmanScreamLOL', 0.1)
    end

    if curStep == 4111 then
        setProperty('exeglitch.visible', true)

        doTweenZoom('adffgedfdfg2', 'camGame', 0.9, 2, 'cubeOut')
        setProperty('defaultCamZoom', 0.9)
    end

    if curStep == 4112 then
        setProperty('dad.y', getProperty('dad.y') - 20)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startText' then
		addLuaSprite('blackscreen', true);
		addLuaSprite('circle', true);
		addLuaSprite('text', true);
		runTimer('appear', 0.6, 1);
		runTimer('fadeout', 1.9, 1);
    end
	if tag == 'appear' then
		doTweenX('circletween', 'circle', 0, 0.5, 'linear');
		doTweenX('texttween', 'text', 0, 0.5, 'linear');
    end
	if tag == 'fadeout' then
		doTweenAlpha('circlefade', 'circle', 0, 1, 'linear');
		doTweenAlpha('textfade', 'text', 0, 1, 'linear');
		doTweenAlpha('blackfade', 'blackscreen', 0, 1, 'linear');
	end
    if tag == 'bye' then
        setProperty('static.alpha', 0)
    end

    if tag == 'bye2' then
        removeLuaSprite('js1', false)
        removeLuaSprite('jumpstatic', false)
    end

    if tag == 'bye3' then
        removeLuaSprite('js2', false)
        removeLuaSprite('jumpstatic', false)
    end

    if tag == 'bye4' then
        removeLuaSprite('js3', false)
        removeLuaSprite('jumpstatic', false)
    end
end
