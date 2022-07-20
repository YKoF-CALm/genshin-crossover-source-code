function onCreatePost()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'texture', 'notes/Cuphead_NOTE_assets')
    end

end
function onUpdate()
    for j = 0,getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes', j, 'noteType') == '' then
            setPropertyFromGroup('notes', j,'texture','notes/Cuphead_NOTE_assets')
        end
    end
end