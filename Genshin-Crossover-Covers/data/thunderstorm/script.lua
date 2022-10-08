function onCreate()
	precacheImage('notes/holofunk')
	precacheImage('noteSplashes-holofunk')
end

function onCountdownTick(counter)
	if counter == 0 then
		changeNoteSkin('holofunk', 'player')
		changeNoteSplash('noteSplashes-holofunk', 'player')
	end
end

function changeNoteSkin(skin, player)
    if not (skin == 'vanilla') then -- checks if skin isn't vanilla (basic one)
		local mustHit = true -- mustHit detects bf's notes
		if player == 'opponent' then
			mustHit = false -- if it's false then it's opponent's notes
		end

		for i = 0, getProperty(player..'Strums.length')-1 do -- strums from the player parameter (ONLY OPPONENT AND PLAYER)
            setPropertyFromGroup(player..'Strums', i, 'texture', 'notes/'..skin) -- changes the noteskin from parameter skin
        end

        for i = 0, getProperty('unspawnNotes.length')-1 do -- counts all unspawned notes
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then -- checks if the note is normal note
				if mustHit and getPropertyFromGroup('unspawnNotes', i, 'mustPress') then -- does a check if it's a player note
                	setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/'..skin) -- sets player's noteskin
				elseif not mustHit and not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then -- opponent note check
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/'..skin) -- sets the opponent note
				end
            end
        end
    end
end

function changeNoteSplash(skin, player)
    if not (skin == 'vanilla') then -- checks if skin isn't vanilla (basic one)
		local mustHit = true -- mustHit detects bf's notes
		if player == 'opponent' then
			mustHit = false -- if it's false then it's opponent's notes
	end

        for i = 0, getProperty('unspawnNotes.length')-1 do -- counts all unspawned notes
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then -- checks if the note is normal note
				if mustHit and getPropertyFromGroup('unspawnNotes', i, 'mustPress') then -- does a check if it's a player note
                	setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notesplashes/'..skin) -- sets player's noteskin
				elseif not mustHit and not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then -- opponent note check
					setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notesplashes/'..skin) -- sets the opponent note
				end
            end
        end
    end
end

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

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end