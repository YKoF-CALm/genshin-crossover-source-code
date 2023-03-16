function onCreate()
    setProperty('introSoundsSuffix', '-sans')
    nightmareSansBGManager('normal')
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 20)
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 50)

    addCharacterToList('ganyu-mad-player', 'boyfriend')
    addCharacterToList('ganyu-indie-nightmare-player', 'boyfriend')
end

local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
local SelectedCharacter = 0
function onNextDialogue(count) --dumbass character selection screen
	-- triggered when the next dialogue line starts, 'line' starts with 1
	if keyPressed('up') then --defaults to BF
		SelectedCharacter = 0
	elseif keyPressed('down') then --Selects GF
		SelectedCharacter = 1
	end
end

function onSongStart() --used to clear any damage/score/accuracy changes made during character switching
	-- Inst and Vocals start playing, songPosition = 0
	setProperty('health', 1);
	setProperty('songMisses', 0)
	setProperty('songScore',0)
end

local xx = 300;
local yy = 300;
local xx2 = 500;
local yy2 = 300;
local ofs = 30;
local followchars = true;

function onUpdate(elapsed)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    end
end

function onStepHit()
    if curStep == 1 then
		if SelectedCharacter == 0 then
			triggerEvent('Change Character', 0, 'ganyu-indie-nightmare-player'); --Selected Singer
		elseif SelectedCharacter == 1 then
			triggerEvent('Change Character', 0, 'ganyu-mad-player'); --Selected Singer
            setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
		end
	end

    if not lowQuality and flashingLights then
        if curStep == 384 or curStep == 768 or curStep == 1184 then
            nightmareSansBGManager('beatdrop')
        end

        if curStep == 512 or curStep == 928 or curStep == 1440 then
            nightmareSansBGManager('beatDropFinish')
        end
    end
end

function nightmareSansBGManager(mode)
    if mode == 'normal' then
        objectPlayAnimation('bg', 'normal', true)
        setProperty('bg.alpha', 1)
        setProperty('beatDropBG.alpha', 0)
    elseif mode == 'beatdrop' then
        objectPlayAnimation('bg', 'beatdrop', true)
        setProperty('bg.alpha', 1)
        setProperty('beatDropBG.alpha', 0)
    elseif mode == 'beatDropFinish' then
        objectPlayAnimation('bg', 'beatDropFinish', true)
        setProperty('bg.alpha', 1)
        setProperty('beatDropBG.alpha', 1)
    end
end
    
function opponentNoteHit(id, direction, noteType, isSustainNote)
    cameraShake('camGame', 0.015, 0.1);
    cameraShake('camHud', 0.005, 0.1);
end

function onEvent(name, value1, value2)
    if name == 'SansDodge' then
        if not mustHitSection then
            followchars = false
            triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 50,300)
            runTimer('resumeCam', 0.5, 1)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeCam' then
        followchars = true
    end

    if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('CharacterSelect');
	end
end