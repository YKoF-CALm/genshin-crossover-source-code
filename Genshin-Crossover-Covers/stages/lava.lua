function onCreate()
    makeLuaSprite('bgbg', 'shaggy/WBG/BGBG', -1940, -1112)
    setScrollFactor('bgbg', 0.5, 0.5)
    addLuaSprite('bgbg', false)

    makeLuaSprite('lavalimits', 'shaggy/WBG/LavaLimits', -1770, 168)
    setScrollFactor('lavalimits', 0.55, 0.55)
    addLuaSprite('lavalimits', false)

    makeLuaSprite('bgSpikes', 'shaggy/WBG/BGSpikes', 112, -36)
    setScrollFactor('bgSpikes', 0.6, 0.6)
    addLuaSprite('bgSpikes', false)

    makeLuaSprite('spikes', 'shaggy/WBG/Spikes', -1186, -234)
    setScrollFactor('spikes', 0.8, 0.8)
    addLuaSprite('spikes', false)

    makeLuaSprite('ground', 'shaggy/WBG/Ground', -1320, 590)
    setScrollFactor('ground', 1, 1)
    addLuaSprite('ground', false)

    close(true)
end