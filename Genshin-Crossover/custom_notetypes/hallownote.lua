function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Hallow Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'hallownote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_HALLOW'); --Change texture
			
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'hallownote' then
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'halloenote' then
		setProperty('health', -1);
	end
end