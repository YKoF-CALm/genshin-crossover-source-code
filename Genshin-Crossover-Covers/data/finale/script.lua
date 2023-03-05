local flashAllow = true

function onCreate()
    addLuaScript('epicScripts/dead')
    --addLuaScript('epicScripts/do-not-delete')
    addLuaScript('epicScripts/impUI')
    addCharacterToList('yanfei-tn-player', 'boyfriend')
    addCharacterToList('yanfei-nightmare-player', 'boyfriend')

    setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
end

function onSongStart()
	noteTweenX("NoteMove1", 0, -1000, 0.5, cubeInOut)
	noteTweenX("NoteMove2", 1, -1000, 0.5, cubeInOut)
	noteTweenX("NoteMove3", 2, -1000, 0.5, cubeInOut)
	noteTweenX("NoteMove4", 3, -1000, 0.5, cubeInOut)
end

function onCountdownTick(counter)
    if counter == 1 then
        setObjectCamera('countdownReady', 'other')
        setProperty('camHUD.alpha', 0)
        addLuaSprite('black', false)
    end

    if counter == 2 then
        setObjectCamera('countdownSet', 'other')
    end

    if counter == 3 then
        setObjectCamera('countdownGo', 'other')
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.015 then
        setProperty('health', getProperty('health') - 0.015)
    end
end

function onBeatHit()
    if curBeat == 360 or curBeat == 488 then
        if flashAllow then
            cameraFlash('game', 'FA1643', 0.5, true)
        end
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
        setProperty('boyfriend.x', getProperty('boyfriend.x') - 80)
    end

    if curBeat == 360 then
        playSound('sans/eye', 1)
    end

    if curBeat == 488 then
        playSound('Lights_Turn_On', 0.6)
    end

    if curBeat == 504 then
        setProperty('black2.alpha', 1)
        flashAllow = false
    end
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene then
		allowCountdown = true
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0.8)
		return Function_Stop
	end
	return Function_Continue
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('dialogue')
	end
end

function onNextDialogue(count)
    if count == 14 or count == 15 then
        setProperty('black2.alpha', 1)
    end
end

local allowEnd = false

function onEndSong()
	if not allowEnd then
		allowEnd = true
		setProperty('inCutscene', true)
		startDialogue('dialogue2')
		return Function_Stop
	end
	return Function_Continue
end