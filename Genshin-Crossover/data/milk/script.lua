local xx = 50;
local yy = 300;
local xx2 = 550;
local yy2 = 300;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
    addCharacterToList('hu-tao-alt', 'dad')

    makeLuaSprite('blackscreen', 'exe/blackscreen', 0, 0);
	setObjectCamera('blackscreen', 'hud');
    makeLuaSprite('starttext', 'exe/StartScreens/Sunky', -300, 0)
    setObjectCamera('starttext', 'hud')
    scaleObject('starttext', 1.5, 1)
    updateHitbox('starttext')

    setProperty('introSoundsSuffix', '-blank')
end

local allowCountdown = false

function onStartCountdown()
	if not allowCountdown then
		runTimer('startText', 0.1);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
	return Function_Continue;
end

function onUpdate(elapsed)
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

function onStepHit()
    if curStep == 70 then
        doTweenZoom('zoom', 'camGame', 1.5, 2.3, 'linear')
    end

    if curStep == 97 then
        cancelTween('zoom')
        doTweenZoom('camz', 'camGame', 0.9, 0.01,'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'camz' then
        setProperty("defaultCamZoom",getProperty('camGame.zoom'))
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' then
		addLuaSprite('blackscreen', true);
		runTimer('appear', 0.6, 1);
		runTimer('fadeout', 1.9, 1);
    end
	if tag == 'appear' then
		addLuaSprite('starttext', true);
        doTweenX('0', 'starttext.scale', 1, 0.06, 'bounceInOut')
        playSound('flatBONK', 1)
    end
	if tag == 'fadeout' then
		doTweenAlpha('textfade', 'starttext', 0, 1, 'linear');
		doTweenAlpha('blackfade', 'blackscreen', 0, 1, 'linear');
	end
end