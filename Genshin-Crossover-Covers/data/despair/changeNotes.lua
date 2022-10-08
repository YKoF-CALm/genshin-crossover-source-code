function onUpdate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        --Check if the note is an Instakill Note
        if curStep > 1296 then
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BendySplashNote' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/BendySplashNoteDark');--Change texture
            end
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BendyShadowNote' then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/BendyShadowNoteDark');--Change texture
            end
        end
    end
end