function onCreate()
    precacheImage('secondicons/amber-normal')
    precacheImage('secondicons/amber-danger')
    precacheImage('secondicons/eula-normal')
    precacheImage('secondicons/eula-danger')
end

function onCreatePost()
    makeLuaSprite('eulaIcon', 'secondicons/eula-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('eulaIcon', 'hud')
    addLuaSprite('eulaIcon', true)
    setObjectOrder('eulaIcon', getObjectOrder('iconP1') + 1)
    setProperty('eulaIcon.flipX', true)
    setProperty('eulaIcon.visible', true)

    makeLuaSprite('eulaDangerIcon', 'secondicons/eula-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('eulaDangerIcon', 'hud')
    addLuaSprite('eulaDangerIcon', true)
    setObjectOrder('eulaDangerIcon', getObjectOrder('iconP1') + 1)
    setProperty('eulaDangerIcon.flipX', true)
    setProperty('eulaDangerIcon.visible', false)

    makeLuaSprite('amberIcon', 'secondicons/amber-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('amberIcon', 'hud')
    addLuaSprite('amberIcon', true)
    setObjectOrder('amberIcon', getObjectOrder('eulaIcon') + 1)
    setProperty('amberIcon.flipX', true)
    setProperty('amberIcon.visible', true)

    makeLuaSprite('amberDangerIcon', 'secondicons/amber-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('amberDangerIcon', 'hud')
    addLuaSprite('amberDangerIcon', true)
    setObjectOrder('amberDangerIcon', getObjectOrder('eulaDangerIcon') + 1)
    setProperty('amberDangerIcon.flipX', true)
    setProperty('amberDangerIcon.visible', false)
end

function onUpdate(elapsed)
    if curStep >= 912 then
        setProperty('iconP1.visible', false)
        if getProperty('health') <= 0.4 then
            setProperty('eulaIcon.visible', false)
            setProperty('eulaDangerIcon.visible', true)
            setProperty('amberIcon.visible', false)
            setProperty('amberDangerIcon.visible', true)
        else
            setProperty('eulaIcon.visible', true)
            setProperty('eulaDangerIcon.visible', false)
            setProperty('amberIcon.visible', true)
            setProperty('amberDangerIcon.visible', false)
        end
    else
        setProperty('iconP1.visible', true)
        setProperty('eulaIcon.visible', false)
        setProperty('amberIcon.visible', false)
        setProperty('eulaDangerIcon.visible', false)
        setProperty('amberDangerIcon.visible', false)
    end
end

function onUpdatePost(elapsed)
    setProperty('eulaIcon.x', getProperty('iconP1.x') + 25)
    setProperty('eulaIcon.angle', getProperty('iconP1.angle'))
    setProperty('eulaIcon.y', getProperty('iconP1.y') - 25)
    setProperty('eulaIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('eulaIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)

    setProperty('eulaDangerIcon.x', getProperty('iconP1.x') + 25)
    setProperty('eulaDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('eulaDangerIcon.y', getProperty('iconP1.y') - 25)
    setProperty('eulaDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('eulaDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)

    setProperty('amberIcon.x', getProperty('iconP1.x') - 25)
    setProperty('amberIcon.angle', getProperty('iconP1.angle'))
    setProperty('amberIcon.y', getProperty('iconP1.y') + 25)
    setProperty('amberIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('amberIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)

    setProperty('amberDangerIcon.x', getProperty('iconP1.x') - 25)
    setProperty('amberDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('amberDangerIcon.y', getProperty('iconP1.y') + 25)
    setProperty('amberDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('amberDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)
end