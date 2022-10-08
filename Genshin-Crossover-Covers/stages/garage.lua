function onCreate()
    makeAnimatedLuaSprite('aaa', 'sunday/aaa', -422.05, 284.05)
    addAnimationByIndices('aaa', 'none', 'aaaa', '4', 24)
    addAnimationByIndices('aaa', 'idle', 'aaaa', '0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 4', 24)
    objectPlayAnimation('aaa', 'none', true)

    makeAnimatedLuaSprite('garage', 'sunday/bg_binb', -316, -209)
    addAnimationByPrefix('garage', 'idle', 'Background', 24, true)
    addAnimationByPrefix('garage', 'crazy', 'bg_binb0', 24, true)
    addAnimationByPrefix('garage', 'not', 'bg_binb_calm0', 10, true)

    makeAnimatedLuaSprite('speakers', 'sunday/rig', -298, 197)
    addAnimationByIndices('speakers', 'idle', 'amp', '0', 24)
    addAnimationByPrefix('speakers', 'boom', 'amp boom', 24, true)
    setProperty('speakers.x', -260.75)
    setProperty('speakers.y', 243.95)

    makeLuaSprite('fret', 'sunday/fret', 0, 0)
    setObjectCamera('fret', 'hud')
    setProperty('fret.alpha', 0)

    addLuaSprite('garage', false)
    objectPlayAnimation('garage', 'idle', true)
    addLuaSprite('aaa', false)
    addLuaSprite('speakers', false)
    objectPlayAnimation('speakers', 'idle', true)
end
