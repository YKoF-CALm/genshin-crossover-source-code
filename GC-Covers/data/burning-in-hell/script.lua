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
    addCharacterToList('hu-tao-alt', 'dad')
    addCharacterToList('shenhe', 'dad')
    addCharacterToList('kazuha', 'dad')
    addCharacterToList('ayaka', 'dad')
    addCharacterToList('ayato', 'dad')
    addCharacterToList('keqing', 'dad')
    addCharacterToList('kokomi', 'dad')
    addCharacterToList('aether-duality', 'dad')

    setProperty('introSoundsSuffix', '-sans')

    setProperty('gf.x', getProperty('gf.x') - 250)
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 150)
    setProperty('dad.x', getProperty('dad.x') + 150)
    cameraSetTarget('boyfriend')
end

function onCreatePost()
    gfx = getProperty('gf.x')
    dadx = getProperty('dad.x')
end

function onBeatHit()
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
local del = 0;
local del2 = 0;

function onUpdate(elapsed)
    setProperty('gf.x', gfx)
    setProperty('dad.x', dadx)

    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
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