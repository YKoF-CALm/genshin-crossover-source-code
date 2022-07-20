local defdx = 0
local defdy = 0
local defbx = 0

function onCreate()
    precacheImage('genshin/shenhejs')
    precacheImage('genshin/xiaojs')
    precacheImage('genshin/hutaojs')
    precacheImage('genshin/zhonglijs')
    precacheImage('genshin/keqingjs')
    precacheImage('notes/ludinotes')
    precacheImage('notes/hu-tao')
    precacheImage('notesplashes/ludisplashes')
    precacheImage('exe/screenstatic')
    precacheSound('P3Jumps/TailsScreamLOL')
    precacheSound('P3Jumps/KnucklesScreamLOL')
    precacheSound('P3Jumps/EggmanScreamLOL')
    addCharacterToList('ganyu-player-flipped', 'boyfriend')
    addCharacterToList('zhongli', 'dad')
    addCharacterToList('xiao-flipped', 'dad')
    addCharacterToList('zhongli-flipped', 'dad')
    addCharacterToList('hu-tao-alt', 'dad')
    addCharacterToList('keqing-flipped', 'dad')
    addCharacterToList('keqing-player', 'gf')

    makeLuaSprite('js1', 'genshin/shenhejs', 0, 0)
    setObjectCamera('js1', 'other')

    makeLuaSprite('js2', 'genshin/xiaojs', 0, 0)
    setObjectCamera('js2', 'other')

    makeLuaSprite('js3', 'genshin/hutaojs', 0, 0)
    setObjectCamera('js3', 'other')

    makeLuaSprite('js4', 'genshin/zhonglijs', 0, 0)
    setObjectCamera('js4', 'other')

    makeLuaSprite('js5', 'genshin/keqingjs', 0, 0)
    setObjectCamera('js5', 'other')

    makeAnimatedLuaSprite('jumpstatic', 'exe/screenstatic', 0, 0)
    addAnimationByPrefix('jumpstatic', 'static', 'screenSTATIC', 24, true)
    setProperty('jumpstatic.alpha', 0.3)
    setObjectCamera('jumpstatic', 'other')

    --setProperty('boyfriend.y', getProperty('boyfriend.y') - 20)
end

function onCreatePost()
    defdx = getProperty('dad.x')
    defdy = getProperty('dad.y')
    defbx = getProperty('boyfriend.x')
end

local altdadx = 0
local altbfx = 0
local altdady = 0
local xx = 500;
local yy = 400;
local xx2 = 800;
local yy2 = 400;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
local healthdrain = false

function onUpdate(elapsed)
    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if curStep >= 1300 and curStep <= 2815 then
        xx = 800;
        yy = 400;
        xx2 = 500;
        yy2 = 400;
    elseif curStep >= 5249 and curStep <= 6163 then
        xx = 800;
        yy = 400;
        xx2 = 400;
        yy2 = 400;
    else
        xx = 500;
        yy = 400;
        xx2 = 800;
        yy2 = 400;
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
            if curStep >= 6356 and curStep <= 6419 then
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
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
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

    if curStep == 5249 then
        setProperty('dad.x', altdadx + 100)
        setProperty('bf.x', altbfx)
        setProperty('dad.y', altdady)
    end
end

function onStepHit()
    if curStep == 148 then
        addLuaSprite('js1', true)
        addLuaSprite('jumpstatic', true)
        objectPlayAnimation('jumpstatic', 'static', true)
        runTimer('bye2', 0.2, 1)
        healthdrain = true
    end

    if curStep == 1300 then
        setProperty('dad.x', getProperty('dad.x') + 700)
        setProperty('dad.y', getProperty('dad.y') + 30)
        setProperty('boyfriend.x', getProperty('boyfriend.x') - 700)
        altdadx = getProperty('dad.x')
        altbfx = getProperty('bf.x')
        altdady = getProperty('dad.y')
        healthdrain = false
    end

    if curStep == 1428 then
        addLuaSprite('js2', true)
        addLuaSprite('jumpstatic', true)
        objectPlayAnimation('jumpstatic', 'static', true)
        runTimer('bye3', 0.2, 1)
        healthdrain = true
    end

    if curStep == 2325 then
        setProperty('dad.x', altdadx)
    end

    if curStep == 2814 then
        healthdrain = false
    end

    if curStep == 3028 then
        addLuaSprite('js3', true)
        addLuaSprite('jumpstatic', true)
        objectPlayAnimation('jumpstatic', 'static', true)
        runTimer('bye4', 0.2, 1)
        healthdrain = true
    end

    if curStep == 4180 then
        addLuaSprite('js4', true)
        addLuaSprite('jumpstatic', true)
        objectPlayAnimation('jumpstatic', 'static', true)
        runTimer('bye5', 0.2, 1)
    end

    if curStep == 5248 then
        addLuaSprite('js5', true)
        addLuaSprite('jumpstatic', true)
        objectPlayAnimation('jumpstatic', 'static', true)
        runTimer('bye6', 0.2, 1)
        healthdrain = false
    end

    if curStep == 6164 then
        healthdrain = true
    end

    if curStep == 6356 then
        setProperty('gf.x', getProperty('gf.x') + 600)
        setProperty('gf.y', getProperty('gf.y') - 50)
        setProperty('gf.alpha', 1)
        setProperty('gf.flipX', true)
    end

    if curStep == 6693 then
        healthdrain = false
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Duet Note' then
		characterPlayAnim('gf', getProperty('singAnimations')[math.abs(direction)+1], true)
		setProperty('gf.holdTimer', 0)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if healthdrain and getProperty('health') > 0.01 then
        setProperty('health', getProperty('health') - 0.01)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'bye2' then
        removeLuaSprite('js1', false)
        removeLuaSprite('jumpstatic', false)
    end

    if tag == 'bye3' then
        removeLuaSprite('js2', false)
        removeLuaSprite('jumpstatic', false)
    end

    if tag == 'bye4' then
        removeLuaSprite('js3', false)
        removeLuaSprite('jumpstatic', false)
    end

    if tag == 'bye5' then
        removeLuaSprite('js4', false)
        removeLuaSprite('jumpstatic', false)
    end

    if tag == 'bye6' then
        removeLuaSprite('js5', false)
        removeLuaSprite('jumpstatic', false)
    end
end