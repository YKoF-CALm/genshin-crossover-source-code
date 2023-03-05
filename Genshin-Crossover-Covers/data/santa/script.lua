local duet = false
local rr = 1.2

function onCreate()
    precacheImage('secondicons/ganyu-normal')
    precacheImage('secondicons/ganyu-danger')
    precacheImage('secondicons/xiao-normal')
    precacheImage('secondicons/xiao-danger')
    precacheImage('secondicons/hutao-normal')
    precacheImage('secondicons/hutao-danger')
    precacheImage('secondicons/xiangling-normal')
    precacheImage('secondicons/xiangling-danger')
    precacheImage('characters/Xiangling-Santa')

    makeAnimatedLuaSprite('xiangling','characters/Xiangling-Santa',140,250)
	addAnimationByPrefix('xiangling','idle','idle xian',24,false)
    addOffset('xiangling', 'idle', 0, 0)
	addAnimationByPrefix('xiangling','0','left xian',24,false)
    addOffset('xiangling', '0', 0, 0)
	addAnimationByPrefix('xiangling','1','down xian',24,false)
    addOffset('xiangling', '1', 0, 0)
	addAnimationByPrefix('xiangling','2','up xian',24,false)
    addOffset('xiangling', '2', 0, 0)
	addAnimationByPrefix('xiangling','3','right xian',24,false)
    addOffset('xiangling', '3', 0, 0)
	addAnimationByPrefix('xiangling','hey','hey xian',24,false)
    addOffset('xiangling', 'hey', 0, 0)
    addAnimationByPrefix('xiangling','laugh','up xian',24,false)
    addOffset('xiangling', 'laugh', 0, 0)
	addLuaSprite('xiangling',true)

    setProperty('dad.x', getProperty('dad.x') - 150)
    setProperty('dad.y', getProperty('dad.y') - 300)
    setProperty('gf.flipX', true)
    setProperty('gf.x', getProperty('gf.x') + 150)
    setProperty('gf.y', getProperty('gf.y') - 200)
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 440)
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 100)

    triggerEvent('Camera Follow Pos', 540, 320)
end

function onCreatePost()
    makeLuaSprite('xianglingIcon', 'secondicons/xiangling-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xianglingIcon', 'hud')
    addLuaSprite('xianglingIcon', true)
    setObjectOrder('xianglingIcon', getObjectOrder('iconP2') + 1)
    setProperty('xianglingIcon.flipX', false)
    setProperty('xianglingIcon.visible', true)

    makeLuaSprite('xianglingDangerIcon', 'secondicons/xiangling-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xianglingDangerIcon', 'hud')
    addLuaSprite('xianglingDangerIcon', true)
    setObjectOrder('xianglingDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('xianglingDangerIcon.flipX', false)
    setProperty('xianglingDangerIcon.visible', false)

    makeLuaSprite('hutaoIcon', 'secondicons/hutao-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('hutaoIcon', 'hud')
    addLuaSprite('hutaoIcon', true)
    setObjectOrder('hutaoIcon', getObjectOrder('xianglingIcon') - 1)
    setProperty('hutaoIcon.flipX', false)
    setProperty('hutaoIcon.visible', true)

    makeLuaSprite('hutaoDangerIcon', 'secondicons/hutao-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('hutaoDangerIcon', 'hud')
    addLuaSprite('hutaoDangerIcon', true)
    setObjectOrder('hutaoDangerIcon', getObjectOrder('xianglingDangerIcon') - 1)
    setProperty('hutaoDangerIcon.flipX', false)
    setProperty('hutaoDangerIcon.visible', false)

    makeLuaSprite('ganyuIcon', 'secondicons/ganyu-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('ganyuIcon', 'hud')
    addLuaSprite('ganyuIcon', true)
    setObjectOrder('ganyuIcon', getObjectOrder('iconP1') + 1)
    setProperty('ganyuIcon.flipX', true)
    setProperty('ganyuIcon.visible', true)

    makeLuaSprite('ganyuDangerIcon', 'secondicons/ganyu-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('ganyuDangerIcon', 'hud')
    addLuaSprite('ganyuDangerIcon', true)
    setObjectOrder('ganyuDangerIcon', getObjectOrder('iconP1') + 1)
    setProperty('ganyuDangerIcon.flipX', true)
    setProperty('ganyuDangerIcon.visible', false)

    makeLuaSprite('xiaoIcon', 'secondicons/xiao-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('xiaoIcon', 'hud')
    addLuaSprite('xiaoIcon', true)
    setObjectOrder('xiaoIcon', getObjectOrder('iconP1') + 1)
    setProperty('xiaoIcon.flipX', true)
    setProperty('xiaoIcon.visible', true)

    makeLuaSprite('xiaoDangerIcon', 'secondicons/xiao-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('xiaoDangerIcon', 'hud')
    addLuaSprite('xiaoDangerIcon', true)
    setObjectOrder('xiaoDangerIcon', getObjectOrder('iconP1') + 1)
    setProperty('xiaoDangerIcon.flipX', true)
    setProperty('xiaoDangerIcon.visible', false)
end

function onUpdate(elapsed)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    if getProperty('health') > 1.6 then
        setProperty('xianglingIcon.visible', false)
        setProperty('xianglingDangerIcon.visible', true)
        setProperty('hutaoIcon.visible', false)
        setProperty('hutaoDangerIcon.visible', true)
    else
        setProperty('xianglingIcon.visible', true)
        setProperty('xianglingDangerIcon.visible', false)
        setProperty('hutaoIcon.visible', true)
        setProperty('hutaoDangerIcon.visible', false)
    end

    if getProperty('health') < 0.4 then
        setProperty('ganyuIcon.visible', false)
        setProperty('ganyuDangerIcon.visible', true)
        setProperty('xiaoIcon.visible', false)
        setProperty('xiaoDangerIcon.visible', true)
    else
        setProperty('ganyuIcon.visible', true)
        setProperty('ganyuDangerIcon.visible', false)
        setProperty('xiaoIcon.visible', true)
        setProperty('xiaoDangerIcon.visible', false)
    end
end

function onUpdatePost(elapsed)
    setProperty('hutaoIcon.x', getProperty('iconP2.x') - 25)
    setProperty('hutaoIcon.angle', getProperty('iconP2.angle'))
    setProperty('hutaoIcon.y', getProperty('iconP2.y') - 25)
    setProperty('hutaoIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.1)
    setProperty('hutaoIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.1)

    setProperty('hutaoDangerIcon.x', getProperty('iconP2.x') - 25)
    setProperty('hutaoDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('hutaoDangerIcon.y', getProperty('iconP2.y') - 25)
    setProperty('hutaoDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.1)
    setProperty('hutaoDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.1)

    setProperty('xianglingIcon.x', getProperty('iconP2.x') + 18)
    setProperty('xianglingIcon.angle', getProperty('iconP2.angle'))
    setProperty('xianglingIcon.y', getProperty('iconP2.y') + 33)
    setProperty('xianglingIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('xianglingIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('xianglingDangerIcon.x', getProperty('iconP2.x') + 18)
    setProperty('xianglingDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('xianglingDangerIcon.y', getProperty('iconP2.y') + 33)
    setProperty('xianglingDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('xianglingDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('ganyuIcon.x', getProperty('iconP1.x') - 25)
    setProperty('ganyuIcon.angle', getProperty('iconP1.angle'))
    setProperty('ganyuIcon.y', getProperty('iconP1.y') + 25) 
    setProperty('ganyuIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('ganyuIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)

    setProperty('ganyuDangerIcon.x', getProperty('iconP1.x') - 25)
    setProperty('ganyuDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('ganyuDangerIcon.y', getProperty('iconP1.y') + 25)
    setProperty('ganyuDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('ganyuDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)

    setProperty('xiaoIcon.x', getProperty('iconP1.x') + 25)
    setProperty('xiaoIcon.angle', getProperty('iconP1.angle'))
    setProperty('xiaoIcon.y', getProperty('iconP1.y') - 25)
    setProperty('xiaoIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('xiaoIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)

    setProperty('xiaoDangerIcon.x', getProperty('iconP1.x') + 25)
    setProperty('xiaoDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('xiaoDangerIcon.y', getProperty('iconP1.y') - 25)
    setProperty('xiaoDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('xiaoDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)
end

local allowIdle = true

function onBeatHit()
	if curBeat % 2 == 0 then
        if allowIdle then
            playAnim('xiangling', 'idle', true)
        end
    end

    if curBeat == 4 then
        triggerEvent('Camera Follow Pos', 820.7, 320)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if not duet then
        if noteType == 'GF Sing' then
            triggerEvent('Camera Follow Pos', 950, 200)
        elseif noteType == 'Hey!' then
            triggerEvent('Add Camera Zoom', 0.04, 0)
        else
            triggerEvent('Camera Follow Pos', 820.7, 480)
        end
    else
        triggerEvent('Camera Follow Pos', 640, 320)
		setProperty('defaultCamZoom', 0.9)
	end

    if noteType == 'No Animation' and direction == 1 then
        playAnim('gf', 'singDOWN-alt', true)
    end
end


function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Special Sing' or noteType == 'Duet Note' then
        playAnim('xiangling', direction, true)
        allowIdle = false
        runTimer('resumeIdle', 0.5, 1)
    end

    if noteType == 'Hey!' then
        playAnim('xiangling', 'hey', true)
        allowIdle = false
        runTimer('resumeIdle', 0.5, 1)
    end

    if noteType == 'Alt Animation' then
        playAnim('xiangling', 'laugh', true)
        allowIdle = false
        runTimer('resumeIdle', 0.5, 1)
    end

    if noteType == 'No Animation' and direction == 1 then
        playAnim('gf', 'singDOWN-alt', true)
    end

    if duet == false then
		setProperty('defaultCamZoom', rr)
		if noteType == 'GF Sing' then
			triggerEvent('Camera Follow Pos', 950, 300)
        elseif noteType == 'Special Sing' then
            triggerEvent('Camera Follow Pos', 540, 480)
		else
			triggerEvent('Camera Follow Pos', 355, 212)
		end
	else
		triggerEvent('Camera Follow Pos', 640, 320)
		setProperty('defaultCamZoom', 0.9)
	end
end

function onEvent(name,value1,value2)
	if name == 'BG Freaks Expression' then
		doTweenAlpha('ee','eyes',2,1,'linear')
		doTweenAlpha('eEe','BG',0.5,1,'linear')
	end

	if name == 'YEA!' then
		triggerEvent('Add Camera Zoom',0.6,0.3)
	end

    if name == 'Kill Henchmen' then
		if duet == true then
			duet = false
		else
			duet = true
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeIdle' then
        allowIdle = true
    end
end