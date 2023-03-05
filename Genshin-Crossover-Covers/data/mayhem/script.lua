function onCreate()
    addCharacterToList('xiangling-evil-sp1', 'dad')
    addCharacterToList('xiangling-evil-sp2', 'dad')
    addCharacterToList('xiangling-evil-sp3', 'dad')
    addCharacterToList('xiangling', 'dad')

    setProperty('dad.x', getProperty('dad.x') + 100)
    cameraSetTarget('dad')
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 20)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.02 then
        setProperty('health', getProperty('health') - 0.02)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    setProperty('health', getProperty('health') + 0.05)
end

function onStepHit()
    if curStep == 288 or curStep == 640 or curStep == 928 or curStep == 1112 then
        setProperty('dad.x', getProperty('dad.x') + 100)
    end
end

local dia1 = false
local dia2 = false
local blockEnd = true

function onStartCountdown()
	if not dia1 then
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0.8)
        dia1 = true
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('scoreTxt.visible', false)
    if blockEnd then
		if not dia2 then
			dia2 = true
        	setProperty('inCutscene', true)
			runTimer('endDialogue', 0.8)
		end
		return Function_Stop;
	end
	return Funtion_Continue;
end

function onNextDialogue(count)
	if count >= 62 then
        runTimer('endthethingalready', 20)
        blockEnd = false
		cancelTimer('delayEnd')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then
		startDialogue('dialogue')
	end

    if tag == 'endDialogue' then
		startDialogue('dialogue2')
        runTimer('delayEnd', 300)
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
