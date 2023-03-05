function onCreate()
    setProperty('dad.scale.x', 0.8)
    setProperty('dad.scale.y', 0.8)
    setProperty('dad.y', getProperty('dad.y') + 100)
    cameraSetTarget('dad')
end