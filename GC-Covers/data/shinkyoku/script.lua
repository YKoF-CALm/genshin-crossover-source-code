local defx = {}
local defy = {}
local allowIdleBF = true
local allowIdleDad = true

function onCreate()
    addCharacterToList('amber', 'dad')
    addCharacterToList('sucrose', 'dad')
    addCharacterToList('barbara-player', 'boyfriend')
    addCharacterToList('klee-player', 'boyfriend')
    addCharacterToList('shenhe', 'dad')
    addCharacterToList('xiangling-player', 'boyfriend')
    addCharacterToList('yanfei', 'dad')
    addCharacterToList('ganyu-player', 'boyfriend')
    addCharacterToList('kokomi', 'dad')
    addCharacterToList('sayu-player', 'boyfriend')
    addCharacterToList('yoimiya', 'dad')
    addCharacterToList('sara-player','boyfriend')
    addCharacterToList('venti', 'dad')
    addCharacterToList('miko-player', 'boyfriend')
    precacheImage('characters/Eula')
    precacheImage('characters/jean')
    precacheImage('characters/albedo')
    precacheImage('characters/diona')
    precacheImage('characters/chongyun')
    precacheImage('characters/keqing')
    precacheImage('characters/xingqiu')
    precacheImage('characters/xiao')
    precacheImage('characters/gorou')
    precacheImage('characters/kazuha')
    precacheImage('characters/thoma')
    precacheImage('characters/itto')
    precacheImage('characters/zhongli')
    precacheImage('characters/ei')

    removeLuaSprite('bottomBoppers', false)

    makeAnimatedLuaSprite('ayato', 'characters/ayato', -500, -100)
    addAnimationByPrefix('ayato', 'idle', 'ayato idle', 24, false)
    addAnimationByPrefix('ayato', '0', 'ayato left', 24, false)
    addAnimationByPrefix('ayato', '1', 'ayato down', 24, false)
    addAnimationByPrefix('ayato', '2', 'ayato up', 24, false)
    addAnimationByPrefix('ayato', '3', 'ayato right', 24, false)

    makeAnimatedLuaSprite('aether', 'characters/aether', 1000, -80)
    addAnimationByPrefix('aether', 'idle', 'aether idle', 24, false)
    addAnimationByPrefix('aether', '0', 'aether right', 24, false)
    addAnimationByPrefix('aether', '1', 'aether down', 24, false)
    addAnimationByPrefix('aether', '2', 'aether up', 24, false)
    addAnimationByPrefix('aether', '3', 'aether left', 24, false)
    setProperty('aether.flipX', true)

    makeAnimatedLuaSprite('Eula', 'characters/Eula', -450, -50)
    addAnimationByPrefix('Eula', 'idle', 'Eula Idle', 24, false)
    addAnimationByPrefix('Eula', '0', 'Eula Left', 24, false)
    addAnimationByPrefix('Eula', '1', 'Eula Down', 24, false)
    addAnimationByPrefix('Eula', '2', 'Eula Up', 24, false)
    addAnimationByPrefix('Eula', '3', 'Eula Right', 24, false)
    setProperty('Eula.flipX', true)

    makeAnimatedLuaSprite('jean', 'characters/jean', 1000, -90)
    addAnimationByPrefix('jean', 'idle', 'jean idle', 24, false)
    addAnimationByPrefix('jean', '0', 'jean right', 24, false)
    addAnimationByPrefix('jean', '1', 'jean down', 24, false)
    addAnimationByPrefix('jean', '2', 'jean up', 24, false)
    addAnimationByPrefix('jean', '3', 'jean left', 24, false)
    setProperty('jean.flipX', true)

    makeAnimatedLuaSprite('albedo', 'characters/albedo', -500, -100)
    addAnimationByPrefix('albedo', 'idle', 'albedo idle', 24, false)
    addAnimationByPrefix('albedo', '0', 'albedo left', 24, false)
    addAnimationByPrefix('albedo', '1', 'albedo down', 24, false)
    addAnimationByPrefix('albedo', '2', 'albedo up', 24, false)
    addAnimationByPrefix('albedo', '3', 'albedo right', 24, false)
    
    makeAnimatedLuaSprite('diona', 'characters/diona', 850, -80)
    addAnimationByPrefix('diona', 'idle', 'diona idle', 24, false)
    addAnimationByPrefix('diona', '0', 'diona right', 24, false)
    addAnimationByPrefix('diona', '1', 'diona down', 24, false)
    addAnimationByPrefix('diona', '2', 'diona up', 24, false)
    addAnimationByPrefix('diona', '3', 'diona left', 24, false)
    setProperty('diona.flipX', true)

    makeAnimatedLuaSprite('chongyun', 'characters/chongyun', -500, -100)
    addAnimationByPrefix('chongyun', 'idle', 'chongyun idle', 24, false)
    addAnimationByPrefix('chongyun', '0', 'chongyun left', 24, false)
    addAnimationByPrefix('chongyun', '1', 'chongyun down', 24, false)
    addAnimationByPrefix('chongyun', '2', 'chongyun up', 24, false)
    addAnimationByPrefix('chongyun', '3', 'chongyun right', 24, false)

    makeAnimatedLuaSprite('keqing', 'characters/keqing', 1000, -80)
    addAnimationByPrefix('keqing', 'idle', 'keqing idle', 24, false)
    addAnimationByPrefix('keqing', '0', 'keqing right', 24, false)
    addAnimationByPrefix('keqing', '1', 'keqing down', 24, false)
    addAnimationByPrefix('keqing', '2', 'keqing up', 24, false)
    addAnimationByPrefix('keqing', '3', 'keqing left', 24, false)
    setProperty('keqing.flipX', true)

    makeAnimatedLuaSprite('xingqiu', 'characters/xingqiu', -500, -100)
    addAnimationByPrefix('xingqiu', 'idle', 'xingqiu idle', 24, false)
    addAnimationByPrefix('xingqiu', '0', 'xingqiu left', 24, false)
    addAnimationByPrefix('xingqiu', '1', 'xingqiu down', 24, false)
    addAnimationByPrefix('xingqiu', '2', 'xingqiu up', 24, false)
    addAnimationByPrefix('xingqiu', '3', 'xingqiu right', 24, false)

    makeAnimatedLuaSprite('xiao', 'characters/xiao', 1000, -80)
    addAnimationByPrefix('xiao', 'idle', 'xiao idle', 24, false)
    addAnimationByPrefix('xiao', '0', 'xiao right', 24, false)
    addAnimationByPrefix('xiao', '1', 'xiao down', 24, false)
    addAnimationByPrefix('xiao', '2', 'xiao up', 24, false)
    addAnimationByPrefix('xiao', '3', 'xiao left', 24, false)
    setProperty('xiao.flipX', true)

    makeAnimatedLuaSprite('gorou', 'characters/gorou', -500, -100)
    addAnimationByPrefix('gorou', 'idle', 'gorou idle0', 24, false)
    addAnimationByPrefix('gorou', '0', 'gorou left0', 24, false)
    addAnimationByPrefix('gorou', '1', 'gorou down0', 24, false)
    addAnimationByPrefix('gorou', '2', 'gorou up0', 24, false)
    addAnimationByPrefix('gorou', '3', 'gorou right0', 24, false)

    makeAnimatedLuaSprite('kazuha', 'characters/kazuha', 1000, -80)
    addAnimationByPrefix('kazuha', 'idle', 'kazuha idle', 24, false)
    addAnimationByPrefix('kazuha', '0', 'kazuha right', 24, false)
    addAnimationByPrefix('kazuha', '1', 'kazuha down', 24, false)
    addAnimationByPrefix('kazuha', '2', 'kazuha up', 24, false)
    addAnimationByPrefix('kazuha', '3', 'kazuha left', 24, false)
    setProperty('kazuha.flipX', true)

    makeAnimatedLuaSprite('thoma', 'characters/thoma', -500, -100)
    addAnimationByPrefix('thoma', 'idle', 'thoma idle', 24, false)
    addAnimationByPrefix('thoma', '0', 'thoma left', 24, false)
    addAnimationByPrefix('thoma', '1', 'thoma down', 24, false)
    addAnimationByPrefix('thoma', '2', 'thoma up', 24, false)
    addAnimationByPrefix('thoma', '3', 'thoma right', 24, false)

    makeAnimatedLuaSprite('itto', 'characters/itto', 1000, -80)
    addAnimationByPrefix('itto', 'idle', 'itto idle', 24, false)
    addAnimationByPrefix('itto', '0', 'itto right', 24, false)
    addAnimationByPrefix('itto', '1', 'itto down', 24, false)
    addAnimationByPrefix('itto', '2', 'itto up', 24, false)
    addAnimationByPrefix('itto', '3', 'itto left', 24, false)
    setProperty('itto.flipX', true)

    makeAnimatedLuaSprite('zhongli', 'characters/zhongli', -500, -100)
    addAnimationByPrefix('zhongli', 'idle', 'zhongli idle', 24, false)
    addAnimationByPrefix('zhongli', '0', 'zhongli left', 24, false)
    addAnimationByPrefix('zhongli', '1', 'zhongli down', 24, false)
    addAnimationByPrefix('zhongli', '2', 'zhongli up', 24, false)
    addAnimationByPrefix('zhongli', '3', 'zhongli right', 24, false)

    makeAnimatedLuaSprite('ei', 'characters/ei', 1000, -80)
    addAnimationByPrefix('ei', 'idle', 'ei idle', 24, false)
    addAnimationByPrefix('ei', '0', 'ei right', 24, false)
    addAnimationByPrefix('ei', '1', 'ei down', 24, false)
    addAnimationByPrefix('ei', '2', 'ei up', 24, false)
    addAnimationByPrefix('ei', '3', 'ei left', 24, false)
    setProperty('ei.flipX', true)

    addLuaSprite('ayato', true)
    addLuaSprite('aether', true)
end

function onCreatePost()
    for i = 0,7 do
		local xA = getPropertyFromGroup('strumLineNotes', i, 'x')
		local yB = getPropertyFromGroup('strumLineNotes', i, 'y')
		defx[i] = xA
		defy[i] = yB
	end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        if allowIdleBF then
            objectPlayAnimation('aether', 'idle', false)
            objectPlayAnimation('jean', 'idle', false)
            objectPlayAnimation('diona', 'idle', false)
            objectPlayAnimation('keqing', 'idle', false)
            objectPlayAnimation('xiao', 'idle', false)
            objectPlayAnimation('kazuha', 'idle', false)
            objectPlayAnimation('itto', 'idle', false)
            objectPlayAnimation('ei', 'idle', false)
        end
        if allowIdleDad then
            objectPlayAnimation('ayato', 'idle', false)
            objectPlayAnimation('Eula', 'idle', false)
            objectPlayAnimation('albedo', 'idle', false)
            objectPlayAnimation('chongyun', 'idle', false)
            objectPlayAnimation('xingqiu', 'idle', false)
            objectPlayAnimation('gorou', 'idle', false)
            objectPlayAnimation('thoma', 'idle', false)
            objectPlayAnimation('zhongli', 'idle', false)
        end
    end
end

lastNote = {0, ""}

function opponentNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "Special Sing" then -- Change "No Animation" to be your note type, usually you can just keep it as no anim assuming you arent using it elsewhere
	    objectPlayAnimation('ayato', lastNote[1], true)
        objectPlayAnimation('Eula', lastNote[1], true)
        objectPlayAnimation('albedo', lastNote[1], true)
        objectPlayAnimation('chongyun', lastNote[1], true)
        objectPlayAnimation('xingqiu', lastNote[1], true)
        objectPlayAnimation('gorou', lastNote[1], true)
        objectPlayAnimation('thoma', lastNote[1], true)
        objectPlayAnimation('zhongli', lastNote[1], true)
        allowIdleDad = false
        runTimer('resumeIdleDad', 0.5, 1)
    end
end

function goodNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "Special Sing" then -- Change "No Animation" to be your note type, usually you can just keep it as no anim assuming you arent using it elsewhere
	    objectPlayAnimation('aether', lastNote[1], true)
        objectPlayAnimation('jean', lastNote[1], true)
        objectPlayAnimation('diona', lastNote[1], true)
        objectPlayAnimation('keqing', lastNote[1], true)
        objectPlayAnimation('xiao', lastNote[1], true)
        objectPlayAnimation('kazuha', lastNote[1], true)
        objectPlayAnimation('itto', lastNote[1], true)
        objectPlayAnimation('ei', lastNote[1], true)
        allowIdleBF = false
        runTimer('resumeIdleBF', 0.5, 1)
    end
end

local l1 = false
local l2 = false
local l3 = false
local l4 = false
local l5 = false
local l6 = false
local l7 = false
local l8 = false
local circleArrows = false
local circleArrowsCrazy = false

function onStepHit()
    if curStep == 192 then
        removeLuaSprite('ayato', false)
        dadother = 'eula'
        addLuaSprite('Eula', true)
    end
    if curStep == 224 then
        removeLuaSprite('aether', false)
        bfother = 'jean'
        addLuaSprite('jean', true)
    end
    if curStep == 384 then
        removeLuaSprite('Eula', false)
        dadother = 'albedo'
        addLuaSprite('albedo', true)
    end
    if curStep == 400 then
        removeLuaSprite('jean', false)
        bfother = 'diona'
        addLuaSprite('diona', true)
    end
    if curStep == 448 then
        removeLuaSprite('albedo', false)
        dadother = 'chongyun'
        addLuaSprite('chongyun', true)
    end
    if curStep == 480 then
        removeLuaSprite('diona', false)
        bfother = 'keqing'
        addLuaSprite('keqing', true)
    end
    if curStep == 516 then
        removeLuaSprite('chongyun', false)
        dadother = 'xingqiu'
        addLuaSprite('xingqiu', true)
    end
    if curStep == 580 then
        removeLuaSprite('keqing', false)
        bfother = 'xiao'
        addLuaSprite('xiao', true)
    end
    if curStep == 736 then
        removeLuaSprite('xingqiu', false)
        dadother = 'gorou'
        addLuaSprite('gorou', true)
    end
    if curStep == 800 then
        removeLuaSprite('xiao', false)
        bfother = 'kazuha'
        addLuaSprite('kazuha', true)
    end
    if curStep == 832 then
        removeLuaSprite('gorou', false)
        dadother = 'thoma'
        addLuaSprite('thoma', true)
    end
    if curStep == 848 then
        removeLuaSprite('kazuha', false)
        bfother = 'itto'
        addLuaSprite('itto', true)
    end
    if curStep == 864 then
        removeLuaSprite('thoma', false)
        dadother = 'zhongli'
        addLuaSprite('zhongli', true)
    end
    if curStep == 880 then
        removeLuaSprite('itto', false)
        bfother = 'ei'
        addLuaSprite('ei', true)
    end

    if curStep == 128 then
        l2 = true
        l2 = false
        l3 = true
    end

    if curStep == 192 or curStep == 224 then
        l2 = false
        l3 = false
        l4 = true
    end

    if curStep == 205 or curStep == 237 then
        l4 = false
        l2 = true
    end

    if curStep == 208 or curStep == 240 then
        l2 = false
        for i=0,3 do
            setPropertyFromGroup('opponentStrums', i, 'y', defx[i] + 30)
            setPropertyFromGroup('opponentStrums', i, 'y', defy[i] - 50)
            setPropertyFromGroup('playerStrums', i, 'y', defx[i+4] + 30)
            setPropertyFromGroup('playerStrums', i, 'y', defy[i+4] - 50)
        end
    end

    if curStep == 210 or curStep == 242 then
        for i=0,3 do
            setPropertyFromGroup('opponentStrums', i, 'y', defy[i])
            setPropertyFromGroup('opponentStrums', i, 'x', defx[i] - 50)
            setPropertyFromGroup('playerStrums', i, 'y', defy[i+4])
            setPropertyFromGroup('playerStrums', i, 'x', defx[i+4] - 50)
        end
    end

    if curStep == 211 or curStep == 243 then
        for i=0,3 do
            setPropertyFromGroup('opponentStrums', i, 'x', defx[i] + 50)
            setPropertyFromGroup('playerStrums', i, 'x', defx[i+4] + 50)
        end
    end

    if curStep == 212 or curStep == 244 then
        for i=0,3 do
            setPropertyFromGroup('opponentStrums', i, 'y', defy[i] - 50)
            setPropertyFromGroup('opponentStrums', i, 'x', defx[i] + 10)
            setPropertyFromGroup('playerStrums', i, 'y', defy[i+4] - 50)
            setPropertyFromGroup('playerStrums', i, 'x', defx[i+4] + 10)
        end
    end

    if curStep == 214 or curStep == 246 then
        l2 = true
    end

    if curStep == 256 then
        l2 = false
        l1 = true
    end

    if curStep == 384 then
        l1 = false
        l5 = true
    end

    if curStep == 448 then
        l5 = false
        l6 = true
    end

    if curStep == 512 then
        l6 = false
        l2 = true
        l2 = false
        circleArrows = true 
    end

    if curStep == 640 then
        circleArrows = false
        l2 = true
        l2 = false
        l7 = true
    end

    if curStep == 768 then
        l7 = false
        l2 = true
        l2 = false
        l8 = true
    end

    if curStep == 832 then
        l8 = false
        l2 = true
        l2 = false
        circleArrowsCrazy = true
    end

    if curStep == 896 then
        circleArrowsCrazy = false
        l2 = true
    end

    if curStep == 120 or curStep == 248 or curStep == 375 or curStep == 632 or curStep == 696 or curStep == 824 or curStep == 952 or curStep == 1208 then
        for i=0,3 do
            noteTweenAngle(i..'n5oa', i, getPropertyFromGroup('opponentStrums', i, 'angle') + 360, 0.3, 'linear')
            noteTweenAngle(i..'n5pa', i+4, getPropertyFromGroup('playerStrums', i, 'angle') + 360, 0.3, 'linear')
        end
    end
end

function onUpdate(elapsed)
    if getProperty('ayato.animation.curAnim.name') == '0' then
        setProperty('ayato.x', -525)
        setProperty('ayato.y', -99)
    elseif getProperty('ayato.animation.curAnim.name') == '1' then
        setProperty('ayato.x', -440)
        setProperty('ayato.y', -92)
    elseif getProperty('ayato.animation.curAnim.name') == '2' then
        setProperty('ayato.x', -535)
        setProperty('ayato.y', -100)
    elseif getProperty('ayato.animation.curAnim.name') == '3' then
        setProperty('ayato.x', -462)
        setProperty('ayato.y', -101)
    else
        setProperty('ayato.x', -500)
        setProperty('ayato.y', -100)
    end
    if getProperty('Eula.animation.curAnim.name') == '0' then
        setProperty('Eula.x', -515)
    else
        setProperty('Eula.x', -450)
        setProperty('Eula.y', -50)
    end
    if getProperty('albedo.animation.curAnim.name') == '0' then
        setProperty('albedo.x', -501)
    elseif getProperty('albedo.animation.curAnim.name') == '1' then
        setProperty('albedo.x', -537)
    else
        setProperty('albedo.x', -500)
        setProperty('albedo.y', -100)
    end
    if getProperty('chongyun.animation.curAnim.name') == '0' then
        setProperty('chongyun.x', -523)
        setProperty('chongyun.y', -98)
    elseif getProperty('chongyun.animation.curAnim.name') == '1' or getProperty('chongyun.animation.curAnim.name') == '2' then
        setProperty('chongyun.x', -497)
        setProperty('chongyun.y', -100)
    else
        setProperty('chongyun.x', -500)
        setProperty('chongyun.y', -100)
    end
    if getProperty('xingqiu.animation.curAnim.name') == '0' then
        setProperty('xingqiu.x', -447)
        setProperty('xingqiu.y', -103)
    elseif getProperty('xingqiu.animation.curAnim.name') == '1' then
        setProperty('xingqiu.x', -512)
        setProperty('xingqiu.y', -101)
    elseif getProperty('xingqiu.animation.curAnim.name') == '2' then
        setProperty('xingqiu.x', -475)
        setProperty('xingqiu.y', -102)
    elseif getProperty('xingqiu.animation.curAnim.name') == '3' then
        setProperty('xingqiu.x', -439)
        setProperty('xingqiu.y', -102)
    else
        setProperty('xingqiu.x', -500)
        setProperty('xingqiu.y', -100)
    end
    if getProperty('gorou.animation.curAnim.name') == '0' then
        setProperty('gorou.x', -496)
        setProperty('gorou.y', -103)
    elseif getProperty('gorou.animation.curAnim.name') == '1' then
        setProperty('gorou.x', -479)
        setProperty('gorou.y', -102)
    elseif getProperty('gorou.animation.curAnim.name') == '2' then
        setProperty('gorou.x', -495)
        setProperty('gorou.y', -103)
    elseif getProperty('gorou.animation.curAnim.name') == '3' then
        setProperty('gorou.x', -503)
        setProperty('gorou.y', -103)
    else
        setProperty('gorou.x', -500)
        setProperty('gorou.y', -100)
    end
    if getProperty('thoma.animation.curAnim.name') == '1' then
        setProperty('thoma.x', -458)
        setProperty('thoma.y', -97)
    elseif getProperty('thoma.animation.curAnim.name') == '3' then
        setProperty('thoma.x', -484)
        setProperty('thoma.y', -98)
    else
        setProperty('thoma.x', -500)
        setProperty('thoma.y', -100)
    end
    if getProperty('zhongli.animation.curAnim.name') == '1' then
        setProperty('zhongli.x', -472)
        setProperty('zhongli.y', -95)
    elseif getProperty('zhongli.animation.curAnim.name') == '2' then
        setProperty('zhongli.x', -537)
        setProperty('zhongli.y', -100)
    elseif getProperty('zhongli.animation.curAnim.name') == '3' then
        setProperty('zhongli.x', -416)
        setProperty('zhongli.y', -92)
    else
        setProperty('zhongli.x', -500)
        setProperty('zhongli.y', -100)
    end
    if getProperty('aether.animation.curAnim.name') == '1' then
        setProperty('aether.x', 1034)
        setProperty('aether.y', -80)
    elseif getProperty('aether.animation.curAnim.name') == '2' then
        setProperty('aether.x', 980)
        setProperty('aether.y', -81)
    elseif getProperty('aether.animation.curAnim.name') == '3' then
        setProperty('aether.x', 984)
        setProperty('aether.y', -80)
    else
        setProperty('aether.x', 1000)
        setProperty('aether.y', -80)
    end
    if getProperty('jean.animation.curAnim.name') == '0' then
        setProperty('jean.x', 960)
        setProperty('jean.y', -89)
    elseif getProperty('jean.animation.curAnim.name') == '1' then
        setProperty('jean.x', 995)
        setProperty('jean.y', -87)
    elseif getProperty('jean.animation.curAnim.name') == '2' then
        setProperty('jean.x', 959)
        setProperty('jean.y', -86)
    elseif getProperty('jean.animation.curAnim.name') == '3' then
        setProperty('jean.x', 1023)
        setProperty('jean.y', -88)
    else
        setProperty('jean.x', 1000)
        setProperty('jean.y', -90)
    end
    if getProperty('diona.animation.curAnim.name') == '0' then
        setProperty('diona.x', 832)
        setProperty('diona.y', -80)
    elseif getProperty('diona.animation.curAnim.name') == '1' then
        setProperty('diona.x', 852)
        setProperty('diona.y', -85)
    elseif getProperty('diona.animation.curAnim.name') == '2' then
        setProperty('diona.x', 836)
        setProperty('diona.y', -78)
    elseif getProperty('diona.animation.curAnim.name') == '3' then
        setProperty('diona.x', 893)
        setProperty('diona.y', -83)
    else
        setProperty('diona.x', 850)
        setProperty('diona.y', -80)
    end
    if getProperty('keqing.animation.curAnim.name') == '0' then
        setProperty('keqing.x', 918)
        setProperty('keqing.y', -73)
    elseif getProperty('keqing.animation.curAnim.name') == '1' then
        setProperty('keqing.x', 967)
        setProperty('keqing.y', -80)
    elseif getProperty('keqing.animation.curAnim.name') == '2' then
        setProperty('keqing.x', 959)
        setProperty('keqing.y', -77)
    elseif getProperty('keqing.animation.curAnim.name') == '3' then
        setProperty('keqing.x', 966)
        setProperty('keqing.y', -74)
    else
        setProperty('keqing.x', 1000)
        setProperty('keqing.y', -80)
    end
    if getProperty('xiao.animation.curAnim.name') == '0' then
        setProperty('xiao.x', 1007)
        setProperty('xiao.y', -77)
    elseif getProperty('xiao.animation.curAnim.name') == '1' then
        setProperty('xiao.x', 950)
        setProperty('xiao.y', -80)
    elseif getProperty('xiao.animation.curAnim.name') == '2' then
        setProperty('xiao.x', 1048)
        setProperty('xiao.y', -81)
    elseif getProperty('xiao.animation.curAnim.name') == '3' then
        setProperty('xiao.x', 998)
        setProperty('xiao.y', -80)
    else
        setProperty('xiao.x', 1000)
        setProperty('xiao.y', -80)
    end
    if getProperty('kazuha.animation.curAnim.name') == '0' then
        setProperty('kazuha.x', 1000)
        setProperty('kazuha.y', -83)
    elseif getProperty('kazuha.animation.curAnim.name') == '1' then
        setProperty('kazuha.x', 1003)
        setProperty('kazuha.y', -84)
    elseif getProperty('kazuha.animation.curAnim.name') == '2' then
        setProperty('kazuha.x', 1080)
        setProperty('kazuha.y', -85)
    elseif getProperty('kazuha.animation.curAnim.name') == '3' then
        setProperty('kazuha.x', 1079)
        setProperty('kazuha.y', -84)
    else
        setProperty('kazuha.x', 1000)
        setProperty('kazuha.y', -80)
    end
    if getProperty('itto.animation.curAnim.name') == '0' then
        setProperty('itto.x', 960)
        setProperty('itto.y', -78)
    elseif getProperty('itto.animation.curAnim.name') == '1' then
        setProperty('itto.x', 972)
        setProperty('itto.y', -81)
    elseif getProperty('itto.animation.curAnim.name') == '2' then
        setProperty('itto.x', 1037)
        setProperty('itto.y', -84)
    elseif getProperty('itto.animation.curAnim.name') == '3' then
        setProperty('itto.x', 1027)
        setProperty('itto.y', -77)
    else
        setProperty('itto.x', 1000)
        setProperty('itto.y', -80)
    end
    if getProperty('ei.animation.curAnim.name') == '0' then
        setProperty('ei.x', 957)
        setProperty('ei.y', -78)
    elseif getProperty('ei.animation.curAnim.name') == '1' then
        setProperty('ei.x', 998)
        setProperty('ei.y', -80)
    elseif getProperty('ei.animation.curAnim.name') == '3' then
        setProperty('ei.x', 1023)
        setProperty('ei.y', -80)
    else
        setProperty('ei.x', 1000)
        setProperty('ei.y', -80)
    end

    songPos = getSongPosition()
    local currentBeat = (songPos / 1000)*(bpm/60)

    if l1 then
        for i=0,3 do
            noteTweenX(i..'l1ox', i, defx[i] + 50 * math.sin((currentBeat + i*0.32)), 0.1, 'linear')
            noteTweenY(i..'lioy', i, defy[i] + 10 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenX(i..'l1px', i+4, defx[i+4] + 50 * math.sin((currentBeat + (i+4)*0.32)), 0.1, 'linear')
            noteTweenY(i..'lipy', i+4, defy[i+4] + 10 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    if l2 then
        for i=0,3 do
            setPropertyFromGroup('opponentStrums', i, 'y', defy[i])
            setPropertyFromGroup('opponentStrums', i, 'x', defx[i])
            setPropertyFromGroup('playerStrums', i, 'y', defy[i+4])
            setPropertyFromGroup('playerStrums', i, 'x', defx[i+4])
        end
    end
    if l3 then
        for i=0,3 do
            noteTweenX(i..'l3ox', i, defx[i] + 30 * math.sin((currentBeat + i*0.32)), 0.1, 'linear')
            noteTweenX(i..'l3px', i+4, defx[i+4] + 30 * math.sin((currentBeat + (i+4)*0.32)), 0.1, 'linear')
        end
    end
    if l4 then
        for i=0,3 do
            noteTweenY(i..'l4oy', i, defy[i] + 30 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'l4py', i+4, defy[i+4] + 30 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    if l5 then
        for i=0,3 do
            noteTweenX(i..'l5ox', i, defx[i] + 50 * math.sin((currentBeat + i*0.32)), 0.1, 'linear')
            noteTweenY(i..'l5oy', i, defy[i] + 20 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenX(i..'l5px', i+4, defx[i+4] + 50 * math.sin((currentBeat + (i+4)*0.32)), 0.1, 'linear')
            noteTweenY(i..'l5py', i+4, defy[i+4] + 20 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    if l6 then
        for i=0,3 do
            noteTweenX(i..'l6ox', i, defx[i] + 50 * math.sin((currentBeat + i*0.32)), 0.1, 'linear')
            noteTweenY(i..'l6oy', i, defy[i] + 30 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenX(i..'l6px', i+4, defx[i+4] + 50 * math.sin((currentBeat + (i+4)*0.32)), 0.1, 'linear')
            noteTweenY(i..'l6py', i+4, defy[i+4] + 30 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    if l7 then
        for i=0,3 do
            noteTweenX(i..'l7ox', i, defx[i] + 150 * math.sin((currentBeat + i*0.32)), 0.1, 'linear')
            setPropertyFromGroup('opponentStrums', i, 'y', defy[i])
            noteTweenX(i..'l7px', i+4, defx[i+4] + 150 * math.sin((currentBeat + (i+4)*0.32)), 0.1, 'linear')
            setPropertyFromGroup('playerStrums', i, 'y', defy[i+4])
        end
    end
    if l8 then
        for i=0,3 do
            setPropertyFromGroup('opponentStrums', i, 'x', defx[i])
            noteTweenY(i..'l8oy', i, defy[i] + 150 * math.cos((currentBeat * 0.25) * math.pi), 0.1, 'linear')
            setPropertyFromGroup('playerStrums', i, 'x', defx[i+4])
            noteTweenY(i..'l8py', i+4, defy[i+4] + 150 * math.cos((currentBeat * 0.25) * math.pi), 0.1, 'linear')
        end
    end
    if circleArrows then
        for i=0,3 do
            noteTweenX(i..'l9ox', i, defx[i] + 64 * math.sin((currentBeat * 0.35) * math.pi), 0.1, 'linear')
            noteTweenY(i..'l9oy', i, defy[i] + 64 * math.cos((currentBeat * 0.35) * math.pi), 0.1, 'linear')
            noteTweenX(i..'l9px', i+4, defx[i+4] + 64 * math.sin((currentBeat * 0.35) * math.pi), 0.1, 'linear')
            noteTweenY(i..'l9py', i+4, defy[i+4] + 64 * math.cos((currentBeat * 0.35) * math.pi), 0.1, 'linear')
        end
    end
    if circleArrowsCrazy then
        for i=0,3 do
            noteTweenX(i..'l0ox', i, defx[i] + 40 * math.sin((currentBeat + i*0.35) * math.pi), 0.1, 'linear')
            noteTweenY(i..'l0oy', i, defy[i] + 40 * math.cos((currentBeat + i*0.35) * math.pi), 0.1, 'linear')
            noteTweenX(i..'l0px', i+4, defx[i+4] + 40 * math.sin((currentBeat + (i+4)*0.35) * math.pi), 0.1, 'linear')
            noteTweenY(i..'l0py', i+4, defy[i+4] + 40 * math.cos((currentBeat + (i+4)*0.35) * math.pi), 0.1, 'linear')
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeIdleDad' then
        allowIdleDad = true
    end

    if tag == 'resumeIdleBF' then
        allowIdleBF = true
    end
end

