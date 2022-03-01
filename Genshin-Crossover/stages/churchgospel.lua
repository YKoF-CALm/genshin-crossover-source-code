function onCreate()
    
    makeLuaSprite('blackbg', 'churchgospel/blackbg', -500, -850)
    addLuaSprite('blackbg', false)
    setLuaSpriteScrollFactor('blackbg', 0.9, 0.9)
    scaleLuaSprite('blackbg', 1.2, 1.2)
    updateHitbox('blackbg')

    makeLuaSprite('circ0', 'churchgospel/circ0', -500, -850)
    addLuaSprite('circ0', false)
    setLuaSpriteScrollFactor('circ0', 0.9, 0.9)
    scaleLuaSprite('circ0', 1.2, 1.2)
    updateHitbox('circ0')

    makeLuaSprite('circ1new', 'churchgospel/circ1new', 288, -459)
    addLuaSprite('circ1new', false)
    setLuaSpriteScrollFactor('circ1new', 0.9, 0.9)
    scaleLuaSprite('circ1new', 1.2, 1.2)
    updateHitbox('circ1new')

    makeLuaSprite('circ2', 'churchgospel/circ2', -500, -850)
    addLuaSprite('circ2', false)
    setLuaSpriteScrollFactor('circ2', 0.9, 0.9)
    scaleLuaSprite('circ2', 1.2, 1.2)
    updateHitbox('circ2')

    makeLuaSprite('bg', 'churchgospel/bg', -500, -850)
    addLuaSprite('bg', false)
    setLuaSpriteScrollFactor('bg', 0.9, 0.9)
    scaleLuaSprite('bg', 1.2, 1.2)
    updateHitbox('bg')

    makeLuaSprite('floor', 'churchgospel/floor', -500, -850)
    addLuaSprite('floor', false)
    setLuaSpriteScrollFactor('floor', 0.9, 0.9)
    scaleLuaSprite('floor', 1.2, 1.2)
    updateHitbox('floor')

    makeLuaSprite('pillars', 'churchgospel/pillars', -500, -850)
    addLuaSprite('pillars', false)
    setLuaSpriteScrollFactor('pillars', 0.9, 0.9)
    scaleLuaSprite('pillars', 1.2, 1.2)
    updateHitbox('pillars')
    
    --[[
    makeLuaSprite('base', 'churchgospel/base', -500, -850)
    addLuaSprite('base', false)
    setLuaSpriteScrollFactor('base', 0.9, 0.9)
    ]]

    close(true)
end