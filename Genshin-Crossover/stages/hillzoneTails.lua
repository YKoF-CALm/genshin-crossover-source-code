function onCreate()
    makeLuaSprite('bg', 'tgt/chapter1/images/sky', -600, -200)
    setScrollFactor('bg', 0.4, 0.4)
    addLuaSprite('bg', false)

    makeLuaSprite('stageFront', 'tgt/chapter1/images/grass', -650, 600)
    setScrollFactor('stageFront', 0.9, 0.9)
    addLuaSprite('stageFront', false)
    scaleObject('stageFront', 1.1, 1.1)
    updateHitbox('stageFront')

    makeLuaSprite('stageCurtains', 'tgt/chapter1/images/foreground', -450, -150)
    setScrollFactor('stageCurtains', 1.3, 1.3)
    addLuaSprite('stageCurtains', false)
    scaleObject('stageCurtains', 0.87, 0.87)
    updateHitbox('stageCurtains')

    close(true)
end