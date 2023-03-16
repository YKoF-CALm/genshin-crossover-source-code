function onCreate()
	makeAnimatedLuaSprite('bg', 'indie/sans/Nightmare Sans Stage',-600,-160)
    addAnimationByIndices('bg','normal','Normal instance 1', '0', 24)
	addAnimationByPrefix('bg','beatdrop','Normal instance 1',24,true)
	addAnimationByPrefix('bg','beatDropFinish','sdfs instance 1',24,false)
    objectPlayAnimation('bg', 'normal', true)
    setScrollFactor('bg', 1, 1)
	addLuaSprite('bg', false)

    if not lowQuality and flashingLights then
        makeAnimatedLuaSprite('beatDropBG', 'indie/sans/Nightmare Sans Stage',-100,300)
        addAnimationByPrefix('beatDropBG','beathit','dd instance 1',32,false);
        setBlendMode('beatDropBG','add')
        setProperty('beatDropBG.alpha',0)
        addLuaSprite('beatDropBG', false)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('beatDropBG', 'beathit', true)
    end
end