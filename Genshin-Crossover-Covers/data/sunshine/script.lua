function onCreate()
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 100)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 100)
    setProperty('dad.y', getProperty('dad.y') + 30)

    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', 1400, 400)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, true)
    addLuaSprite('bf', false)

    makeAnimatedLuaSprite('bf2', 'characters/BOYFRIEND_TABI', 1400, 400)
    addAnimationByPrefix('bf2', 'idle', 'BF idle dance', 24, true)

    setProperty('introSoundsSuffix', '-blank')
    makeLuaSprite('ready', 'exe/ready', screenWidth / 4 - 50, screenHeight / 4)
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'exe/set', screenWidth / 4 - 20, screenHeight / 4)
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'exe/go', screenWidth / 4 + 20, screenHeight / 4 - 30)
    setObjectCamera('go', 'other')
end

function onCountdownTick(counter)
	if counter == 0 then
		addLuaSprite('ready', true);
		playSound('taildoll/ready');
		doTweenX('readyx', 'ready.scale', 0.9, crochet/500);
		doTweenY('readyy', 'ready.scale', 0.9, crochet/500);
	end
	if counter == 1 then
		addLuaSprite('set', true);
		removeLuaSprite('ready');
		playSound('taildoll/set');
		doTweenX('setx', 'set.scale', 0.9, crochet/500);
		doTweenY('sety', 'set.scale', 0.9, crochet/500);
        runTimer('hey', 0.8, 1)
	end
	setProperty('countdownReady.visible', false)
	setProperty('countdownSet.visible', false)
	setProperty('countdownGo.visible', false)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'hey' then
        addLuaSprite('go', true);
		removeLuaSprite('set');
		playSound('taildoll/go');
		doTweenX('gox', 'go.scale', 1.1, crochet/500);
		doTweenY('goy', 'go.scale', 1.1, crochet/500);
        runTimer('bye', 0.7, 1)
    end

    if tag == 'bye' then
        removeLuaSprite('go');
    end
end

function onBeatHit()
    if curBeat % 4 == 0 then
        objectPlayAnimation('bf', 'idle', true)
        objectPlayAnimation('bf2', 'idle', true)
    end
end

function onStepHit()
    if curStep == 1 then
        removeLuaSprite('bf', false)
        addLuaSprite('bf2', false)
    end
end

local xx = 570;
local yy = 580;
local xx2 = 1020;
local yy2 = 530;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate()
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