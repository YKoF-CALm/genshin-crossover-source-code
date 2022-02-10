function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Blammed Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'screamnote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_rushia'); --Change texture
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'screamnote' then
        curHealth = getProperty('health');
		triggerEvent('Screen Shake', '0.1, 0.05', '0.1, 0.05')
		if curHealth > 0.02 then
			setProperty('health', curHealth - 0.02)
		end
    end
end