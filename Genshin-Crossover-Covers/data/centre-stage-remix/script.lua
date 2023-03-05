--[[
function onBeatHit()
    if curBeat == 464 then
        setProperty('tc_plant_pot.alpha', 0)
    end

    if curBeat == 585 then
        doTweenAlpha('hi', 'tc_plant_pot', 1, 1, 'linear')
    end
end
]]

function onCreate()
    makeLuaSprite('blackScreen', '', -500, -500)
    makeGraphic('blackScreen', 2500, 2500, '000000')
    setScrollFactor('blackScreen', 0.1, 0.1)
    setProperty('blackScreen.alpha', 0)
    addLuaSprite('blackScreen', true)

    setProperty('boyfriend.y', getProperty('boyfriend.y') + 5)

    --setPlaybackRate(1.2)

    --if getPropertyFromClass('flixel.FlxG', 'save.data.psychUI') == false then -- kade ui
		--hudStuff = {'healthBarBG', 'healthBar', 'iconP1', 'iconP2', 'scoreTxt'}
	--end

    --removeShit('sound', 'mods/BETADCIU/songs/centre-stage-remix/Inst.ogg')
    --removeShit('sound', 'mods/BETADCIU/songs/centre-stage-remix/Voices.ogg')
end

ogStrumXPos = {}
ogStrumYPos = {}

function onCreatePost()
    for i = 0,7 do
        table.insert(ogStrumXPos, getPropertyFromGroup('strumLineNotes', i, 'x'))
		table.insert(ogStrumYPos, getPropertyFromGroup('strumLineNotes', i, 'y'))
	end
end

hudStuff = {'healthBarBG', 'healthBar', 'iconP1', 'iconP2', 'scoreTxt', 'timeBar',  'timeBarBG', 'timeTxt'}
chars = {'dad', 'boyfriend'}
healthSet = false

function onEvent(n, v1, v2)
    if n == 'Silhouette' then
        if v1 == 'b' then
            doTweenAlpha('plantpot', 'tc_plant_pot', 1, v2, 'linear')
            for i = 5,#hudStuff do
                setProperty(hudStuff[i]..'.visible', true)
                setProperty(hudStuff[i]..'.alpha', 0)
                doTweenAlpha(hudStuff[i], hudStuff[i], 1, v2, 'linear')
            end

            for i = 0,7 do
                noteTweenAlpha(i, i, 1, v2, 'cubeInOut')
                setPropertyFromGroup('strumLineNotes', i, 'x', ogStrumXPos[i+1])
            end

            setProperty("Stage.pixelShitPart1", '')
        end

        if v1 == 'c' then
            local daStuff = {'boyfriend', 'gf', 'tc_plant_pot', 'blackScreen'}

            for i = 1,#daStuff do
                setProperty(daStuff[i]..'.alpha', 0)
            end

            setProperty('blackScreen.alpha', 0)
    
            for i = 0,3 do
                noteTweenAlpha(i, i, 0.7, 1, 'linear')
                setPropertyFromGroup('strumLineNotes', i, 'x', ogStrumXPos[i+1] + 320)
    
                noteTweenAlpha(i+4, i+4, 0.7, 1, 'linear')
                setPropertyFromGroup('strumLineNotes', i+4, 'x', ogStrumXPos[i+5] + 640)
            end

            setProperty("Stage.pixelShitPart1", 'ui/bw/flipped/')
        end
    end

    if n == 'Play Animation' then
        if v1 == 'hey' then
            setProperty('dad.stopIdle', false)
            setProperty('boyfriend.stopIdle', false)
        end
    end
end

function onStepHit()
    if curStep == 279 or curStep == 286 or curStep == 1856 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 5)
    end

    if curStep == 1056 then
        triggerEvent("Add Camera Zoom", '0', '0.05')
    end

    if curStep >= 1072 and curStep < 1184 then
        if curStep % 16 == 0 then
            if getProperty('defaultCamZoom') >= 1.15 then
                setProperty('defaultCamZoom', 0.85)
            else
                setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.2)
                setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
            end

            triggerEvent("Add Camera Zoom", '0', '0.05')
            
            for i = 1,#chars do
                if checkIdle(chars[i]) == true then
                    playAnim(chars[i], 'idle', true)
                end
            end
        end
    end

    if curStep == 1840 then
        for i = 1, #hudStuff do
            doTweenAlpha(hudStuff[i], hudStuff[i], 0, 1, 'linear')
        end

        for i = 0,7 do
            noteTweenAlpha(i, i, 0, 1, 'linear')
        end

        doTweenAlpha('blackScreen', 'blackScreen', 1, 1, 'linear')
    end

    if curStep == 1856 then
        triggerEvent('Change Moving Camera Pos', '-50 221', '') 
        instantSnapCam(-50, 221)
    end

    if curStep == 1952 then
        for i = 1, #hudStuff do
            setProperty(hudStuff[i]..'.visible', false)
        end

        for i = 0,3 do
            noteTweenX(i, i, ogStrumXPos[i+1], (stepCrochet*32)/1000, 'cubeInOut')
            noteTweenX(i+4, i+4, ogStrumXPos[i+5], (stepCrochet*32)/1000, 'cubeInOut')
        end
    end

    if curStep >= 2016 and curStep < 2303 and getPropertyFromGroup('strumLineNotes', 0, 'x') ~= ogStrumXPos[1] then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.7)
            setPropertyFromGroup('strumLineNotes', i, 'x', ogStrumXPos[i+1])
        end
    end

    if curStep == 1984 then
        doTweenAlpha('boyfriend', 'boyfriend', 1, 1, 'sineInOut')
        healthSet = true
    end

    if curStep == 2096 then
        doTweenAlpha('gf', 'gf', 1, 1, 'sineInOut')

        for i = 1,4 do
            setProperty(hudStuff[i]..'.visible', true)
            doTweenAlpha(hudStuff[i], hudStuff[i], 1, 0.5, 'linear')
        end
    end

    if curStep == 2304 then
        doTweenZoom('camGame', 'camGame', 0.7, (stepCrochet*64)/1000, 'cubeInOut')
        setProperty('defaultCamZoom', 0.7)
    end

    if curStep == 2352 then
        cancelTween('camGame')
        setProperty('defaultCamZoom', 0.85)
    end

    if curStep == 2368 then
        triggerEvent('Change Moving Camera Pos', '185 221', '520 221') 
    end
end

function instantSnapCam(x, y)
	snapCam(x, y)
	setCamFollow(x, y)
end

function removeShit(tag, key)
	if tag == 'sound' then
		removeCurrentTrackedSound(key)
		doFunction('uncacheSound', key)
	else
		removeCurrentTrackedAsset(key)
		doFunction('uncacheImage', key)
	end
end

function onUpdate(elapsed)
    for i = 1,#chars do 
        if checkIdle(chars[i]) == true then
            setProperty(chars[i]..'.stopIdle', true)
        end
    end
end

function checkIdle(char)
	if getProperty(char..'.animation.curAnim.name') == 'idle' or getProperty(char..'.animation.curAnim.name') == 'danceRight' then
		return true
    else
        return false
	end
end

function onBeatHit()
    for i = 1,#chars do
        if checkIdle(chars[i]) == true then
            if curBeat % (getProperty('gfSpeed')* 2) == 0 then
                playAnim(chars[i], 'idle', true)
            end
        end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if healthSet then
        if getProperty('health') > 1 then
            setProperty('health', 1)
        end
    end

    setProperty('boyfriend.stopIdle', false)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote and not healthSet then
        health = getProperty('health')
        if getProperty('health') > 0.05 then
            setProperty('health', health - 0.025);
        end
    end

    setProperty('dad.stopIdle', false)
end