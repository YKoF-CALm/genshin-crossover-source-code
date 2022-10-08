local defx = {}
local defy = {}
local allowIdleBF = true
local allowIdleDad = true

function onCreate()
    removeLuaSprite('bottomBoppers', true)

    addLuaSprite('ayato', true)
    addLuaSprite('aether', true)
    addLuaSprite('Eula', true)
    setProperty('Eula.visible', false)
    addLuaSprite('jean', true)
    setProperty('jean.visible', false)
    addLuaSprite('albedo', true)
    setProperty('albedo.visible', false)
    addLuaSprite('diona', true)
    setProperty('diona.visible', false)
    addLuaSprite('chongyun', true)
    setProperty('chongyun.visible', false)
    addLuaSprite('keqing', true)
    setProperty('keqing.visible', false)
    addLuaSprite('xingqiu', true)
    setProperty('xingqiu.visible', false)
    addLuaSprite('xiao', true)
    setProperty('xiao.visible', false)
    addLuaSprite('gorou', true)
    setProperty('gorou.visible', false)
    addLuaSprite('kazuha', true)
    setProperty('kazuha.visible', false)
    addLuaSprite('thoma', true)
    setProperty('thoma.visible', false)
    addLuaSprite('itto', true)
    setProperty('itto.visible', false)
    addLuaSprite('zhongli', true)
    setProperty('zhongli.visible', false)
    addLuaSprite('ei', true)
    setProperty('ei.visible', false)
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
            playAnim('aether', 'idle', true)
            playAnim('jean', 'idle', true)
            playAnim('diona', 'idle', true)
            playAnim('keqing', 'idle', true)
            playAnim('xiao', 'idle', true)
            playAnim('kazuha', 'idle', true)
            playAnim('itto', 'idle', true)
            playAnim('ei', 'idle', true)
        end
        if allowIdleDad then
            playAnim('ayato', 'idle', true)
            playAnim('Eula', 'idle', true)
            playAnim('albedo', 'idle', true)
            playAnim('chongyun', 'idle', true)
            playAnim('xingqiu', 'idle', true)
            playAnim('gorou', 'idle', true)
            playAnim('thoma', 'idle', true)
            playAnim('zhongli', 'idle', true)
        end
    end
end

lastNote = {0, ""}

function opponentNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "Special Sing" then
	    playAnim('ayato', lastNote[1], true)
        playAnim('Eula', lastNote[1], true)
        playAnim('albedo', lastNote[1], true)
        playAnim('chongyun', lastNote[1], true)
        playAnim('xingqiu', lastNote[1], true)
        playAnim('gorou', lastNote[1], true)
        playAnim('thoma', lastNote[1], true)
        playAnim('zhongli', lastNote[1], true)
        allowIdleDad = false
        runTimer('resumeIdleDad', 0.5, 1)
    end
end

function goodNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "Special Sing" then
	    playAnim('aether', lastNote[1], true)
        playAnim('jean', lastNote[1], true)
        playAnim('diona', lastNote[1], true)
        playAnim('keqing', lastNote[1], true)
        playAnim('xiao', lastNote[1], true)
        playAnim('kazuha', lastNote[1], true)
        playAnim('itto', lastNote[1], true)
        playAnim('ei', lastNote[1], true)
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
        removeLuaSprite('ayato', true)
        setProperty('Eula.visible', true)
    end
    if curStep == 224 then
        removeLuaSprite('aether', true)
        setProperty('jean.visible', true)
    end
    if curStep == 384 then
        removeLuaSprite('Eula', true)
        setProperty('albedo.visible', true)
    end
    if curStep == 400 then
        removeLuaSprite('jean', true)
        setProperty('diona.visible', true)
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 40)
        setProperty('boyfriend.x', getProperty('boyfriend.x') + 50)
    end
    if curStep == 448 then
        removeLuaSprite('albedo', true)
        setProperty('chongyun.visible', true)
    end
    if curStep == 480 then
        removeLuaSprite('diona', true)
        setProperty('keqing.visible', true)
    end
    if curStep == 516 then
        removeLuaSprite('chongyun', true)
        setProperty('xingqiu.visible', true)
    end
    if curStep == 580 then
        removeLuaSprite('keqing', true)
        setProperty('xiao.visible', true)
    end
    if curStep == 736 then
        removeLuaSprite('xingqiu', true)
        setProperty('gorou.visible', true)
    end
    if curStep == 800 then
        removeLuaSprite('xiao', true)
        setProperty('kazuha.visible', true)
    end
    if curStep == 832 then
        removeLuaSprite('gorou', true)
        setProperty('thoma.visible', true)
    end
    if curStep == 848 then
        removeLuaSprite('kazuha', true)
        setProperty('itto.visible', true)
    end
    if curStep == 864 then
        removeLuaSprite('thoma', true)
        setProperty('zhongli.visible', true)
    end
    if curStep == 880 then
        removeLuaSprite('itto', true)
        setProperty('ei.visible', true)
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