local bfx = 0
local bfy = 0
local defgfx = 0
local defgfy = 0
local gfx = 0
local gfy = 0

function onCreate()
    addCharacterToList('xiao-lament', 'boyfriend')
    addCharacterToList('xiao-lament-tired', 'boyfriend')
    addCharacterToList('xiao-lament-crazy', 'boyfriend')
    addCharacterToList('xiao', 'boyfriend')
    precacheImage('characters/YanFei fnf')
    precacheImage('secondicons/ganyu-normal')
    precacheImage('secondicons/yanfei-normal')
    precacheImage('characters/xiao-lament-tired')
    precacheImage('secondicons/xiao-normal')
    precacheImage('secondicons/xiao-danger')
    precacheImage('secondicons/ganyu-danger')
    precacheImage('secondicons/yanfei-danger')

    setProperty('boyfriend.x', getProperty('boyfriend.x') - 400)
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 290)
    bfx = getProperty('boyfriend.x')
    bfy = getProperty('boyfriend.y')
    setProperty('boyfriend.flipX',false)
    setProperty('dad.x', getProperty('dad.x') + 500)
    setProperty('dad.y', getProperty('dad.y') - 290)
    setProperty('dad.flipX', true)
    setObjectOrder('gfGroup', getObjectOrder('boyfriendGroup') + 1)
    defgfx = getProperty('gf.x')
    defgfy = getProperty('gf.y')
    gfx = defgfx - 800
    gfy = defgfy - 170
    setProperty('gf.x', gfx)
    setProperty('gf.y', gfy)
    setProperty('gf.alpha', 0)

    makeLuaSprite('ganyuicon', 'secondicons/ganyu-normal', 200, 300)
    setObjectCamera('ganyuicon', 'hud')
    setProperty('ganyuicon.alpha', 0)
    addLuaSprite('ganyuicon', false)

    makeLuaSprite('yanfeiicon', 'secondicons/yanfei-normal', 900, 310)
    setObjectCamera('yanfeiicon', 'hud')
    setProperty('yanfeiicon.flipX', true)
    setProperty('yanfeiicon.alpha', 0)
    addLuaSprite('yanfeiicon', false)

    makeAnimatedLuaSprite('yanfei', 'characters/YanFei fnf', -100, -80)
    addAnimationByPrefix('yanfei', 'idle', 'idle yanfei', 24, false)
    addOffset('yanfei', 'idle', 0, 0)
    addAnimationByPrefix('yanfei', '0', 'left yanfei', 24, false)
    addOffset('yanfei', '0', 7, -4)
    addAnimationByPrefix('yanfei', '1', 'down yanfei', 24, false)
    addOffset('yanfei', '1', -51, -12)
    addAnimationByPrefix('yanfei', '2', 'up yanfei', 24, false)
    addOffset('yanfei', '2', -1, 9)
    addAnimationByPrefix('yanfei', '3', 'right yanfei', 24, false)
    addOffset('yanfei', '3', -80, -1)
    setProperty('yanfei.alpha', 0)
    addLuaSprite('yanfei', false)

    makeAnimatedLuaSprite('xiao', 'characters/xiao-lament-tired', defgfx - 240, defgfx - 400)
    addAnimationByPrefix('xiao', 'idle', 'idle defeated xiao', 24, false)
    addLuaSprite('xiao', false)
    setProperty('xiao.visible', false)

    makeLuaText('lyrics', 'Cast your fear of injury by the wayside and fight with all your might!', 900, 200, 500)
    setTextFont('lyrics', 'vcr.ttf')
    setTextSize('lyrics', 40);
    addLuaText('lyrics')
    setTextAlignment('lyrics', 'center')
    setObjectCamera("lyrics", 'hud');
    setTextColor('lyrics', '8FA7EF')
    setProperty('lyrics.alpha', 0)
end

function onCreatePost()
	setProperty('timeBar.color', getColorFromHex('54AD96'))
	setPropertyFromClass('GameOverSubstate', 'characterName', 'sonic-dead');

    setProperty('iconP1.flipX', 1)
    setProperty('iconP2.flipX', 1)
    setProperty('healthBar.flipX', 1)

    makeLuaSprite('yanfeiIcon', 'secondicons/yanfei-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('yanfeiIcon', 'hud')
    addLuaSprite('yanfeiIcon', true)
    setObjectOrder('yanfeiIcon', getObjectOrder('iconP1') + 1)
    setProperty('yanfeiIcon.flipX', false)
    setProperty('yanfeiIcon.visible', true)
    setProperty('yanfeiIcon.alpha', 0)

    makeLuaSprite('yanfeiDangerIcon', 'secondicons/yanfei-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('yanfeiDangerIcon', 'hud')
    addLuaSprite('yanfeiDangerIcon', true)
    setObjectOrder('yanfeiDangerIcon', getObjectOrder('iconP1') + 1)
    setProperty('yanfeiDangerIcon.flipX', false)
    setProperty('yanfeiDangerIcon.visible', false)
    setProperty('yanfeiDangerIcon.alpha', 0)

    makeLuaSprite('ganyuIcon', 'secondicons/ganyu-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('ganyuIcon', 'hud')
    addLuaSprite('ganyuIcon', true)
    setObjectOrder('ganyuIcon', getObjectOrder('yanfeiIcon') + 1)
    setProperty('ganyuIcon.flipX', false)
    setProperty('ganyuIcon.visible', true)
    setProperty('ganyuIcon.alpha', 0)

    makeLuaSprite('ganyuDangerIcon', 'secondicons/ganyu-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('ganyuDangerIcon', 'hud')
    addLuaSprite('ganyuDangerIcon', true)
    setObjectOrder('ganyuDangerIcon', getObjectOrder('yanfeiDangerIcon') + 1)
    setProperty('ganyuDangerIcon.flipX', false)
    setProperty('ganyuDangerIcon.visible', false)
    setProperty('ganyuDangerIcon.alpha', 0)

    makeLuaSprite('xiaoIcon', 'secondicons/xiao-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('xiaoIcon', 'hud')
    addLuaSprite('xiaoIcon', true)
    setObjectOrder('xiaoIcon', getObjectOrder('ganyuIcon') + 1)
    setProperty('xiaoIcon.flipX', false)
    setProperty('xiaoIcon.visible', true)

    makeLuaSprite('xiaoDangerIcon', 'secondicons/xiao-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('xiaoDangerIcon', 'hud')
    addLuaSprite('xiaoDangerIcon', true)
    setObjectOrder('xiaoDangerIcon', getObjectOrder('ganyuDangerIcon') + 1)
    setProperty('xiaoDangerIcon.flipX', false)
    setProperty('xiaoDangerIcon.visible', false)
end

local followchars = true
local xx = 500
local yy = 250
local xx2 = 200
local yy2 = 250
local ofs = 30
function onUpdate(elapsed)
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

        if curBeat >= 644 then
            if getProperty('health') < 0.4 then
                setProperty('xiaoDangerIcon.visible', true)
                setProperty('ganyuDangerIcon.visible', true)
                setProperty('yanfeiDangerIcon.visible', true)
                setProperty('xiaoIcon.visible', false)
                setProperty('ganyuIcon.visible', false)
                setProperty('yanfeiIcon.visible', false)
            else
                setProperty('xiaoDangerIcon.visible', false)
                setProperty('ganyuDangerIcon.visible', false)
                setProperty('yanfeiDangerIcon.visible', false)
                setProperty('xiaoIcon.visible', true)
                setProperty('ganyuIcon.visible', true)
                setProperty('yanfeiIcon.visible', true)
            end
        else
            setProperty('xiaoIcon.visible', false)
            setProperty('ganyuIcon.visible', false)
            setProperty('yanfeiIcon.visible', false)
            setProperty('xiaoDangerIcon.visible', false)
            setProperty('ganyuDangerIcon.visible', false)
            setProperty('yanfeiDangerIcon.visible', false)
        end
    end
end

function onUpdatePost()
    setProperty('iconP1.x', -593+getProperty('healthBar.x') + (getProperty('healthBar.width')*(remapToRange(getProperty('healthBar.percent'), 0, -100, 100, 0)*0.01))-(150 * getProperty('iconP1.scale.x'))/2 - 26*2)
    setProperty('iconP2.x', -593+getProperty('healthBar.x') + (getProperty('healthBar.width')*(remapToRange(getProperty('healthBar.percent'), 0, -100, 100, 0)*0.01))+(150 * getProperty('iconP2.scale.x')-150)/2 - 26)

    setProperty('ganyuIcon.x', getProperty('iconP1.x'))
    setProperty('ganyuIcon.angle', getProperty('iconP1.angle'))
    setProperty('ganyuIcon.y', getProperty('iconP1.y') - 40)
    setProperty('ganyuIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.1)
    setProperty('ganyuIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.1)

    setProperty('ganyuDangerIcon.x', getProperty('iconP1.x'))
    setProperty('ganyuDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('ganyuDangerIcon.y', getProperty('iconP1.y') - 40)
    setProperty('ganyuDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.1)
    setProperty('ganyuDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.1)

    setProperty('yanfeiIcon.x', getProperty('iconP1.x') - 25)
    setProperty('yanfeiIcon.angle', getProperty('iconP1.angle'))
    setProperty('yanfeiIcon.y', getProperty('iconP1.y') + 15)
    setProperty('yanfeiIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.1)
    setProperty('yanfeiIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.1)

    setProperty('yanfeiDangerIcon.x', getProperty('iconP1.x') - 25)
    setProperty('yanfeiDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('yanfeiDangerIcon.y', getProperty('iconP1.y') + 15)
    setProperty('yanfeiDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.1)
    setProperty('yanfeiDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.1)

    setProperty('xiaoIcon.x', getProperty('iconP1.x') + 15)
    setProperty('xiaoIcon.angle', getProperty('iconP1.angle'))
    setProperty('xiaoIcon.y', getProperty('iconP1.y') + 25)
    setProperty('xiaoIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.1)
    setProperty('xiaoIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.1)

    setProperty('xiaoDangerIcon.x', getProperty('iconP1.x') + 15)
    setProperty('xiaoDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('xiaoDangerIcon.y', getProperty('iconP1.y') + 25)
    setProperty('xiaoDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.1)
    setProperty('xiaoDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.1)
end

function remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end

local idleAllowed = true

function onBeatHit()
    if curBeat % 2 == 0 then
        if idleAllowed then
            playAnim('yanfei', 'idle', true)
        end
    end

    if curBeat % 4 == 0 then
        playAnim('xiao', 'idle', true)
    end
end

local drain = 0.02

function onStepHit()
    if curStep == 64 then
        if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
            noteTweenX("Mdx5", 0, 410, 5, "quartInOut");
            noteTweenAngle("Mdr5", 0, 360, 5, "quartInOut");
            noteTweenAlpha("Mdo5", 0, 0, 5, "quartInOut");
            noteTweenX("Mdx6", 1, 522, 5, "quartInOut");
            noteTweenAngle("Mdr6", 1, 360, 5, "quartInOut");
            noteTweenAlpha("Mdo6", 1, 0, 5, "quartInOut");
            noteTweenX("Mdx7", 2, 633, 5, "quartInOut");
            noteTweenAngle("Mdr7", 2, -360, 5, "quartInOut");
            noteTweenAlpha("Mdo7", 2, 0, 5, "quartInOut");
            noteTweenX("Mdx8", 3, 745, 5, "quartInOut");
            noteTweenAngle("Mdr8", 3, -360, 5, "quartInOut");
            noteTweenAlpha("Mdo8", 3, 0, 5, "quartInOut");
        end
        if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then     
            noteTweenX("x5", 0, 410, 5, "quartInOut");
            noteTweenAngle("r5", 0, 360, 5, "quartInOut");
            noteTweenAlpha("o5", 0, 0, 5, "quartInOut");
            noteTweenX("x6", 1, 522, 5, "quartInOut");
            noteTweenAngle("r6", 1, 360, 5, "quartInOut");
            noteTweenAlpha("o6", 1, 0, 5, "quartInOut");
            noteTweenX("x7", 2, 633, 5, "quartInOut");
            noteTweenAngle("r7", 2, 360, 5, "quartInOut");
            noteTweenAlpha("o7", 2, 0, 5, "quartInOut");
            noteTweenX("x8", 3, 745, 5, "quartInOut");
            noteTweenAngle("r8", 3, 360, 5, "quartInOut");
            noteTweenAlpha("o8", 3, 0, 5, "quartInOut");
            noteTweenX("Mx5", 4, 410, 5, "quartInOut");
            noteTweenAngle("Mr5", 4, 360, 5, "quartInOut");
            noteTweenAlpha("Mo5", 4, 1, 16,"quartInOut");
            noteTweenX("Mx6", 5, 522, 5, "quartInOut");
            noteTweenAngle("Mr6", 5, 360, 5, "quartInOut");
            noteTweenAlpha("Mo6", 5, 1, 5, "quartInOut");
            noteTweenX("Mx7", 6, 633, 5, "quartInOut");
            noteTweenAngle("Mr7", 6, 360, 5, "quartInOut");
            noteTweenAlpha("Mo7", 6, 1, 5, "quartInOut");
            noteTweenX("Mx8", 7, 745, 5, "quartInOut");
            noteTweenAngle("Mr8", 7, 360, 5, "quartInOut");
            noteTweenAlpha("Mo8", 7, 1, 5, "quartInOut");
        end
    end

    if curStep == 563 or curStep == 848 or curStep == 1867 or curStep == 2000 or curStep == 2320 then
        setProperty('boyfriend.x', bfx)
        setProperty('boyfriend.y', bfy)
        setProperty('boyfriend.flipX', false)
    end

    if curStep == 2320 then
        setProperty('stageback.visible', false)
        setProperty('boyfriend.visible', false)
        setProperty('dad.visible', false)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
        setProperty('healthBar.visible', false)
        setProperty('healthBarBG.visible', false)
        setProperty('scoreTxt.visible', false)
        setProperty('botplayTxt.visible', false)
        setProperty('timeBar.visible', false)
        setProperty('timeBarBG.visible', false)
        setProperty('timeTxt.visible', false)
        for i=4,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        setProperty('xiao.visible', true)
        followchars = false
        triggerEvent('Camera Follow Pos', 350, 250)
    end

    if curStep == 2333 then
        setProperty('gf.alpha', 0)
        doTweenAlpha('ganyuhi', 'ganyuicon', 1, 0.5, 'quartOut')
        doTweenAlpha('lyricshi', 'lyrics', 1, 0.5, 'quartOut')
    end

    if curStep == 2376 then
        doTweenAlpha('yanfeihi', 'yanfeiicon', 1, 0.5, 'quartOut')
        setTextString('lyrics', 'Show a little more enthusiasm. Like me! Hehe.')
        setTextColor('lyrics', 'F0B19A')
    end

    if curStep == 2409 then
        setTextString('lyrics', 'Hardships are a fact of life.')
        setTextColor('lyrics', '8FA7EF')
    end

    if curStep == 2427 then
        setTextString('lyrics', 'Do not seek to emulate the past, for there is no law that can suffice for all time.')
        setTextColor('lyrics', 'F0B19A')
    end

    if curStep == 2470 then
        setTextString('lyrics', 'You have to keep your promises to live a happy life.')
        setTextColor('lyrics', '8FA7EF')
    end

    if curStep == 2502 then
        setTextString('lyrics', 'You, too, are a source of happiness for me.')
        setTextColor('lyrics', 'F0B19A')
    end

    if curStep == 2528 then
        setTextString('lyrics', 'The power hidden within you is not inferior to mine.')
        setTextColor('lyrics', '8FA7EF')
    end

    if curStep == 2560 then
        for i=4,7 do
            noteTweenAlpha(i..'hi', i, 1, 0.8, 'quartOut')
        end
        doTweenAlpha('bye', 'xiao', 0, 0.8, 'quartOut')
        doTweenAlpha('byeganyu', 'ganyuicon', 0, 0.8, 'quartOut')
        doTweenAlpha('byeyanfei', 'yanfeiicon', 0, 0.8, 'quartOut')
    end

    if curStep == 2563 then
        setTextString('lyrics', 'Try and stay positive.')
        setTextColor('lyrics', 'F0B19A')
    end

    if curStep == 2576 then
        setProperty('stageback.visible', true)
        setProperty('boyfriend.visible', true)
        setProperty('dad.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('healthBar.visible', true)
        setProperty('healthBarBG.visible', true)
        setProperty('scoreTxt.visible', true)
        if botPlay then
            setProperty('botplayTxt.visible', true)
        end
        setProperty('timeBar.visible', true)
        setProperty('timeBarBG.visible', true)
        setProperty('timeTxt.visible', true)
        removeLuaSprite('ganyuicon')
        removeLuaSprite('yanfeiicon')
        removeLuaSprite('xiao')
        removeLuaText('lyrics', true)
        followchars = true
    end

    if curStep == 2610 then
        doTweenAlpha('gfhi', 'gf', 0.5, 0.5, 'quartIn')
        doTweenAlpha('giconhi', 'ganyuIcon', 0.5, 0.5, 'quartIn')
        doTweenAlpha('dgiconhi', 'ganyuDangerIcon', 0.5, 0.5, 'quartIn')
    end

    if curStep == 2674 then
        doTweenAlpha('yanfeihi', 'yanfei', 0.5, 0.5, 'quartIn')
        doTweenAlpha('yiconhi', 'yanfeiIcon', 0.5, 0.5, 'quartIn')
        doTweenAlpha('dyiconhi', 'yanfeiDangerIcon', 0.5, 0.5, 'quartIn')
    end

    if curStep == 2960 then
        doTweenAlpha('dadbye', 'dad', 0, 7.5, 'linear')
        doTweenAlpha('iconbye', 'iconP2', 0, 7.5, 'linear')
    end

    if curStep == 148 or curStep == 1872 or curStep == 2576 then
        drain = 0.01
    end

    if curStep == 848 then
        drain = 0.02
    end

    if curStep == 2000 then
        drain = 0.03
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Special Sing' then
        playAnim('yanfei', direction, true)
        idleAllowed = false
        runTimer('resumeIdle', 0.5, 1)
    elseif noteType == '' then
        if getProperty('health') > drain then
            setProperty('health', getProperty('health') - drain)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeIdle' then
        idleAllowed = true
    end
end