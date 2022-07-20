function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'haatonote' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_haato'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notesplashes/HaatoSplash'); -- change splash

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'haatonote' then
		playSound('funnyWord')
		cameraFlash('other', '000000', 0.5, false)
	end
end