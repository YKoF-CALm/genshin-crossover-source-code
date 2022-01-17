local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
	makeAnimatedLuaSprite('burst', 'burst', 600, 200)
	luaSpriteAddAnimationByPrefix('burst', 'burst', 'burst', 24, false);
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onBeatHit()
	if curBeat == 448 then
		addLuaSprite('burst', false)
		luaSpritePlayAnimation('burst', 'burst', false)
		playSound('burst', 1)
	end

	if curBeat == 449 then
		removeLuaSprite('burst', true)
	end
end