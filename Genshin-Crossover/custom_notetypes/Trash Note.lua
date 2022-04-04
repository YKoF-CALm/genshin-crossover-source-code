function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Trash Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/Trash Note'); --Change the note texture
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Trash Note' then
	    health = getProperty('health')
	    if getProperty('health') > 0.1 then
		    setProperty('health', health- 0.5);
        end
    end
end