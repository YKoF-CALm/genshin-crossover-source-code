local maxHealth = 2
function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'haatonote' and not isSustainNote then
        maxHealth = maxHealth - 0.5
    end
end

function onUpdate(elapsed)
    if getProperty('health') > maxHealth then
        setProperty('health', maxHealth)
    end
end