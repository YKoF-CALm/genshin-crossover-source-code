local bfx = 750
local bfy = 480
local aloex = 1500
local aloey = 480
local allowIdleBF = true
local allowIdleAloe = true

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-spirit-dead');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'GameOverScary');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'SpiritBFDeath');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'SpiritBFRetry');
	setProperty('camZooming', true);

	makeAnimatedLuaSprite('bf', 'characters/bf-accelerant', bfx, bfy)
	addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
	addAnimationByPrefix('bf', '0', 'BF NOTE LEFT0', 24, false)
	addAnimationByPrefix('bf', '1', 'BF NOTE DOWN0', 24, false)
	addAnimationByPrefix('bf', '2', 'BF NOTE UP0', 24, false)
	addAnimationByPrefix('bf', '3', 'BF NOTE RIGHT0', 24, false)
	addLuaSprite('bf', true)
    addOffset('bf', 'idle', -5, 0)
    addOffset('bf', '0', 5, -6)
    addOffset('bf', '1', -18, -15)
    addOffset('bf', '2', -39, 27)
    addOffset('bf', '3', -45, -7)

	makeAnimatedLuaSprite('aloe', 'characters/Aloe', aloex, aloey)
	addAnimationByPrefix('aloe', 'idle', 'BF idle dance', 24, false)
	addAnimationByPrefix('aloe', '0', 'BF NOTE LEFT0', 24, false)
	addAnimationByPrefix('aloe', '1', 'BF NOTE DOWN0', 24, false)
	addAnimationByPrefix('aloe', '2', 'BF NOTE UP0', 24, false)
	addAnimationByPrefix('aloe', '3', 'BF NOTE RIGHT0', 24, false)
    addOffset('aloe', 'idle', -7, 0)
    addOffset('aloe', '0', -3, -11)
    addOffset('aloe', '1', 17, -53)
    addOffset('aloe', '2', -25, 22)
    addOffset('aloe', '3', -31, -3)

	makeAnimatedLuaSprite('aloe2', 'characters/Aloe', aloex, aloey)
	addAnimationByPrefix('aloe2', 'idle', 'BF idle fard', 24, false)
	addAnimationByPrefix('aloe2', '0', 'BF NOTE LEFT alt', 24, false)
	addAnimationByPrefix('aloe2', '1', 'BF NOTE DOWN alt', 24, false)
	addAnimationByPrefix('aloe2', '2', 'BF NOTE UP alt', 24, false)
	addAnimationByPrefix('aloe2', '3', 'BF NOTE RIGHT alt', 24, false)
    addOffset('aloe2', 'idle', -7, 0)
    addOffset('aloe2', '0', -3, -11)
    addOffset('aloe2', '1', 17, -53)
    addOffset('aloe2', '2', -25, 22)
    addOffset('aloe2', '3', -31, -3)
	addLuaSprite('aloe2', true)

	makeAnimatedLuaSprite('zap', 'cloud/rain/lightningStrike', 130, -1100)
    addAnimationByPrefix('zap', 'zap', 'strike', 24, false)

    setProperty('boyfriend.x', getProperty('boyfriend.x') + 120)
    cameraSetTarget('boyfriend')
end

bfNoteX0 = 0;
bfNoteX1 = 0;
bfNoteX2 = 0;
bfNoteX3 = 0;
dadNoteX0 = 0;
dadNoteX1 = 0;
dadNoteX2 = 0;
dadNoteX3 = 0;
isMoving = false;
function onCountdownStarted()
	for i = 0, 3 do
		_G['bfNoteX'..i] = _G['defaultPlayerStrumX'..i];
		_G['dadNoteX'..i] = _G['defaultOpponentStrumX'..i];
	end
end

function onEvent(name, value1, value2)
	if name == 'Flip Notes' or name == 'Swap Notes' then
		runTimer('Save New Note X', 0.31);
		isMoving = true;
	elseif name == 'Must Press Swap' then
		runTimer('Save New Note X', 0.36);
		isMoving = true;
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		if allowIdleBF then
			playAnim('bf', 'idle', true)
		end
		if allowIdleAloe then
			playAnim('aloe', 'idle', true)
			playAnim('aloe2', 'idle', true)
		end
	end

	if curBeat == 284 then
		removeLuaSprite('aloe2', false)
		addLuaSprite('aloe', true)
	end

	if curBeat == 287 then
		doTweenAlpha('uproarScreenThingTweenbf', 'bf', 0, 0.6, 'sineOut');
		doTweenAlpha('uproarScreenThingTweenaloe', 'aloe', 0, 0.6, 'sineOut');
	end

	if curBeat == 303 then
		doTweenAlpha('uproarScreenThingTweenbf', 'bf', 1, 0.4, 'sineOut');
		doTweenAlpha('uproarScreenThingTweenaloe', 'aloe', 1, 0.4, 'sineOut');
	end

	if curBeat == 368 then
		doTweenAlpha('uproarScreenThingTweenbf', 'bf', 0, (crochet * 4) / 1000, 'linear');
		doTweenAlpha('uproarScreenThingTweenaloe', 'aloe', 0, (crochet * 4) / 1000, 'linear');
	end

	if curBeat == 374 then
		setProperty('aloe.x', getCharacterX('boyfriend') + 500)
		setProperty('aloe.y', getCharacterY('boyfriend') + 350)
		aloex = getProperty('aloe.x')
		aloey = getProperty('aloe.y')
		setProperty('aloe.color', getColorFromHex('000000'));
		setProperty('aloe.alpha', 0.000001);
		doTweenAlpha('bfSilhouetteTweenaloe', 'aloe', 1, (crochet * 2) / 1000, 'linear');
	end

	if curBeat == 386 then
		doTweenAlpha('bfSilhouetteTweenaloe', 'aloe', 0, (crochet * 4) / 1000, 'linear');
	end
end

lastNote = {0, ""}

function goodNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "Special Sing" or lastNote[2] == 'Duet Note' or lastNote[2] == 'Inversed Special Sing' then -- Change "No Animation" to be your note type, usually you can just keep it as no anim assuming you arent using it elsewhere
		if (curStep >= 576 and curStep < 592) or (curStep >= 640 and curStep < 672) or (curStep > 1135) then
	    	playAnim('bf', lastNote[1], true)
			allowIdleBF = false
			runTimer('resumeIdleBF', 0.5, 1)
		end
		if (curStep >= 608 and curStep < 623) or (curStep >= 704 and curStep < 736) then
			playAnim('aloe2', lastNote[1], true)
			allowIdleAloe = false
			runTimer('resumeIdleAloe', 0.5, 1)
		end
		if curStep > 1135 then
			playAnim('aloe', lastNote[1], true)
			allowIdleAloe = false
			runTimer('resumeIdleAloe', 0.5, 1)
		end
	end

	if lastNote[2] == 'rainnote' then
		playSound('Thunder', 1);
        addLuaSprite('zap', true)
        objectPlayAnimation('zap', 'zap', true)
        runTimer('zapgone', 0.375, 1)
    end
end

function onUpdate(elapsed)
	shakeAmount = 4;
	songPos = getSongPosition();
	if songPos < 67200 then
		shakeAmount = 0
	end
	if(songPos > 86400 and songPos < 91200) then
		shakeAmount = 4 - (songPos - 86400) / 400;
	end
	if(songPos > 110400) then
		shakeAmount = 4 - (songPos - 110400) / 800;
	end
	
	if shakeAmount < 0 then
		shakeAmount = 0;
	end

	for i = 0, 3 do
		if not isMoving then
			setPropertyFromGroup('playerStrums', i, 'x', _G['bfNoteX'..i] + getRandomFloat(-shakeAmount, shakeAmount));
			setPropertyFromGroup('opponentStrums', i, 'x', _G['dadNoteX'..i] + getRandomFloat(-shakeAmount, shakeAmount));
		end
		setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i] + getRandomFloat(-shakeAmount, shakeAmount));
		setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i] + getRandomFloat(-shakeAmount, shakeAmount));
	end
end

local allowCountdown = false
local dia1 = false
local dia2 = false
local blockEnd = true

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not dia1 then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		dia1 = true
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
    if not allowCountdown and isStoryMode and blockEnd then
		if not dia2 then
			dia2 = true
        	setProperty('inCutscene', true)
			startDialogue('dialogue2');
			runTimer('delayEnd', 300)
		end
		if keyJustPressed('back') then
			blockEnd = false
			cancelTimer('delayEnd')
			endSong()
    		return Function_Continue;
		end
		return Function_Stop;
	end
	return Funtion_Continue;
end

function onNextDialogue(count)
	if dia2 and count >= 155 then
        runTimer('endthethingalready', 10)
        blockEnd = false
		cancelTimer('delayEnd')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'zapgone' then
        removeLuaSprite('zap', false)
    end

	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
	end

	if tag == 'Save New Note X' then
		for i = 0, 3 do
			_G['bfNoteX'..i] = getPropertyFromGroup('playerStrums', i, 'x');
			_G['dadNoteX'..i] = getPropertyFromGroup('opponentStrums', i, 'x');
		end
		isMoving = false;
	end

	if tag == 'resumeIdleBF' then
		allowIdleBF = true
	end

	if tag == 'resumeIdleAloe' then
		allowIdleAloe = true
	end

	if tag == 'delayEnd' then
		blockEnd = false
		endSong()
	end

	if tag == 'endthethingalready' then
        blockEnd = false
        endSong()
    end
end