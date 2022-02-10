function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Bomb Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bombNoteBF' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/stickybomb'); --Change texture
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notesplashes/stickybombsplashes'); -- change splash
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'bombNoteBF' then
        playSound('firenote', 1);
        characterPlayAnim('dad', 'hurt', true);
        curHealth = getProperty('health')
        setProperty('health', curHealth + 0.3)
    end
end
--[[
function opponentNoteHit()
    if noteType == 'bombNote' then
        playSound('firenote', 1);
        curHealth = getProperty('health')
        if curHealth <= 0.3 then
            setProperty('health', curHealth - 0.3)
        end
        if boyfriendName == 'WhittyAgro-player' then
            if songName == 'Kaboom' then
                characterPlayAnim('bf', 'Shock', true)
            else
                characterPlayAnim('bf', 'hurt', true)
            end
        end
    end
end
]]