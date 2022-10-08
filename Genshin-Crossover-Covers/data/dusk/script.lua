dady = 0

function onCreate()
    addCharacterToList('keqing-player', 'boyfriend')
    addCharacterToList('keqing-doki-player', 'boyfriend')
    precacheImage('characters/BOYFRIEND')
    precacheImage('characters/BOYFRIEND_TABI')
    addCharacterToList('ganyu-mad', 'dad')
    addCharacterToList('gf_tabi', 'gf')

    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', 500, 450)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf', true);

    makeAnimatedLuaSprite('bfscared', 'characters/BOYFRIEND_TABI', 500, 450)
    addAnimationByPrefix('bfscared', 'idle', 'BF idle dance', 24, false)

    setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)
    setProperty('dad.y', getProperty('dad.y') + 5)
    dady = getProperty('dad.y')
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

function onBeatHit()
    if curBeat == 128 or curBeat == 256 then
        removeLuaSprite('bf', false)
        addLuaSprite('bfscared', true)
    end

    if curBeat == 224 or curBeat == 276 then
        removeLuaSprite('bfscared', false)
        addLuaSprite('bf', true)
    end

    if curBeat == 128 or curBeat == 256 or curBeat == 224 or curBeat == 273 then
        setProperty('dad.y', dady)
    end

    if curBeat % 2 == 0 then
        objectPlayAnimation('bf', 'idle', true)
        objectPlayAnimation('bfscared', 'idle', true)
    end
end

function onStepHit() --Controls Swapping the characters based on previous character selection
	if curStep == 1 then
		if SelectedCharacter == 0 then
			triggerEvent('Change Character', 0, 'keqing-player'); --Selected Singer
		elseif SelectedCharacter == 1 then
			triggerEvent('Change Character', 0, 'keqing-doki-player'); --Selected Singer
            setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if dadName == 'ganyu-mad' then
        if getProperty('health') > 0.03 then
            setProperty('health', getProperty('health') - 0.03)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('CharacterSelect');
	end
end