function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'rainnote' then --Check if the note on the chart is a Rain Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/RAINNOTE_assets'); --Change texture
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notesplashes/RAINnoteSplashes'); -- change splash
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

local dodgeAnims = {'dodgeLEFT', 'dodgeDOWN', 'dodgeUP', 'dodgeRIGHT'}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'rainnote' then
		if songName == 'Apocalyptic Hell' then
			--do nothing
		else
			characterPlayAnim('dad', 'attack', true)
		end
		characterPlayAnim('boyfriend', dodgeAnims[direction+1], true);
		setProperty('boyfriend.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'rainnote' then
		setProperty('health', -1);
		playSound('Thunder', 1);
    end
end