function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Bomb Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bombNoteOP' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'stickybomb'); --Change texture
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'stickybombsplashes'); -- change splash
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end
--[[
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'bombNote' then
        playSound('firenote', 1);
        characterPlayAnim('dad', 'hurt', true);
        curHealth = getProperty('health')
        setProperty('health', curHealth + 0.3)
        if boyfriendName == 'WhittyAgro-player' then
            --do nothing
        else
            characterPlayAnim('bf', 'attack', true)
        end
    end
end
]]
function opponentNoteHit()
    if noteType == 'bombNoteOP' then
        playSound('firenote', 1);
        characterPlayAnim('dad', 'attack', true)
        curHealth = getProperty('health')
        if curHealth <= 0.3 then
            setProperty('health', curHealth - 0.3)
        end
        characterPlayAnim('bf', 'Shock', true)
    end
end