function onCreate()
    makeLuaSprite('stagedback', 'corruption/stagedback', -600, -200)
    addLuaSprite('stagedback', false)
    setScrollFactor('stagedback', 0.9, 0.9);

    makeLuaSprite('ladder', 'corruption/ladder', -600, -200)
    addLuaSprite('ladder', false)
    setScrollFactor('ladder', 0.9, 0.9);

    makeLuaSprite('stagedfront', 'corruption/stagedfront', -650, 600)
    addLuaSprite('stagedfront', false)
    scaleObject('stagedfront', 1.1, 1.1)
    updateHitbox('stagedfront')
    setScrollFactor('stagedfront', 0.9, 0.9);

    makeLuaSprite('stagedcurtains', 'corruption/stagedcurtains', -600, -400)
    addLuaSprite('stagedcurtains', true)
    setScrollFactor('stagedcurtains', 1.3, 1.3);
end