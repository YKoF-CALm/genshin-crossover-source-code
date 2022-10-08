function onCreate()
    makeLuaSprite('black', 'indie/sans/black', 0, 752)
    setObjectCamera('black', 'other')
    addLuaSprite('black', false)

    makeLuaSprite('black2', 'indie/sans/black', 0, -752)
    setObjectCamera('black2', 'other')
    addLuaSprite('black2', false)

    makeLuaSprite('blackout', 'indie/sans/black', -100, -100)
    scaleObject('blackout', 60, 60)
    addLuaSprite('blackout', true)
    setProperty('blackout.visible', false)

    setProperty('boyfriend.y', getProperty('boyfriend.y') - 5)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 100)
    setProperty('dad.x', getProperty('dad.x') - 100)
    cameraSetTarget('dad')

    setProperty('introSoundsSuffix', '-sans')
end

function onStepHit()
    if curStep == 766 then
        setProperty('blackout.visible', true)
        setProperty('bg.visible', false)
    end

    if curStep == 768 then
        setProperty('blackout.visible', false)
    end

    if curStep == 896 then
        doTweenY('blackdown', 'black', 600, 1.5, 'cubeInOut')
        doTweenY('black2down', 'black2', -600, 1.5, 'cubeInOut')
        for i=0,3 do
            noteTweenY('NoteMove'..i+1, i, _G['defaultOpponentStrumY'..i] + 110, 1.5, 'cubeInOut')
            noteTweenY('NoteMove'..i+5, i+4, _G['defaultPlayerStrumY'..i] + 110, 1.5, 'cubeInOut')
        end
    end

    if curStep == 1149 then
        doTweenY('blackdown', 'black', 752, 1.5, 'cubeInOut')
        doTweenY('black2down', 'black2', -752, 1.5, 'cubeInOut')
        for i=0,3 do
            noteTweenY('NoteMove'..i+1, i, _G['defaultOpponentStrumY'..i], 1.5, 'cubeInOut')
            noteTweenY('NoteMove'..i+5, i+4, _G['defaultPlayerStrumY'..i], 1.5, 'cubeInOut')
        end
    end

    if curStep == 1276 then
        setProperty('blackout.visible', true)
    end

    if curStep == 1277 then
        setProperty('bg.visible', true)
    end

    if curStep == 1278 then
        setProperty('blackout.visible', false)
    end

    if curStep == 1791 then
        doTweenAlpha('whiteout', 'bg3', 1, 1.5, 'cubeInOut')
        doTweenY('blackdown', 'black', 600, 1.5, 'cubeInOut')
        doTweenY('black2down', 'black2', -600, 1.5, 'cubeInOut')
        doTweenColor('dadblack', 'dad', '000000', 1.5, 'cubeInOut')
        doTweenColor('bfblack', 'boyfriend', '000000', 1.5, 'cubeInOut')
        for i=0,3 do
            noteTweenY('NoteMove'..i+1, i, _G['defaultOpponentStrumY'..i] + 110, 1.5, 'cubeInOut')
            noteTweenY('NoteMove'..i+5, i+4, _G['defaultPlayerStrumY'..i] + 110, 1.5, 'cubeInOut')
        end
    end

    if curStep == 2048 then
        setProperty('bg3.alpha', 0)
        setProperty('black.y', 752)
        setProperty('black2.y', -752)
        setProperty('boyfriend.color', getColorFromHex('0xFFFFFFFF'))
        setProperty('dad.color', getColorFromHex('0xFFFFFFFF'))
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0)
        end
    end
end

local xx = 420;
local yy = 400;
local xx2 = 820;
local yy2 = 400;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate(elapsed)
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end