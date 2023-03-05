function onCreate()
    initLuaShader('greyscale')
    makeLuaSprite("shaderImage")
    makeGraphic("shaderImage", screenWidth, screenHeight)
    setSpriteShader("shaderImage", "greyscale")
    addHaxeLibrary("ShaderFilter", "openfl.filters")
    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
        game.camOther.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
    ]])

    setProperty('scoreTxt.visible', false);
	setProperty('healthBar.visible', false);
	setProperty('healthBarBG.visible', false);
	setProperty('iconP1.visible', false);
	setProperty('iconP2.visible', false);

    makeLuaSprite('ready', 'corruption/takeover/ready', screenWidth / 4 - 100, screenHeight / 4)
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'corruption/takeover/set', screenWidth / 4 - 70, screenHeight / 4)
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'corruption/takeover/go', screenWidth / 4 + 50, screenHeight / 4 - 20)
    setObjectCamera('go', 'other')

    setProperty('introSoundsSuffix', '-corrupt')
end

function onCountdownTick(counter)
	setProperty('countdownReady.visible', 0)
    setProperty('countdownSet.visible', 0)
    setProperty('countdownGo.visible', 0)
	if counter == 1 then
        addLuaSprite('ready', true)
        doTweenAlpha('Ready', 'ready', '0', crochet/1000, 'cubeInOut')
    end
    if counter == 2 then
        addLuaSprite('set', true)
        doTweenAlpha('Set', 'set', '0', crochet/1000, 'cubeInOut')
    end
    if counter == 3 then
        addLuaSprite('go', true)
        doTweenAlpha('Go', 'go', '0', crochet/1000, 'cubeInOut')
    end
end

function onBeatHit()
    if curBeat == 28 then
        removeSpriteShader('shaderImage')
        runHaxeCode([[
            game.camGame.setFilters();
            game.camHUD.setFilters();
            game.camOther.setFilters();
        ]])
	    setProperty('stageback2.visible', true);
        setProperty('stagefront2.visible',  true);
        setProperty('mics.visible', true);
	    setProperty('stagelight_left2.visible',  true);
	    setProperty('stagelight_right2.visible',  true);
	    setProperty('stagecurtains2.visible',  true);
	    setProperty('stageback.visible', false);
	    setProperty('stagefront.visible', false);
	    setProperty('stagelight_left.visible', false);
	    setProperty('stagelight_right.visible', false);
	    setProperty('stagecurtains.visible', false);
        setProperty('vignette.visible', false);
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 15)
        setProperty('boyfriend.x', getProperty('boyfriend.x') + 50)
        cameraSetTarget('boyfriend')
        setProperty('scoreTxt.visible', true);
		setProperty('healthBar.visible', true);
		setProperty('healthBarBG.visible', true);
		setProperty('iconP1.visible', true);
		setProperty('iconP2.visible', true);
        cameraFlash('game', 'FFFFFF', 0.8, false)
    end

    if curBeat == 64 then
        doTweenZoom('out', 'camGame', 0.5, 0.5, 'quartOut')
    end

    if curBeat == 128 then
        setProperty('eyes.visible', true);
        setProperty('TheWorld.visible', true);
        setProperty('frontpeople.visible',  true);
        setProperty('stagepeople.visible',  true);
        cameraFlash('game', 'FFFFFF', 0.8, false)
    end

    if curBeat == 192 then
        setProperty('boyfriend.x', getProperty('boyfriend.x') - 50)
        cameraSetTarget('boyfriend')
        cameraFlash('game', 'FFFFFF', 0.8, false)
    end

    if curBeat == 256 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 15)
        cameraSetTarget('boyfriend')
        cameraFlash('game', 'FFFFFF', 0.8, false)
    end

    if curBeat == 352 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
        setProperty('boyfriend.x', getProperty('boyfriend.x') - 50)
        cameraSetTarget('boyfriend')
        cameraFlash('game', 'FFFFFF', 0.8, false)
    end

    if curBeat == 384 then
        cameraFlash('game', 'FFFFFF', 0.8, false)
    end

    if curBeat == 416 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
        setProperty('boyfriend.x', getProperty('boyfriend.x') + 50)
        cameraSetTarget('boyfriend')
        cameraFlash('game', 'FFFFFF', 0.8, false)
    end

    if curBeat == 608 then
        cameraFlash('game', 'FFFFFF', 0.8, false)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.02 then
        setProperty('health', getProperty('health') - 0.02)
    end
end

function onTweenCompleted(tag)
    if tag == 'out' then
        setProperty('defaultCamZoom', 0.5)
    end
end