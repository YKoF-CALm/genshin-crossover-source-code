function onStartCountdown()
    for i = 0, getProperty('playerStrums.length')-1 do
		setPropertyFromGroup('playerStrums', i, 'texture', 'holofunk');
	end
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'holofunk');
		end
	end
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes-holofunk');
        end
    end
	return Function_Continue;
end