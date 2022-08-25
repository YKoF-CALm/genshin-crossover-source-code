function onCreate()
    addCharacterToList('keqing-player', 'boyfriend')
    addCharacterToList('keqing-doki-player', 'boyfriend')

    setProperty('introSoundsSuffix', '-h24')
    setProperty('dad.x', getProperty('dad.x') + 200)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 80)

    makeAnimatedLuaSprite('bf', 'characters/bf-h24', 1400, 950)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, true)
    scaleObject('bf', 0.85, 0.85)
    updateHitbox('bf')
    addLuaSprite('bf', false)
    setObjectOrder('bf', getObjectOrder('gfGroup'))
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
    if curBeat % 4 == 0 then
        objectPlayAnimation('bf', 'idle', true)
    end
end

function onStepHit() --Controls Swapping the characters based on previous character selection
	if curStep == 1 then
		if SelectedCharacter == 0 then
			triggerEvent('Change Character', 0, 'keqing-player'); --Selected Singer
		elseif SelectedCharacter == 1 then
			triggerEvent('Change Character', 0, 'keqing-doki-player'); --Selected Singer
            setProperty('boyfriend.x', getProperty('boyfriend.x') + 80)
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('CharacterSelect');
	end
end