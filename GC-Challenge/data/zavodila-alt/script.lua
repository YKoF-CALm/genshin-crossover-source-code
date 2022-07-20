function onCreate()
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 20)
end

function opponentNoteHit(id,d,t,s)
    cameraShake('game', 0.005, 0.05)
end