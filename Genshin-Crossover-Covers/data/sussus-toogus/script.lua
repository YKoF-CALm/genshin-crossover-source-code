function onCreate()
    addCharacterToList('keqing-player', 'boyfriend')
    addCharacterToList('keqing-doki-player', 'boyfriend')

    makeAnimatedLuaSprite('saxguy', 'impostor/mira/cyan_toogus', 0, 0)
    addAnimationByPrefix('saxguy', 'bop', 'Cyan Dancy', 24, true)
    setScrollFactor('saxguy', 1, 1)
    playAnim('saxguy', 'bop', true)
    updateHitbox('saxguy')

    setProperty('dad.y', getProperty('dad.y') + 65)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 75)
end

local xx =  500;
local yy =  475;
local xx2 = 900;
local yy2 = 475;
local ofs = 20;
local followchars = true;

function onUpdate(elapsed)
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.9)
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

            setProperty('defaultCamZoom',0.9)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local SelectedCharacter = 0
function onNextDialogue(count)
	if keyPressed('up') then
		SelectedCharacter = 0
	elseif keyPressed('down') then
		SelectedCharacter = 1
	end
end

function onSongStart()
	setProperty('health', 1);
	setProperty('songMisses', 0)
	setProperty('songScore',0)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('CharacterSelect');
	end
end

function onStepHit()
    if curStep == 1 then
		if SelectedCharacter == 0 then
			triggerEvent('Change Character', 0, 'keqing-player')
		elseif SelectedCharacter == 1 then
			triggerEvent('Change Character', 0, 'keqing-doki-player')
            setProperty('boyfriend.y', getProperty('boyfriend.y') + 60)
		end
	end

    if curStep == 1 or curStep == 896 then
        doTweenAlpha('bye', 'camHUD', 0, 0.7, 'quadInOut')
    end

    if curStep == 127 or curStep == 1024 then
        doTweenAlpha('hi', 'camHUD', 1, 0.7, 'quadInOut')
    end

    if curStep == 896 then
        doTweenX('go', 'saxguy', 1300, 13.5, 'linear')
    end

    if curStep == 1040 then
        removeLuaSprite('saxguy')
    end
end