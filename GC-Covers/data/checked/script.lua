local allowCountdown = false
local dia1 = false
local dia2 = false
local blockEnd = true

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not dia1 then
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0.8)
        dia1 = true
		return Function_Stop
	end
	return Function_Continue
end

function onEndSong()
    if not allowCountdown and blockEnd then
		if not dia2 then
			dia2 = true
        	setProperty('inCutscene', true)
			startDialogue('dialogue2');
			runTimer('delayEnd', 150)
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
	if dia2 and count >= 123 then
        runTimer('endthethingalready', 10)
        blockEnd = false
		cancelTimer('delayEnd')
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue')
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

function onCreate()
    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', 700, 400)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addAnimationByPrefix('bf', 'hey', 'BF HEY!!', 24, false)
    
    makeAnimatedLuaSprite('bf2', 'characters/BOYFRIEND_TABI', 700, 400)
    addAnimationByPrefix('bf2', 'idle', 'BF idle dance', 24, false)
    addAnimationByPrefix('bf2', 'hurt', 'BF hit', 24, false)

    addLuaSprite('bf2', false)

    addCharacterToList('lumine', 'dad')
    addCharacterToList('aether-mic', 'boyfriend')
    precacheImage('characters/BOYFRIEND_TABI')
end

local warn = 0

function onBeatHit()
    if curBeat == 32 then
        warn = 1
    end

    if curBeat == 144 then
        warn = 0
        setProperty('bf2.x', 700)
        setProperty('bf2.y', 400)
    end

    if warn == 1 then
        if curBeat % 4 == 2 then
            health = getProperty('health')
            setProperty('health', health - 0.03)
            cameraShake('game', 0.01, 0.05)
            cameraShake('hud', 0.01, 0.05)
            objectPlayAnimation('bf2', 'hurt', true)
            setProperty('bf2.x', 680)
            setProperty('bf2.y', 382)
        end
        if curBeat % 4 == 0 then
            objectPlayAnimation('bf2', 'idle', true)
            setProperty('bf2.x', 700)
            setProperty('bf2.y', 400)
        end
    else
        if curBeat % 2 == 0 then
            objectPlayAnimation('bf2', 'idle', true)
            objectPlayAnimation('bf', 'idle', true)
        end
    end

end

function onStepHit()
    if curStep == 888 then
        removeLuaSprite('bf2', false)
        addLuaSprite('bf', false)
        objectPlayAnimation('bf', 'hey', true)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	curHealth = getProperty('health')
    setProperty('health', curHealth - 0.02)
end