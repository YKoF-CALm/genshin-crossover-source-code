local bfy = 0

function onCreate()
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 120)
end

function onCreatePost()
    bfy = getProperty('boyfriend.y')
end

function onUpdate(elapsed)
    setProperty('boyfriend.y', bfy)
end