function onCountdownTick(counter)
    if counter == 0 then
        characterPlayAnim('gf', 'three', true)
    end

    if counter == 1 then
        characterPlayAnim('gf', 'two', true)
    end

    if counter == 2 then
        characterPlayAnim('gf', 'one', true)
    end
    
    if counter == 3 then
        characterPlayAnim('gf', 'cheer', true)
    end
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

function onCreate()
    makeAnimatedLuaSprite('bf', 'characters/DDLCBoyFriend_Assets', 500, 500)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf', true)

    addLuaSprite('yuri', false)
    setProperty('yuri.x', 30)
    setProperty('yuri.y', 176)
    addLuaSprite('sayori', false)
    setProperty('sayori.x', 450)
    setProperty('sayori.y', 250)
    addLuaSprite('monika', false)
    setProperty('monika.x', 1250)
    setProperty('monika.y', 176)

    setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)

    precacheImage('doki/clubroom/BakaBGDoodles')
    addCharacterToList('keqing-player', 'boyfriend')
    addCharacterToList('keqing-doki-player', 'boyfriend')
end

function onStepHit()
    if curStep == 1 then
		if SelectedCharacter == 0 then
			triggerEvent('Change Character', 0, 'keqing-doki-player'); --Selected Singer
		elseif SelectedCharacter == 1 then
			triggerEvent('Change Character', 0, 'keqing-player'); --Selected Singer
            setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)
		end
	end

    if curStep == 64 then
        addLuaSprite('doodles', false)
        doTweenAlpha('hi', 'doodles', 1, 4, linear)
    end

    if curStep == 128 then
        objectPlayAnimation('doodles', 'party rock is', true)
    end

    if curStep == 448 then
        doTweenAlpha('bye', 'doodles', 0, 4, linear)
    end

    if curStep == 576 then
        objectPlayAnimation('doodles', 'normal', true)
        doTweenAlpha('hi2', 'doodles', 1, 4, linear)
    end

    if curStep == 704 then
        objectPlayAnimation('doodles', 'party rock is', true)
    end

    if curStep == 1056 then
        doTweenAlpha('bye2', 'doodles', 0, 4, linear)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('yuri', 'idle', true)
        objectPlayAnimation('sayori', 'idle', true)
        objectPlayAnimation('monika', 'idle', true)
        objectPlayAnimation('bf', 'idle', true)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if curStep >= 128 and curStep <= 160 then
        cameraShake('game', 0.01, 0.05)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('CharacterSelect');
	end
end
