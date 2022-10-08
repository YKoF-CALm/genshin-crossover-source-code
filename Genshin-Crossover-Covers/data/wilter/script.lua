function onCreate()
	makeAnimatedLuaSprite('cathie', 'characters/Cathie V2', -200, 300)
	addAnimationByPrefix('cathie', 'idle', 'Idle', 24, false)
	setProperty('cathie.flipX', true)
	addLuaSprite('cathie', false)

	makeLuaSprite('wilterRedScreen', nil, -700, -500);
	makeGraphic('wilterRedScreen', screenWidth * 2, screenHeight * 2, 'FF3D6E');
	setScrollFactor('wilterRedScreen', 0, 0);
	addLuaSprite('wilterRedScreen', true);
	setProperty('wilterRedScreen.alpha', 0.0000001);
	setBlendMode('wilterRedScreen', 'add');

	setProperty('dad.y', getProperty('dad.y') + 70)
end

local firstNote = true;
function opponentNoteHit(id, direction, noteType, isSustainNote)
	-- vignette overlay on start -- end overlay
	if firstNote then
		doTweenAlpha('vignetteStartTween', 'psychicVignette', 0, 1, 'sineOut');
		firstNote = false;
	end
end

-- vignette overlay on start
function onSongStart()
	doTweenAlpha('vignetteStartTween', 'psychicVignette', 0.6, 10, 'linear');
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('cathie', 'idle', true)
	end
end


-- Dialogue shit
local allowCountdown = false;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		allowCountdown = true;
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
	end
end

-- End cutscene
local allowEnd = false;

function onEndSong()
	if not allowEnd then
		allowEnd = true;
		setProperty('inCutscene', true);
		startDialogue('dialogue2');
		return Function_Stop;
	end
	return Function_Continue;
end

startedRedTween = false;
function onStepHit()
	if curStep > 960 and curStep < 1024 and not startedRedTween then
		doTweenAlpha('wilterRedTween', 'wilterRedScreen', 0.4, ((1024 - curStep) * stepCrochet) / 1000, 'linear');
		startedRedTween = true;
	elseif curStep >= 1024 and startedRedTween then
		doTweenAlpha('wilterRedTween', 'wilterRedScreen', 0.0, 0.5, 'linear');
	end
end