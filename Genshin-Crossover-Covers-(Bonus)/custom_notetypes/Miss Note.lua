function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Miss Note' then
        if direction == 0 then
            characterPlayAnim('boyfriend', 'singLEFTmiss', true)
        elseif direction == 1 then
            characterPlayAnim('boyfriend', 'singDOWNmiss', true)
        elseif direction == 2 then
            characterPlayAnim('boyfriend', 'singUPmiss', true)
        elseif direction == 3 then
            characterPlayAnim('boyfriend', 'singRIGHTmiss', true)
        end
    end
end