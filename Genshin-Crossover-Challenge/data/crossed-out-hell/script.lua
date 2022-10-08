function onCreate()
    precacheImage('secondicons/ganyu-indie-mad-normal')
    precacheImage('secondicons/ganyu-indie-mad-danger')
    precacheImage('secondicons/xiao-indie-normal')
    precacheImage('secondicons/xiao-indie-danger')
    precacheImage('secondicons/ganyu-happy-normal')
    precacheImage('secondicons/ganyu-happy-danger')
    precacheImage('secondicons/nmganyu-normal')
    precacheImage('secondicons/nmganyu-danger')
    precacheImage('secondicons/nmxiao-normal')
    precacheImage('secondicons/nmxiao-danger')
    precacheImage('secondicons/nmzhongli-normal')
    precacheImage('secondicons/nmzhongli-danger')

    setProperty('dad.y', getProperty('dad.y') + 10)

    if not lowQuality then
        makeAnimatedLuaSprite('SansStage3_Papyrus','characters/Yanfei-Dance', 1400, 210)
	    addAnimationByIndices('SansStage3_Papyrus','left','yanfei finger snapping', '0, 1, 2, 3, 4, 5, 6, 7, 8', 24)
        addAnimationByIndices('SansStage3_Papyrus','right','yanfei finger snapping', '9, 10, 11, 12, 13, 14, 15, 16, 17', 24)
        setProperty('SansStage3_Papyrus.flipX', true)
	
        makeAnimatedLuaSprite('dance', 'characters/Ganyu-Dancin', 500, 400)
        addAnimationByIndices('dance', 'left', 'ganyu dancin', '0, 1, 2, 3, 4, 5, 6, 7, 8', 24)
        addAnimationByIndices('dance', 'right', 'ganyu dancin', '9, 10, 11, 12, 13, 14, 15, 16, 17', 24)

        makeAnimatedLuaSprite('SansStage3_Gf','characters/gfChristmas', 800, 150)
		addAnimationByIndices('SansStage3_Gf','left','GF Dancing Beat','30, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14', 24)
        addAnimationByIndices('SansStage3_Gf','right','GF Dancing Beat','15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29', 24)

        makeAnimatedLuaSprite('BendyStage1_Sammy','crossed-out/BendyStage1_Sammy', 1350, 10)
		addAnimationByPrefix('BendyStage1_Sammy','Sam instance ','Sam instance ',24, false)
		setProperty('BendyStage1_Sammy.flipX', true);
		scaleObject('BendyStage1_Sammy', 1.3, 1.3);

        makeAnimatedLuaSprite('BendyStage_Striker','crossed-out/BendyStage_Striker', 150, 560)
		addAnimationByPrefix('BendyStage_Striker','strrr instance ','strrr instance ',24, false)
		scaleObject('BendyStage_Striker', 1.5, 1.5);
    end

    makeAnimatedLuaSprite('Final_Bendy','characters/Zhongli-Indie-NIGHTMARE', -400, -180)
	addAnimationByPrefix('Final_Bendy','IdleBedy','idle zhongli',24, false)

    makeAnimatedLuaSprite('Final_Cuphead','characters/Ganyu-Indie-NIGHTMARE', -370, 130)
	addAnimationByPrefix('Final_Cuphead','IdleCuphead','idle ganyu',24, false)

    makeAnimatedLuaSprite('Final_Cuphead_front','characters/Ganyu-Indie-NIGHTMARE', -370, 130)
	addAnimationByPrefix('Final_Cuphead_front','IdleCuphead','idle ganyu',24, false)
end

function onCreatePost()
    makeLuaSprite('ganyuIcon', 'secondicons/ganyu-indie-mad-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('ganyuIcon', 'hud')
    addLuaSprite('ganyuIcon', true)
    setObjectOrder('ganyuIcon', getObjectOrder('iconP2') + 1)
    setProperty('ganyuIcon.flipX', false)
    setProperty('ganyuIcon.visible', false)

    makeLuaSprite('ganyuDangerIcon', 'secondicons/ganyu-indie-mad-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('ganyuDangerIcon', 'hud')
    addLuaSprite('ganyuDangerIcon', true)
    setObjectOrder('ganyuDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('ganyuDangerIcon.flipX', false)
    setProperty('ganyuDangerIcon.visible', false)

    makeLuaSprite('ganyuHappyIcon', 'secondicons/ganyu-happy-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('ganyuHappyIcon', 'hud')
    addLuaSprite('ganyuHappyIcon', true)
    setObjectOrder('ganyuHappyIcon', getObjectOrder('iconP2') + 1)
    setProperty('ganyuHappyIcon.flipX', false)
    setProperty('ganyuHappyIcon.visible', false)

    makeLuaSprite('ganyuHappyDangerIcon', 'secondicons/ganyu-happy-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('ganyuHappyDangerIcon', 'hud')
    addLuaSprite('ganyuHappyDangerIcon', true)
    setObjectOrder('ganyuHappyDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('ganyuHappyDangerIcon.flipX', false)
    setProperty('ganyuHappyDangerIcon.visible', false)

    makeLuaSprite('xiaoIcon', 'secondicons/xiao-indie-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xiaoIcon', 'hud')
    addLuaSprite('xiaoIcon', true)
    setObjectOrder('xiaoIcon', getObjectOrder('iconP2') + 1)
    setProperty('xiaoIcon.flipX', false)
    setProperty('xiaoIcon.visible', false)

    makeLuaSprite('xiaoDangerIcon', 'secondicons/xiao-indie-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xiaoDangerIcon', 'hud')
    addLuaSprite('xiaoDangerIcon', true)
    setObjectOrder('xiaoDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('xiaoDangerIcon.flipX', false)
    setProperty('xiaoDangerIcon.visible', false)

    makeLuaSprite('xiaoNMIcon', 'secondicons/nmxiao-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xiaoNMIcon', 'hud')
    addLuaSprite('xiaoNMIcon', true)
    setObjectOrder('xiaoNMIcon', getObjectOrder('iconP2') + 1)
    setProperty('xiaoNMIcon.flipX', false)
    setProperty('xiaoNMIcon.visible', false)

    makeLuaSprite('xiaoNMDangerIcon', 'secondicons/nmxiao-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xiaoNMDangerIcon', 'hud')
    addLuaSprite('xiaoNMDangerIcon', true)
    setObjectOrder('xiaoNMDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('xiaoNMDangerIcon.flipX', false)
    setProperty('xiaoNMDangerIcon.visible', false)

    makeLuaSprite('zhongliIcon', 'secondicons/nmzhongli-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('zhongliIcon', 'hud')
    addLuaSprite('zhongliIcon', true)
    setObjectOrder('zhongliIcon', getObjectOrder('xiaoNMIcon') + 1)
    setProperty('zhongliIcon.flipX', false)
    setProperty('zhongliIcon.visible', false)

    makeLuaSprite('zhongliDangerIcon', 'secondicons/nmzhongli-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('zhongliDangerIcon', 'hud')
    addLuaSprite('zhongliDangerIcon', true)
    setObjectOrder('zhongliDangerIcon', getObjectOrder('xiaoNMDangerIcon') + 1)
    setProperty('zhongliDangerIcon.flipX', false)
    setProperty('zhongliDangerIcon.visible', false)

    makeLuaSprite('ganyuNMIcon', 'secondicons/nmganyu-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('ganyuNMIcon', 'hud')
    addLuaSprite('ganyuNMIcon', true)
    setObjectOrder('ganyuNMIcon', getObjectOrder('zhongliIcon') + 1)
    setProperty('ganyuNMIcon.flipX', false)
    setProperty('ganyuNMIcon.visible', false)

    makeLuaSprite('ganyuNMDangerIcon', 'secondicons/nmganyu-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('ganyuNMDangerIcon', 'hud')
    addLuaSprite('ganyuNMDangerIcon', true)
    setObjectOrder('ganyuNMDangerIcon', getObjectOrder('zhongliDangerIcon') + 1)
    setProperty('ganyuNMDangerIcon.flipX', false)
    setProperty('ganyuNMDangerIcon.visible', false)
end

local xx = 500
local yy = 450
local xx2 = 900
local yy2 = 500
local followchar = true

function onUpdate(elapsed)
    if followchar then
        if not mustHitSection then
            if dadName == 'ganyu-indie' or dadName == 'ganyu-indie-angry' or dadName == 'ganyu-indie-mad-dark' or dadName == 'xiao-indie-sans' or dadName == 'xiao-indie-sans-sit' or dadName == 'xiao-indie' or dadName == 'zhongli-indie-bendy' or dadName == 'zhongli-indie-fly' or dadName == 'zhongli-indie-fly-dark' then
                triggerEvent('Camera Follow Pos', xx, yy)
            end
        else
            if boyfriendName == 'bf_cuphead_1' or boyfriendName == 'bf_cuphead_2' or boyfriendName == 'bf_sans_1' or boyfriendName == 'bf_sans_3' or boyfriendName == 'bf_bendy_1' or boyfriendName == 'bf_bendy_2' or boyfriendName == 'bf_bendy_3' then
                triggerEvent('Camera Follow Pos', xx2, yy2)
            end
        end
    end

    if curStep >= 1784 and curStep <= 2047 then
        setProperty('iconP2.visible', false)
        setProperty('ganyuHappyIcon.visible', false)
        setProperty('ganyuHappyDangerIcon.visible', false)
        if getProperty('health') > 1.6 then
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

    if curStep >= 2048 and curStep <= 2303 then
        setProperty('iconP2.visible', false)
        if getProperty('health') > 1.6 then
            setProperty('ganyuHappyIcon.visible', false)
            setProperty('ganyuHappyDangerIcon.visible', true)
            setProperty('xiaoIcon.visible', false)
            setProperty('xiaoDangerIcon.visible', true)
        else
            setProperty('ganyuHappyIcon.visible', true)
            setProperty('ganyuHappyDangerIcon.visible', false)
            setProperty('xiaoIcon.visible', true)
            setProperty('xiaoDangerIcon.visible', false)
        end
    end

    if curStep >= 3072 then
        setProperty('iconP2.visible', false)
        if getProperty('health') > 1.6 then
            setProperty('ganyuNMIcon.visible', false)
            setProperty('ganyuNMDangerIcon.visible', true)
            setProperty('xiaoNMIcon.visible', false)
            setProperty('xiaoNMDangerIcon.visible', true)
            setProperty('zhongliIcon.visible', false)
            setProperty('zhongliDangerIcon.visible', true)
        else
            setProperty('ganyuNMIcon.visible', true)
            setProperty('ganyuNMDangerIcon.visible', false)
            setProperty('xiaoNMIcon.visible', true)
            setProperty('xiaoNMDangerIcon.visible', false)
            setProperty('zhongliIcon.visible', true)
            setProperty('zhongliDangerIcon.visible', false)
        end
    end
end

function onUpdatePost(elapsed)
    setProperty('ganyuIcon.x', getProperty('iconP2.x') - 20)
    setProperty('ganyuIcon.angle', getProperty('iconP2.angle'))
    setProperty('ganyuIcon.y', getProperty('iconP2.y') - 30)
    setProperty('ganyuIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('ganyuIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)

    setProperty('ganyuDangerIcon.x', getProperty('iconP2.x') - 20)
    setProperty('ganyuDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('ganyuDangerIcon.y', getProperty('iconP2.y') - 30)
    setProperty('ganyuDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('ganyuDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)

    setProperty('xiaoIcon.x', getProperty('iconP2.x') + 30)
    setProperty('xiaoIcon.angle', getProperty('iconP2.angle'))
    setProperty('xiaoIcon.y', getProperty('iconP2.y') + 20)
    setProperty('xiaoIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('xiaoIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)

    setProperty('xiaoDangerIcon.x', getProperty('iconP2.x') + 30)
    setProperty('xiaoDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('xiaoDangerIcon.y', getProperty('iconP2.y') + 20)
    setProperty('xiaoDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('xiaoDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)

    setProperty('ganyuHappyIcon.x', getProperty('iconP2.x') - 20)
    setProperty('ganyuHappyIcon.angle', getProperty('iconP2.angle'))
    setProperty('ganyuHappyIcon.y', getProperty('iconP2.y') - 30)
    setProperty('ganyuHappyIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('ganyuHappyIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)

    setProperty('ganyuHappyDangerIcon.x', getProperty('iconP2.x') - 20)
    setProperty('ganyuHappyDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('ganyuHappyDangerIcon.y', getProperty('iconP2.y') - 30)
    setProperty('ganyuHappyDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('ganyuHappyDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)

    setProperty('ganyuNMIcon.x', getProperty('iconP2.x') - 30)
    setProperty('ganyuNMIcon.angle', getProperty('iconP2.angle'))
    setProperty('ganyuNMIcon.y', getProperty('iconP2.y') + 30)
    setProperty('ganyuNMIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('ganyuNMIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('ganyuNMDangerIcon.x', getProperty('iconP2.x') - 30)
    setProperty('ganyuNMDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('ganyuNMDangerIcon.y', getProperty('iconP2.y') + 30)
    setProperty('ganyuNMDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('ganyuNMDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('xiaoNMIcon.x', getProperty('iconP2.x') + 20)
    setProperty('xiaoNMIcon.angle', getProperty('iconP2.angle'))
    setProperty('xiaoNMIcon.y', getProperty('iconP2.y') + 20)
    setProperty('xiaoNMIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('xiaoNMIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('xiaoNMDangerIcon.x', getProperty('iconP2.x') + 20)
    setProperty('xiaoNMDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('xiaoNMDangerIcon.y', getProperty('iconP2.y') + 20)
    setProperty('xiaoNMDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('xiaoNMDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('zhongliIcon.x', getProperty('iconP2.x') - 10)
    setProperty('zhongliIcon.angle', getProperty('iconP2.angle'))
    setProperty('zhongliIcon.y', getProperty('iconP2.y') - 20)
    setProperty('zhongliIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('zhongliIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('zhongliDangerIcon.x', getProperty('iconP2.x') - 10)
    setProperty('zhongliDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('zhongliDangerIcon.y', getProperty('iconP2.y') - 20)
    setProperty('zhongliDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('zhongliDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('dance', 'left', true)
        objectPlayAnimation('SansStage3_Papyrus','left', true)
        objectPlayAnimation('Final_Cuphead', 'IdleCuphead', true)
        objectPlayAnimation('Final_Cuphead_front', 'IdleCuphead', true)
        objectPlayAnimation('Final_Bendy', 'IdleBedy', true)
        objectPlayAnimation('SansStage3_Gf','left', true)
        objectPlayAnimation('BendyStage1_Sammy','Sam instance ', true)
        objectPlayAnimation('BendyStage_Striker','strrr instance ', true)
    end

    if curBeat % 2 == 1 then
        objectPlayAnimation('dance', 'right', true)
        objectPlayAnimation('SansStage3_Gf','right', true)
        objectPlayAnimation('SansStage3_Papyrus','right', true)
    end

    if curBeat == 64 then
        setProperty('dad.y', getProperty('dad.y') + 10)
    end

    if curBeat == 256 or curBeat == 320 then
        setProperty('dad.y', getProperty('dad.y') - 5)
    end

    if curBeat == 380 or curBeat == 512 or curBeat == 768 then
        followchar = false
        triggerEvent('Camera Follow Pos', '', '')
    end

    if curBeat == 448 then
        followchar = true
    end

    if curBeat == 500 then
        characterPlayAnim('gf', 'dance start', true)
        setProperty('gf.specialAnim', true)
    end

    if curBeat == 512 then
        if not lowQuality then
            setProperty('gf.visible', false)
            addLuaSprite('dance', false)
            setObjectOrder('dance', getObjectOrder('gfGroup') + 1)
            setProperty('dance.x', getProperty('gf.x'))
            setProperty('dance.y', getProperty('gf.y'))
        end
        removeLuaSprite('ganyuIcon', true)
        removeLuaSprite('ganyuDangerIcon', true)
    end

    if curBeat == 576 then
        followchar = true
        setProperty('dad.x', getProperty('dad.x') - 50)
        setProperty('dad.y', getProperty('dad.y') - 10)
        setProperty('iconP2.visible', true)
        removeLuaSprite('xiaoIcon', true)
        removeLuaSprite('xiaoDangerIcon', true)
        removeLuaSprite('ganyuHappyIcon', true)
        removeLuaSprite('ganyuHappyDangerIcon', true)
    end

    if curBeat == 640 then
        yy = 250
        yy2 = 400
    end
end

function onStepHit()
    if curStep == 503 then
        characterPlayAnim('dad', 'glazeover', true)
        setProperty('dad.specialAnim', true)
    end

    if curStep == 510 then
        triggerEvent('Change Character', '1', 'ganyu-indie-mad-dark')
    end
end