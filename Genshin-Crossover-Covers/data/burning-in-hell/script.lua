local gfx = 0
local dadx = 0

function onCreate()
    addCharacterToList('venti', 'dad')
    addCharacterToList('miko', 'gf')
    addCharacterToList('yoimiya', 'dad')
    addCharacterToList('itto', 'gf')
    addCharacterToList('eula', 'dad')
    addCharacterToList('emptygf', 'gf')
    addCharacterToList('jean', 'dad')
    addCharacterToList('albedo', 'dad')
    addCharacterToList('mona', 'dad')
    addCharacterToList('xiao', 'dad')
    addCharacterToList('ganyu-mad', 'dad')
    addCharacterToList('hutao', 'dad')
    addCharacterToList('shenhe', 'dad')
    addCharacterToList('kazuha', 'dad')
    addCharacterToList('ayaka', 'dad')
    addCharacterToList('ayato', 'dad')
    addCharacterToList('keqing', 'dad')
    addCharacterToList('kokomi', 'dad')
    addCharacterToList('aether-duality', 'dad')

    setProperty('introSoundsSuffix', '-sans')

    setProperty('gf.x', getProperty('gf.x') - 250)
    setProperty('gf.y', getProperty('gf.y') - 20)
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 150)
    setProperty('dad.x', getProperty('dad.x') + 150)
    cameraSetTarget('boyfriend')
end

function onCreatePost()
    gfx = getProperty('gf.x')
    dadx = getProperty('dad.x')
end

function onBeatHit()
    if curBeat == 96 or curBeat == 160 then
        setProperty('gf.x', gfx - 300)
    end

    if curBeat == 96 or curBeat == 160 then
        setProperty('dad.x', dadx)
    end

    if curBeat == 240 or curBeat == 256 or curBeat == 272 or curBeat == 336 or curBeat == 352 or curBeat == 384 or curBeat == 400 or curBeat == 448 then
        setProperty('dad.x', dadx + 100)
    end

    if curBeat == 224 then
        setProperty('dad.x', dadx + 200)
        setProperty('dad.y', getProperty('dad.y') + 50)
    end

    if curBeat == 288 or curBeat == 416 or curBeat == 432 then
        setProperty('dad.x', getProperty('dad.x') + 200)
    end

    if curBeat == 307 or curBeat == 320 then
        setProperty('dad.x', getProperty('dad.x') + 300)
    end

    if curBeat == 416 then
        doTweenZoom('in', 'camGame', 0.9, 11.3, 'quadInOut')
    end

    if curBeat == 475 then
        doTweenZoom('out', 'camGame', 0.6, 2.82, 'quadInOut')
    end
end

local xx = 520;
local yy = 510;
local xx2 = 820;
local yy2 = 510;
local ofs = 20;
local followchars = true;

function onUpdate(elapsed)
    if followchars == true then
        if mustHitSection == false then
            if gfSection then
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx-ofs,yy)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx+ofs,yy)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx,yy-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx,yy+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos',xx-ofs,yy)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx+ofs,yy)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx,yy-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx,yy+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx,yy)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx,yy)
                end
            else
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

function onTweenCompleted(tag)
    if tag == 'in' then
        setProperty('defaultCamZoom', 0.9)
    end

    if tag == 'out' then
        setProperty('defaultCamZoom', 0.6)
    end
end