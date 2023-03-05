function onCreate()
    precacheImage('notes/Majin_Notes')
    precacheImage('notesplashes/endlessNoteSplashes')
    precacheImage('exe/three')
    precacheImage('exe/two')
    precacheImage('exe/one')
    precacheImage('exe/gofun')
    makeLuaSprite('3', 'exe/three', 70, 150);
    makeLuaSprite('2', 'exe/two', 70, 150);
    makeLuaSprite('1', 'exe/one', 70, 150);
    makeLuaSprite('go', 'exe/gofun', 70, 150);
    makeLuaSprite('blackscreen', 'exe/blackscreen', 0, 0);
	setObjectCamera('blackscreen', 'hud');
    makeLuaSprite('circle', 'exe/StartScreens/CircleMajin', 777, 0);
	setObjectCamera('circle', 'hud');
    makeLuaSprite('text', 'exe/StartScreens/TextMajin', -1100, 0);
	setObjectCamera('text', 'hud');

    setProperty('dad.y', getProperty('dad.y') + 10)

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

local xx = 520;
local yy = 430;
local xx2 = 820;
local yy2 = 530;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
spinstep = {
    [272] = 'spin', 
    [276] = 'spin',
    [336] = 'spin',
    [340] = 'spin',
    [400] = 'spin',
    [404] = 'spin',
    [464] = 'spin',
    [468] = 'spin',
    [528] = 'spin',
    [532] = 'spin',
    [592] = 'spin',
    [596] = 'spin',
    [656] = 'spin',
    [660] = 'spin',
    [720] = 'spin',
    [724] = 'spin',
    [784] = 'spin',
    [788] = 'spin',
    [848] = 'spin',
    [852] = 'spin',
    [912] = 'spin',
    [916] = 'spin',
    [976] = 'spin',
    [980] = 'spin',
    [1040] = 'spin',
    [1044] = 'spin',
    [1104] = 'spin',
    [1108] = 'spin',
    [1168] = 'spin',
    [1172] = 'spin',
    [1232] = 'spin',
    [1236] = 'spin',
    [1296] = 'spin',
    [1300] = 'spin',
    [1360] = 'spin',
    [1364] = 'spin',
    [1424] = 'spin',
    [1428] = 'spin',
    [1488] = 'spin',
    [1492] = 'spin',
    [1552] = 'spin',
    [1556] = 'spin',
    [1616] = 'spin',
    [1620] = 'spin',
}

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
    
    if spinstep[curStep] then
        noteTweenAngle('oa1', 0, getPropertyFromGroup('opponentStrums', 0, 'angle') + 360, 0.05, 'circOut')
        noteTweenAngle('oa2', 1, getPropertyFromGroup('opponentStrums', 1, 'angle') + 360, 0.05, 'circOut')
        noteTweenAngle('oa3', 2, getPropertyFromGroup('opponentStrums', 2, 'angle') + 360, 0.05, 'circOut')
        noteTweenAngle('oa4', 3, getPropertyFromGroup('opponentStrums', 3, 'angle') + 360, 0.05, 'circOut')
        noteTweenAngle('pa1', 4, getPropertyFromGroup('playerStrums', 0, 'angle') + 360, 0.05, 'circOut')
        noteTweenAngle('pa2', 5, getPropertyFromGroup('playerStrums', 1, 'angle') + 360, 0.05, 'circOut')
        noteTweenAngle('pa3', 6, getPropertyFromGroup('playerStrums', 2, 'angle') + 360, 0.05, 'circOut')
        noteTweenAngle('pa4', 7, getPropertyFromGroup('playerStrums', 3, 'angle') + 360, 0.05, 'circOut')
    end
end

function onStepHit()
    if curStep == 888 then
        setProperty('defaultCamZoom', 1)
        addLuaSprite('3', 'false');
		setObjectOrder('3',12);
		runTimer('start3', 0);
    end
    if curStep == 892 then
        setProperty('defaultCamZoom', 1.2)
        addLuaSprite('2', 'false');
		setObjectOrder('2',12);
		runTimer('start2', 0);
    end
    if curStep == 896 then
        setProperty('defaultCamZoom', 1.4)
        addLuaSprite('1', 'false');
		setObjectOrder('1',12);
		runTimer('start1', 0);
    end
    if curStep == 900 then
        setProperty('defaultCamZoom', 0.9)
        addLuaSprite('go', 'false');
		setObjectOrder('go',12);
		runTimer('startgo', 0);
    end
end

function onTweenCompleted(tag)
    if tag == 'pa4' then
        setPropertyFromGroup('opponentStrums', 0, 'angle', 0)
        setPropertyFromGroup('opponentStrums', 1, 'angle', 0)
        setPropertyFromGroup('opponentStrums', 2, 'angle', 0)
        setPropertyFromGroup('opponentStrums', 3, 'angle', 0)
        setPropertyFromGroup('playerStrums', 0, 'angle', 0)
        setPropertyFromGroup('playerStrums', 1, 'angle', 0)
        setPropertyFromGroup('playerStrums', 2, 'angle', 0)
        setPropertyFromGroup('playerStrums', 3, 'angle', 0)
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
    if tag == 'start3' then	
		doTweenAlpha('threefade', '3', 0, 0.3, 'linear');
    end
	if tag == 'start2' then	
		doTweenAlpha('twofade', '2', 0, 0.3, 'linear');
    end
	if tag == 'start1' then	
		doTweenAlpha('onefade', '1', 0, 0.3, 'linear');
    end
	if tag == 'startgo' then	
		doTweenAlpha('gofade', 'go', 0, 0.3, 'linear');
	end
end