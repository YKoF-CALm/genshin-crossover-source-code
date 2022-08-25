local bfx = 0
local bfy = 0
local dadx = 0
local dady = 0
local ningx = 1400
local ningy = 600
local kazuhax = 1200
local kazuhay = 800
local cgx = -500
local cgy = 650
local tankmanx = 20
local tankmany = 800
local jimmyx = 300
local jimmyy = 800
local dadMaxX = 0
local dadMaxY = 0
local bfMaxX = 0
local bfMaxY = 0
local cgMaxX = 0
local cgMaxY = 0
local kazuhaMaxX = 0
local kazuhaMaxY = 0
local ningMaxX = 0
local ningMaxY = 0
local tankmanMaxX = 0
local tankmanMaxY = 0

function onCreate()
    precacheImage('secondicons/cg-normal')
    precacheImage('secondicons/cg-danger')
    precacheImage('secondicons/zardy-normal')
    precacheImage('secondicons/zardy-danger')
    precacheImage('secondicons/tankman-normal')
    precacheImage('secondicons/tankman-danger')
    precacheImage('secondicons/kazuha-png-normal')
    precacheImage('secondicons/kazuha-png-danger')
    precacheImage('secondicons/ningguang-png-normal')
    precacheImage('secondicons/ningguang-png-danger')
    precacheImage('secondicons/yoimiya-png-normal')
    precacheImage('secondicons/yoimiya-png-danger')
    precacheSound("carCrash")

    makeAnimatedLuaSprite('ningguang', 'characters/ningguang_PNG', ningx, ningy + 1000)
    addAnimationByPrefix('ningguang', 'idle', 'ninidle', 24, false)
    addAnimationByPrefix('ningguang', '0', 'left ningg', 24, false)
    addAnimationByPrefix('ningguang', '1', 'downguang', 24, false)
    addAnimationByPrefix('ningguang', '2', 'up nina', 24, false)
    addAnimationByPrefix('ningguang', '3', 'right', 24, false)
    setProperty('ningguang.flipX', true)

    makeAnimatedLuaSprite('cassette', 'characters/cassettegirl', cgx, cgy + 850)
    addAnimationByPrefix('cassette', 'idle', 'cassettegirl idle', 24, false)
    addAnimationByPrefix('cassette', '0', 'cassettegirl left', 24, false)
    addAnimationByPrefix('cassette', '1', 'cassettegirl down', 24, false)
    addAnimationByPrefix('cassette', '2', 'cassettegirl up', 24, false)
    addAnimationByPrefix('cassette', '3', 'cassettegirl right', 24, false)

    makeAnimatedLuaSprite('kazuha', 'characters/kazah', kazuhax, kazuhay + 1000)
    addAnimationByPrefix('kazuha', 'idle', 'kazidle', 24, false)
    addAnimationByPrefix('kazuha', '0', 'right kazuha', 24, false)
    addAnimationByPrefix('kazuha', '1', 'downkazi', 24, false)
    addAnimationByPrefix('kazuha', '2', 'upkaz', 24, false)
    addAnimationByPrefix('kazuha', '3', 'left kazzu', 24, false)
    setProperty('kazuha.flipX', true)

    makeAnimatedLuaSprite('tankman', 'characters/tankmanCaptain_Animations', tankmanx, tankmany + 700)
    addAnimationByPrefix('tankman', 'idle', 'Tankman Idle Dance', 24, false)
    addAnimationByPrefix('tankman', '0', 'Tankman Right Note', 24, false)
    addAnimationByPrefix('tankman', '1', 'Tankman DOWN note', 24, false)
    addAnimationByPrefix('tankman', '2', 'Tankman UP note', 24, false)
    addAnimationByPrefix('tankman', '3', 'Tankman Note Left', 24, false)
    addAnimationByPrefix('tankman', 'laugh', 'Laugh', 24, false)
    addAnimationByPrefix('tankman', 'ugh', 'TANKMAN UGH', 24, false)
    addAnimationByPrefix('tankman', 'huh', 'HUH', 24, false)
    addAnimationByPrefix('tankman', 'good', 'GOOD', 24, false)
    setProperty('tankman.flipX', true)

    makeAnimatedLuaSprite('jimmy', 'characters/JimDeadEnd', jimmyx, jimmyy + 600)
    addAnimationByPrefix('jimmy', 'idle', 'JimIdleMAD', 24, false)
    addAnimationByPrefix('jimmy', 'left', 'JimLeftDifPer', 24, false)
    addAnimationByPrefix('jimmy', 'down', 'JimDownDifPer', 24, false)
    addAnimationByPrefix('jimmy', 'up', 'JimUpDifPer', 24, false)

    addLuaSprite('kazuha', false)
    addLuaSprite('ningguang', false)
    addLuaSprite('cassette', false)
    addLuaSprite('tankman', false)
    addLuaSprite('jimmy', true)

    addOffset('ningguang', '0', 81, 120)
    addOffset('ningguang', '1', 60, -152)
    addOffset('ningguang', '2', -55, 140)
    addOffset('ningguang', '3', 90, 3)
    addOffset('cassette', '0', -2, 0)
    addOffset('cassette', '1', 2, -1)
    addOffset('cassette', '3', -2, 0)
    addOffset('kazuha', 'idle', -5, 0)
    addOffset('kazuha', '0', 90, 42)
    addOffset('kazuha', '1', 120, -101)
    addOffset('kazuha', '2', 54, 101)
    addOffset('kazuha', '3', 72, 76)
    addOffset('tankman', 'idle', -5, 0)
    addOffset('tankman', '0', 82, -12)
    addOffset('tankman', '1', 68, -104)
    addOffset('tankman', '2', 44, 46)
    addOffset('tankman', '3', -25, -30)
    addOffset('tankman', 'laugh', -28, 31)
    addOffset('tankman', 'ugh', -20, -9)
    addOffset('tankman', 'huh', -6, 16)
    addOffset('tankman', 'good', -3, 16)
    addOffset('jimmy', 'idle', 0, -26)
    addOffset('jimmy', 'left', 130, -40)
    addOffset('jimmy', 'down', 40, -15)
    addOffset('jimmy', 'up', 84, -49)

    setObjectOrder('ningguang', getObjectOrder('gfGroup') + 1)
    setObjectOrder('kazuha', getObjectOrder('ningguang') - 1)
    setObjectOrder('cassette', getObjectOrder('dadGroup') + 1)
    setObjectOrder('tankman', getObjectOrder('cassette') + 1)
end

function onCreatePost()
    bfx = getProperty('boyfriend.x')
    bfy = getProperty('boyfriend.y')
    dadx = getProperty('dad.x')
    dady = getProperty('dad.y')
    dadMaxX = dadx + 5000
    dadMaxY = dady + 5000
    bfMaxX = bfx + 5000
    bfMaxY = bfy + 5000
    cgMaxX = cgx + 5000
    cgMaxY = cgy + 5000
    kazuhaMaxX = kazuhax + 5000
    kazuhaMaxY = kazuhay + 5000
    ningMaxX = ningx + 5000
    ningMaxY = ningy + 5000
    tankmanMaxX = tankmanx + 5000
    tankmanMaxY = tankmany + 5000

    makeLuaSprite('cgIcon', 'secondicons/cg-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('cgIcon', 'hud')
    addLuaSprite('cgIcon', true)
    setObjectOrder('cgIcon', getObjectOrder('iconP2') + 1)
    setProperty('cgIcon.flipX', false)
    setProperty('cgIcon.visible', true)

    makeLuaSprite('cgDangerIcon', 'secondicons/cg-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('cgDangerIcon', 'hud')
    addLuaSprite('cgDangerIcon', true)
    setObjectOrder('cgDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('cgDangerIcon.flipX', false)
    setProperty('cgDangerIcon.visible', false)

    makeLuaSprite('zardyIcon', 'secondicons/zardy-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('zardyIcon', 'hud')
    addLuaSprite('zardyIcon', true)
    setObjectOrder('zardyIcon', getObjectOrder('cgIcon') + 1)
    setProperty('zardyIcon.flipX', false)
    setProperty('zardyIcon.visible', true)

    makeLuaSprite('zardyDangerIcon', 'secondicons/zardy-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('zardyDangerIcon', 'hud')
    addLuaSprite('zardyDangerIcon', true)
    setObjectOrder('zardyDangerIcon', getObjectOrder('cgDangerIcon') + 1)
    setProperty('zardyDangerIcon.flipX', false)
    setProperty('zardyDangerIcon.visible', false)

    makeLuaSprite('tankmanIcon', 'secondicons/tankman-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('tankmanIcon', 'hud')
    addLuaSprite('tankmanIcon', true)
    setObjectOrder('tankmanIcon', getObjectOrder('zardyIcon') + 1)
    setProperty('tankmanIcon.flipX', false)
    setProperty('tankmanIcon.visible', true)

    makeLuaSprite('tankmanDangerIcon', 'secondicons/tankman-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('tankmanDangerIcon', 'hud')
    addLuaSprite('tankmanDangerIcon', true)
    setObjectOrder('tankmanDangerIcon', getObjectOrder('zardyDangerIcon') + 1)
    setProperty('tankmanDangerIcon.flipX', false)
    setProperty('tankmanDangerIcon.visible', false)

    makeLuaSprite('ningguangIcon', 'secondicons/ningguang-png-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('ningguangIcon', 'hud')
    addLuaSprite('ningguangIcon', true)
    setObjectOrder('ningguangIcon', getObjectOrder('iconP1') + 1)
    setProperty('ningguangIcon.flipX', true)
    setProperty('ningguangIcon.visible', true)

    makeLuaSprite('ningguangDangerIcon', 'secondicons/ningguang-png-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('ningguangDangerIcon', 'hud')
    addLuaSprite('ningguangDangerIcon', true)
    setObjectOrder('ningguangDangerIcon', getObjectOrder('iconP1') + 1)
    setProperty('ningguangDangerIcon.flipX', true)
    setProperty('ningguangDangerIcon.visible', false)

    makeLuaSprite('kazuhaIcon', 'secondicons/kazuha-png-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('kazuhaIcon', 'hud')
    addLuaSprite('kazuhaIcon', true)
    setObjectOrder('kazuhaIcon', getObjectOrder('ningguangIcon') + 1)
    setProperty('kazuhaIcon.flipX', true)
    setProperty('kazuhaIcon.visible', true)

    makeLuaSprite('kazuhaDangerIcon', 'secondicons/kazuha-png-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('kazuhaDangerIcon', 'hud')
    addLuaSprite('kazuhaDangerIcon', true)
    setObjectOrder('kazuhaDangerIcon', getObjectOrder('ningguangDangerIcon') + 1)
    setProperty('kazuhaDangerIcon.flipX', true)
    setProperty('kazuhaDangerIcon.visible', false)

    makeLuaSprite('yoimiyaIcon', 'secondicons/yoimiya-png-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('yoimiyaIcon', 'hud')
    addLuaSprite('yoimiyaIcon', true)
    setObjectOrder('yoimiyaIcon', getObjectOrder('kazuhaIcon') + 1)
    setProperty('yoimiyaIcon.flipX', true)
    setProperty('yoimiyaIcon.visible', true)

    makeLuaSprite('yoimiyaDangerIcon', 'secondicons/yoimiya-png-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('yoimiyaDangerIcon', 'hud')
    addLuaSprite('yoimiyaDangerIcon', true)
    setObjectOrder('yoimiyaDangerIcon', getObjectOrder('kazuhaDangerIcon') + 1)
    setProperty('yoimiyaDangerIcon.flipX', true)
    setProperty('yoimiyaDangerIcon.visible', false)
end

local xx = 420;
local yy = 930;
local xx2 = 920;
local yy2 = 930;
local ofs = 20;
local followchars = false;
local del = 0;
local del2 = 0;
local cassettesing = false
local ningsing = false
local kazuhasing = false
local tankmansing = false

function onUpdate(elapsed)
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if cassettesing then
                if getProperty('cassette.animation.curAnim.name') == '0' then
                    triggerEvent('Camera Follow Pos',xx-ofs,yy)
                end
                if getProperty('cassette.animation.curAnim.name') == '3' then
                    triggerEvent('Camera Follow Pos',xx+ofs,yy)
                end
                if getProperty('cassette.animation.curAnim.name') == '2' then
                    triggerEvent('Camera Follow Pos',xx,yy-ofs)
                end
                if getProperty('cassette.animation.curAnim.name') == '1' then
                    triggerEvent('Camera Follow Pos',xx,yy+ofs)
                end
                if getProperty('cassette.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx,yy)
                end
            elseif tankmansing then
                if getProperty('tankman.animation.curAnim.name') == '0' then
                    triggerEvent('Camera Follow Pos',xx-ofs,yy)
                end
                if getProperty('tankman.animation.curAnim.name') == '3' then
                    triggerEvent('Camera Follow Pos',xx+ofs,yy)
                end
                if getProperty('tankman.animation.curAnim.name') == '2' then
                    triggerEvent('Camera Follow Pos',xx,yy-ofs)
                end
                if getProperty('tankman.animation.curAnim.name') == '1' then
                    triggerEvent('Camera Follow Pos',xx,yy+ofs)
                end
                if getProperty('tankman.animation.curAnim.name') == 'laugh' then
                    triggerEvent('Camera Follow Pos',xx,yy-ofs)
                end
                if getProperty('tankman.animation.curAnim.name') == 'idle' then
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
                if getProperty('dad.animation.curAnim.name') == 'laugh' then
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
            if ningsing then
                if getProperty('ningguang.animation.curAnim.name') == '0' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                end
                if getProperty('ningguang.animation.curAnim.name') == '3' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('ningguang.animation.curAnim.name') == '2' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('ningguang.animation.curAnim.name') == '1' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
                if getProperty('ningguang.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                end
            elseif kazuhasing then
                if getProperty('kazuha.animation.curAnim.name') == '0' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                end
                if getProperty('kazuha.animation.curAnim.name') == '3' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('kazuha.animation.curAnim.name') == '2' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('kazuha.animation.curAnim.name') == '1' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
                if getProperty('kazuha.animation.curAnim.name') == 'idle' then
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
    end

    if curStep >= 696 then
        setProperty('iconP2.visible', false)
        if getProperty('health') > 1.6 then
            setProperty('cgIcon.visible', false)
            setProperty('cgDangerIcon.visible', true)
            setProperty('zardyIcon.visible', false)
            setProperty('zardyDangerIcon.visible', true)
            if curStep >= 1022 then
                setProperty('tankmanIcon.visible', false)
                setProperty('tankmanDangerIcon.visible', true)
            end
        else
            setProperty('cgIcon.visible', true)
            setProperty('cgDangerIcon.visible', false)
            setProperty('zardyIcon.visible', true)
            setProperty('zardyDangerIcon.visible', false)
            if curStep >= 1022 then
                setProperty('tankmanIcon.visible', true)
                setProperty('tankmanDangerIcon.visible', false)
            end
        end
        setProperty('iconP1.visible', false)
        if getProperty('health') <= 0.4 then
            setProperty('kazuhaIcon.visible', false)
            setProperty('kazuhaDangerIcon.visible', true)
            setProperty('ningguangIcon.visible', false)
            setProperty('ningguangDangerIcon.visible', true)
            if curStep >= 960 then
                setProperty('yoimiyaIcon.visible', false)
                setProperty('yoimiyaDangerIcon.visible', true)
            end
        else
            setProperty('kazuhaIcon.visible', true)
            setProperty('kazuhaDangerIcon.visible', false)
            setProperty('ningguangIcon.visible', true)
            setProperty('kazuhaDangerIcon.visible', false)
            if curStep >= 960 then
                setProperty('yoimiyaIcon.visible', true)
                setProperty('yoimiyaDangerIcon.visible', false)
            end
        end
    else
        setProperty('iconP2.visible', true)
        setProperty('iconP1.visible', true)
        setProperty('cgIcon.visible', false)
        setProperty('cgDangerIcon.visible', false)
        setProperty('zardyIcon.visible', false)
        setProperty('zardyDangerIcon.visible', false)
        setProperty('tankmanIcon.visible', false)
        setProperty('tankmanDangerIcon.visible', false)
        setProperty('kazuhaIcon.visible', false)
        setProperty('ningguangIcon.visible', false)
        setProperty('kazuhaDangerIcon.visible', false)
        setProperty('ningguangDangerIcon.visible', false)
        setProperty('yoimiyaIcon.visible', false)
        setProperty('yoimiyaDangerIcon.visible', false)
    end

    if getProperty("dad.x") >= (dadMaxX) or getProperty("dad.x") <= (-1*dadMaxX) or getProperty("dad.y") >= (dadMaxY) or getProperty("dad.y") <= (-1*dadMaxY) then
        playSound("carCrash",2)
        triggerEvent('Screen Shake', '0.35, 0.05', '')
        doTweenX("dadTweenX","dad", dadx, 2, "expoOut")
        doTweenY("dadTweenY","dad", dady, 2, "expoOut")
    end

    if getProperty("boyfriend.x") >= (bfMaxX) or getProperty("boyfriend.x") <= (-1*bfMaxX) or getProperty("boyfriend.y") >= (bfMaxY) or getProperty("boyfriend.y") <= (-1*bfMaxY) then
        playSound("carCrash",2)
        triggerEvent('Screen Shake', '0.35, 0.05', '')
        doTweenX("bfTweenX","boyfriend", bfx, 2, "expoOut")
        doTweenY("bfTweenY","boyfriend", bfy, 2, "expoOut")
    end

    if getProperty("cassette.x") >= (cgMaxX) or getProperty("cassette.x") <= (-1*cgMaxX) or getProperty("cassette.y") >= (cgMaxY) or getProperty("cassette.y") <= (-1*cgMaxY) then
        playSound("carCrash",2)
        triggerEvent('Screen Shake', '0.35, 0.05', '')
        doTweenX("cgTweenX","cassette", cgx, 2, "expoOut")
        doTweenY("cgTweenY","cassette", cgy, 2, "expoOut")
    end

    if getProperty("kazuha.x") >= (kazuhaMaxX) or getProperty("kazuha.x") <= (-1*kazuhaMaxX) or getProperty("kazuha.y") >= (kazuhaMaxY) or getProperty("kazuha.y") <= (-1*kazuhaMaxY) then
        playSound("carCrash",2)
        triggerEvent('Screen Shake', '0.35, 0.05', '')
        doTweenX("kazuhaTweenX","kazuha", kazuhax, 2, "expoOut")
        doTweenY("kazuhaTweenY","kazuha", kazuhay, 2, "expoOut")
    end

    if getProperty("ningguang.x") >= (ningMaxX) or getProperty("ningguang.x") <= (-1*ningMaxX) or getProperty("ningguang.y") >= (ningMaxY) or getProperty("ningguang.y") <= (-1*ningMaxY) then
        playSound("carCrash",2)
        triggerEvent('Screen Shake', '0.35, 0.05', '')
        doTweenX("ningTweenX","ningguang", ningx, 2, "expoOut")
        doTweenY("ningTweenY","ningguang", ningy, 2, "expoOut")
    end

    if getProperty("tankman.x") >= (tankmanMaxX) or getProperty("tankman.x") <= (-1*tankmanMaxX) or getProperty("tankman.y") >= (tankmanMaxY) or getProperty("tankman.y") <= (-1*tankmanMaxY) then
        playSound("carCrash",2)
        triggerEvent('Screen Shake', '0.35, 0.05', '')
        doTweenX("tankmanTweenX","tankman", tankmanx, 2, "expoOut")
        doTweenY("tankmanTweenY","tankman", tankmany, 2, "expoOut")
    end
end

function onUpdatePost(elapsed)
    setProperty('cgIcon.x', getProperty('iconP2.x') - 10)
    setProperty('cgIcon.angle', getProperty('iconP2.angle'))
    setProperty('cgIcon.y', getProperty('iconP2.y') + 15)
    setProperty('cgIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.1)
    setProperty('cgIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.1)

    setProperty('cgDangerIcon.x', getProperty('iconP2.x') - 10)
    setProperty('cgDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('cgDangerIcon.y', getProperty('iconP2.y') + 15)
    setProperty('cgDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.1)
    setProperty('cgDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.1)

    setProperty('zardyIcon.x', getProperty('iconP2.x'))
    setProperty('zardyIcon.angle', getProperty('iconP2.angle'))
    setProperty('zardyIcon.y', getProperty('iconP2.y') - 25)
    setProperty('zardyIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('zardyIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('zardyDangerIcon.x', getProperty('iconP2.x'))
    setProperty('zardyDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('zardyDangerIcon.y', getProperty('iconP2.y') - 25)
    setProperty('zardyDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('zardyDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('tankmanIcon.x', getProperty('iconP2.x') + 30)
    setProperty('tankmanIcon.angle', getProperty('iconP2.angle'))
    setProperty('tankmanIcon.y', getProperty('iconP2.y') + 30)
    setProperty('tankmanIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('tankmanIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('tankmanDangerIcon.x', getProperty('iconP2.x') + 30)
    setProperty('tankmanDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('tankmanDangerIcon.y', getProperty('iconP2.y') + 30)
    setProperty('tankmanDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('tankmanDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('kazuhaIcon.x', getProperty('iconP1.x'))
    setProperty('kazuhaIcon.angle', getProperty('iconP1.angle'))
    setProperty('kazuhaIcon.y', getProperty('iconP1.y') - 50)
    setProperty('kazuhaIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.1)
    setProperty('kazuhaIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.1)

    setProperty('kazuhaDangerIcon.x', getProperty('iconP1.x'))
    setProperty('kazuhaDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('kazuhaDangerIcon.y', getProperty('iconP1.y') - 50)
    setProperty('kazuhaDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.1)
    setProperty('kazuhaDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.1)

    setProperty('ningguangIcon.x', getProperty('iconP1.x') + 10)
    setProperty('ningguangIcon.angle', getProperty('iconP1.angle'))
    setProperty('ningguangIcon.y', getProperty('iconP1.y') + 15)
    setProperty('ningguangIcon.scale.x', getProperty('iconP1.scale.x')/2 - 0.1)
    setProperty('ningguangIcon.scale.y', getProperty('iconP1.scale.y')/2 - 0.1)

    setProperty('ningguangDangerIcon.x', getProperty('iconP1.x') + 10)
    setProperty('ningguangDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('ningguangDangerIcon.y', getProperty('iconP1.y') + 15)
    setProperty('ningguangDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 - 0.1)
    setProperty('ningguangDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 - 0.1)

    setProperty('yoimiyaIcon.x', getProperty('iconP1.x') - 30)
    setProperty('yoimiyaIcon.angle', getProperty('iconP1.angle'))
    setProperty('yoimiyaIcon.y', getProperty('iconP1.y') + 30)
    setProperty('yoimiyaIcon.scale.x', getProperty('iconP1.scale.x')/2 - 0.1)
    setProperty('yoimiyaIcon.scale.y', getProperty('iconP1.scale.y')/2 - 0.1)

    setProperty('yoimiyaDangerIcon.x', getProperty('iconP1.x') - 30)
    setProperty('yoimiyaDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('yoimiyaDangerIcon.y', getProperty('iconP1.y') + 30)
    setProperty('yoimiyaDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 - 0.1)
    setProperty('yoimiyaDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 - 0.1)
end

local ningIdleAllowed = true
local cassetteIdleAllowed = true
local kazuhaIdleAllowed = true
local tankmanIdleAllowed = true
local jimmyIdleAllowed = true

function onBeatHit()
    if curBeat % 2 == 0 then
        if jimmyIdleAllowed then
            playAnim('jimmy', 'idle', true)
        end

        if ningIdleAllowed then
            playAnim('ningguang', 'idle', true)
        end

        if cassetteIdleAllowed then
            playAnim('cassette', 'idle', true)
        end

        if kazuhaIdleAllowed then
            playAnim('kazuha', 'idle', true)
        end

        if tankmanIdleAllowed then
            playAnim('tankman', 'idle', true)
        end
    end 
end

function onStepHit()
    if curStep == 16 then
        followchars = true
    end

    if curStep == 176 then
        carCrashActive = true
    end

    if curStep == 192 then
        carCrashActive = false
    end

    if curStep == 240 then
        carCrashActive = true
    end

    if curStep == 252 then
        tagOut('ningguang')
    end

    if curStep == 256 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 500)
        tagIn('yoimiya')
        followchars = false
        carCrashActive = false
    end

    if curStep == 288 then
        followchars = true
    end

    if curStep == 320 then
        carCrashActive = true
    end

    if curStep == 352 then
        carCrashActive = false
    end

    if curStep == 688 then
        doTweenX('x1', 'dad', getProperty('dad.x') + 300, 0.3, 'cubeInOut')
        doTweenX('x2', 'boyfriend', getProperty('boyfriend.x') - 300, 0.3, 'cubeInOut')

        doTweenY('y1', 'dad', getProperty('dad.y') + 550, 0.3, 'cubeInOut')
        doTweenY('y2', 'boyfriend', getProperty('boyfriend.y') + 550, 0.3, 'cubeInOut')

        doTweenAngle('angol1', 'dad', 90, 0.3, 'cubeInOut')
        doTweenAngle('angol2', 'boyfriend', -90, 0.3, 'cubeInOut')
    end

    if curStep == 696 then
        cancelTween('bfTweenCrash')
        cancelTween('bfTweenX')
        cancelTween('bfTweenY')
        setProperty('dad.y', getProperty('dad.y') + 700)
        setProperty('dad.x', getProperty('dad.x') - 200)
        setProperty('boyfriend.y', bfy + 1000)
        setProperty('boyfriend.angle', 0)
        tagIn('zardy')
        tagIn('kazuha')
        tagIn('ningguang')
        tagIn('cassette')
        dadx = getProperty('dad.x')
        dady = getProperty('dad.y') - 720
        dadMaxX = dadx + 5000
        dadMaxY = dady + 5000
    end

    if curStep == 704 then
        kazuhasing = true
    end

    if curStep == 824 then
        cassettesing = true
    end

    if curStep == 832 then
        kazuhasing = false
    end

    if curStep == 888 then
        ningsing = true
    end

    if curStep == 960 then
        ningsing = false
        setProperty('boyfriend.x', bfx)
        tagIn('yoimiya')
    end

    if curStep == 1008 then
        tankmansing = true
    end

    if curStep == 1022 then
        tagIn('tankman')
        tagIn('jimmy')
    end

    if curStep == 1024 then
        tankmansing = false
        playAnim('jimmy', 'left', true)
        cancelTimer('resumeTankmanIdle')
        tankmanIdleAllowed = false
        playAnim('tankman', 'ugh', true)
        jimmyIdleAllowed = false
        cameraShake('game', 0.1, 0.5)
        cameraShake('hud', 0.1, 0.5)
    end

    if curStep == 1028 then
        playAnim('jimmy', 'down', true)
        cameraShake('game', 0.1, 0.5)
        cameraShake('hud', 0.1, 0.5)
    end

    if curStep == 1031 then
        playAnim('jimmy', 'up', true)
        cameraShake('game', 0.1, 0.5)
        cameraShake('hud', 0.1, 0.5)
    end

    if curStep == 1035 then
        playAnim('jimmy', 'left', true)
        cameraShake('game', 0.1, 0.5)
        cameraShake('hud', 0.1, 0.5)
        tankmanIdleAllowed = true
    end

    if curStep == 1040 then
        tagOut('jimmy')
        jimmyIdleAllowed = true
    end

    if curStep == 1104 then
        tankmansing = true
        kazuhasing = true
    end

    if curStep == 1168 then
        tankmansing = false
        kazuhasing = false
        cassettesing = true
        ningsing = true
        xx = 270
    end

    if curStep == 1232 then
        cassettesing = false
        ningsing = false
    end

    if curStep == 1264 then
        tankmansing = true
        ningsing = true
        xx = 420
    end

    if curStep == 1296 then
        tankmansing = false
        ningsing = false
        cassettesing = true
    end

    if curStep == 1312 then
        kazuhasing = true
        xx = 270
    end

    if curStep == 1328 then
        cassettesing = false
        tankmansing = true
    end

    if curStep == 1359 then
        followchars = false
    end

    if curStep == 1360 then
        kazuhasing = false
    end

    if curStep == 1408 then
        ningsing = true
    end

    if curStep == 1472 then
        tankmansing = false
    end

    if curStep == 1488 then
        ningsing = false
    end

    if curStep == 1552 then
        cassettesing = true
        kazuhasing = true
    end

    if curStep == 1616 or curStep == 1620 or curStep == 1624 then
        goIn()
        tankmanIdleAllowed = false
        playAnim('tankman', 'laugh', true)
        ningIdleAllowed = false
        playAnim('ningguang', '1', true)
    end

    if curStep == 1628 then
        playAnim('tankman', 'idle', true)
        playAnim('ningguang', 'idle', true)
    end

    if curStep == 1632 then
        setProperty('defaultCamZoom', 0.6)
        doTweenX('dadTwen', 'dad', getProperty('dad.x') - (75*3), 0.1, 'cubeInOut')
        doTweenX('dad1Twen', 'tankman', getProperty('tankman.x') - (75*3), 0.1, 'cubeInOut')
        doTweenX('dad2Twen', 'cassette', getProperty('cassette.x') - (75*3), 0.1, 'cubeInOut')
        doTweenX('bfTwen', 'boyfriend', getProperty('boyfriend.x') + (75*3), 0.1, 'cubeInOut')
        doTweenX('bf1Twen', 'kazuha', getProperty('kazuha.x') + (75*3), 0.1, 'cubeInOut')
        doTweenX('bf2Twen', 'ningguang', getProperty('ningguang.x') + (75*3), 0.1, 'cubeInOut')
        playAnim('ningguang', '2', true)
        playAnim('tankman', 'huh', true)
    end

    if curStep == 1636 then
        playAnim('ningguang', '2', true)
        playAnim('tankman', 'good', true)
    end

    if curStep == 1640 then
        playAnim('ningguang', '1', true)
    end

    if curStep == 1648 then
        ningIdleAllowed = true
        tankmanIdleAllowed = true
        doTweenX("dadTweenX","dad", dadx, 2, "expoOut")
        doTweenY("dadTweenY","dad", dady, 2, "expoOut")
        doTweenX("bfTweenX","boyfriend", bfx, 2, "expoOut")
        doTweenY("bfTweenY","boyfriend", bfy, 2, "expoOut")
        doTweenX("cgTweenX","cassette", cgx, 2, "expoOut")
        doTweenY("cgTweenY","cassette", cgy, 2, "expoOut")
        doTweenX("kazuhaTweenX","kazuha", kazuhax, 2, "expoOut")
        doTweenY("kazuhaTweenY","kazuha", kazuhay, 2, "expoOut")
        doTweenX("ningTweenX","ningguang", ningx, 2, "expoOut")
        doTweenY("ningTweenY","ningguang", ningy, 2, "expoOut")
        doTweenX("tankmanTweenX","tankman", tankmanx, 2, "expoOut")
        doTweenY("tankmanTweenY","tankman", tankmany, 2, "expoOut")
    end
end

function tagOut(tag)
    if tag == 'ningguang' then
        doTweenY('byen', 'boyfriend', getProperty('boyfriend.y') + 700, 0.5, 'elasticInOut')
    end

    if tag == 'jimmy' then
        doTweenY('byej', 'jimmy', jimmyy + 600, 0.5, 'elasticInOut')
    end
end

function tagIn(tag)
    if tag == 'yoimiya' then
        doTweenY('hiy', 'boyfriend', bfy, 0.5, 'elasticInOut')
    end

    if tag == 'zardy' then
        doTweenY('hiz', 'dad', getProperty('dad.y') - 720, 0.5, 'elasticInOut')
    end

    if tag == 'kazuha' then
        doTweenY('hik', 'kazuha', kazuhay, 0.5, 'elasticInOut')
    end

    if tag == 'ningguang' then
        doTweenY('hin', 'ningguang', ningy, 0.5, 'elasticInOut')
    end

    if tag == 'cassette' then
        doTweenY('hic', 'cassette', cgy, 0.5, 'elasticInOut')
    end

    if tag == 'tankman' then
        doTweenY('hit', 'tankman', tankmany, 0.5, 'elasticInOut')
    end

    if tag == 'jimmy' then
        doTweenY('hij', 'jimmy', jimmyy, 0.5, 'elasticInOut')
    end
end

function goIn()
    setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.15)
    doTweenX('dadTwen', 'dad', getProperty('dad.x') + 75, 0.1, 'cubeInOut')
    doTweenX('dad1Twen', 'tankman', getProperty('tankman.x') + 75, 0.1, 'cubeInOut')
    doTweenX('dad2Twen', 'cassette', getProperty('cassette.x') + 75, 0.1, 'cubeInOut')
    doTweenX('bfTwen', 'boyfriend', getProperty('boyfriend.x') - 75, 0.1, 'cubeInOut')
    doTweenX('bf1Twen', 'kazuha', getProperty('kazuha.x') - 75, 0.1, 'cubeInOut')
    doTweenX('bf2Twen', 'ningguang', getProperty('ningguang.x') - 75, 0.1, 'cubeInOut')
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Fire note' then
        tagacterPlayAnim('boyfriend', 'shoot', true)
        playSound('yoimiyashoot', 1)
    end

    if noteType == 'Special Sing' then
        if ningsing then
            playAnim('ningguang', direction, true)
            ningIdleAllowed = false
            runTimer('resumeNingIdle', 0.5, 1)

            if isSustainNote == false then
                if direction == 0 then
                    doTweenX("ningTweenCrash", 'ningguang', (-1 * ningMaxX), 0.6, "expoIn")
                elseif direction == 1 then
                    doTweenY("ningTweenCrash", 'ningguang', ningMaxY, 0.6, "expoIn")
                elseif direction == 2 then
                    doTweenY("ningTweenCrash", 'ningguang', (-1 * ningMaxY), 0.6, "expoIn")
                elseif direction == 3 then
                    doTweenX("ningTweenCrash", 'ningguang', ningMaxX, 0.6, "expoIn")
                end
            end
        end

        if kazuhasing then
            playAnim('kazuha', direction, true)
            kazuhaIdleAllowed = false
            runTimer('resumeKazuhaIdle', 0.5, 1)

            if isSustainNote == false then
                if direction == 0 then
                    doTweenX("kazuhaTweenCrash", 'kazuha', (-1 * kazuhaMaxX), 0.6, "expoIn")
                elseif direction == 1 then
                    doTweenY("kazuhaTweenCrash", 'kazuha', kazuhaMaxY, 0.6, "expoIn")
                elseif direction == 2 then
                    doTweenY("kazuhaTweenCrash", 'kazuha', (-1 * kazuhaMaxY), 0.6, "expoIn")
                elseif direction == 3 then
                    doTweenX("kazuhaTweenCrash", 'kazuha', kazuhaMaxX, 0.6, "expoIn")
                end
            end
        end
    end

    if noteType == '' then
        if isSustainNote == false then
            if direction == 0 then
                doTweenX("bfTweenCrash", 'boyfriend', (-1 * bfMaxX), 0.6, "expoIn")
            elseif direction == 1 then
                doTweenY("bfTweenCrash", 'boyfriend', bfMaxY, 0.6, "expoIn")
            elseif direction == 2 then
                doTweenY("bfTweenCrash", 'boyfriend', (-1 * bfMaxY), 0.6, "expoIn")
            elseif direction == 3 then
                doTweenX("bfTweenCrash", 'boyfriend', bfMaxX, 0.6, "expoIn")
            end
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Special Sing' then
        if cassettesing then
            playAnim('cassette', direction, true)
            cassetteIdleAllowed = false
            runTimer('resumeCassetteIdle', 0.5, 1)

            if isSustainNote == false then
                if direction == 0 then
                    doTweenX("cgTweenCrash", 'cassette', (-1 * cgMaxX), 0.6, "expoIn")
                elseif direction == 1 then
                    doTweenY("cgTweenCrash", 'cassette', cgMaxY, 0.6, "expoIn")
                elseif direction == 2 then
                    doTweenY("cgTweenCrash", 'cassette', (-1 * cgMaxY), 0.6, "expoIn")
                elseif direction == 3 then
                    doTweenX("cgTweenCrash", 'cassette', cgMaxX, 0.6, "expoIn")
                end
            end
        end

        if tankmansing then
            playAnim('tankman', direction, true)
            tankmanIdleAllowed = false
            runTimer('resumeTankmanIdle', 0.5, 1)

            if isSustainNote == false then
                if direction == 0 then
                    doTweenX("tankmanTweenCrash", 'tankman', (-1 * tankmanMaxX), 0.6, "expoIn")
                elseif direction == 1 then
                    doTweenY("tankmanTweenCrash", 'tankman', tankmanMaxY, 0.6, "expoIn")
                elseif direction == 2 then
                    doTweenY("tankmanTweenCrash", 'tankman', (-1 * tankmanMaxY), 0.6, "expoIn")
                elseif direction == 3 then
                    doTweenX("tankmanTweenCrash", 'tankman', tankmanMaxX, 0.6, "expoIn")
                end
            end
        end
    end

    if noteType == '' then
        if isSustainNote == false then
            if direction == 0 then
                doTweenX("dadTweenCrash", 'dad', (-1 * dadMaxX), 0.6, "expoIn")
            elseif direction == 1 then
                doTweenY("dadTweenCrash", 'dad', dadMaxY, 0.6, "expoIn")
            elseif direction == 2 then
                doTweenY("dadTweenCrash", 'dad', (-1 * dadMaxY), 0.6, "expoIn")
            elseif direction == 3 then
                doTweenX("dadTweenCrash", 'dad', dadMaxX, 0.6, "expoIn")
            end
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeNingIdle' then
        ningIdleAllowed = true
    end

    if tag == 'resumeKazuhaIdle' then
        kazuhaIdleAllowed = true
    end

    if tag == 'resumeCassetteIdle' then
        cassetteIdleAllowed = true
    end

    if tag == 'resumeTankmanIdle' then
        tankmanIdleAllowed = true
    end
end