function onCreate()
    precacheImage('secondicons/pico-normal')
    precacheImage('secondicons/pico-danger')
    precacheImage('secondicons/tactie-normal')
    precacheImage('secondicons/tactie-danger')
    precacheSound('AWP')
    precacheSound('hankshoot')
    
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)
    setProperty('dad.y', getProperty('dad.y') + 80)
    setProperty('dad.x', getProperty('dad.x') - 50)
    setProperty('gf.y', getProperty('gf.y') - 20)
    setProperty('gf.x', getProperty('gf.x') - 50)

    makeLuaSprite('flash', '', -500, 700);
	makeGraphic('flash',10,10,'000000')
    scaleObject('flash', 3000, 3000)
    updateHitbox('flash')
	addLuaSprite('flash', false);
	setProperty('flash.alpha', 0)
	setObjectOrder('flash', getObjectOrder('gfGroup') - 1)

    setProperty('foreground.y', getProperty('foreground.y') + 200)

    setProperty('camGame.zoom', 1.2)
    setProperty('defaultCamZoom', 1.2)
end

function onCreatePost()
    makeLuaSprite('picoIcon', 'secondicons/pico-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('picoIcon', 'hud')
    addLuaSprite('picoIcon', true)
    setObjectOrder('picoIcon', getObjectOrder('iconP2') + 1)
    setProperty('picoIcon.flipX', false)
    setProperty('picoIcon.visible', true)

    makeLuaSprite('picoDangerIcon', 'secondicons/pico-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('picoDangerIcon', 'hud')
    addLuaSprite('picoDangerIcon', true)
    setObjectOrder('picoDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('picoDangerIcon.flipX', false)
    setProperty('picoDangerIcon.visible', false)

    makeLuaSprite('tactieIcon', 'secondicons/tactie-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('tactieIcon', 'hud')
    addLuaSprite('tactieIcon', true)
    setObjectOrder('tactieIcon', getObjectOrder('picoIcon') - 1)
    setProperty('tactieIcon.flipX', false)
    setProperty('tactieIcon.visible', true)

    makeLuaSprite('tactieDangerIcon', 'secondicons/tactie-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('tactieDangerIcon', 'hud')
    addLuaSprite('tactieDangerIcon', true)
    setObjectOrder('tactieDangerIcon', getObjectOrder('picoDangerIcon') - 1)
    setProperty('tactieDangerIcon.flipX', false)
    setProperty('tactieDangerIcon.visible', false)

    setProperty('iconP2.visible', false)
    setObjectOrder('iconP1', getObjectOrder('picoDangerIcon') + 1)
end

local xx = 400;
local yy = 1300;
local xx2 = 1050;
local yy2 = 1170;
local xx3 = 500
local yy3 = 1300
local ofs = 20;
local followchars = true;

function onUpdate(elapsed)
    if followchars == true then
        if mustHitSection == false then
            if gfSection then
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
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

    if getProperty('health') > 1.6 then
        setProperty('picoIcon.visible', false)
        setProperty('picoDangerIcon.visible', true)
    else
        setProperty('picoIcon.visible', true)
        setProperty('picoDangerIcon.visible', false)
    end

    if getProperty('health') > 1.6 then
        setProperty('tactieIcon.visible', false)
        setProperty('tactieDangerIcon.visible', true)
    else
        setProperty('tactieIcon.visible', true)
        setProperty('tactieDangerIcon.visible', false)
    end
end

function onUpdatePost(elapsed)
    setProperty('picoIcon.x', getProperty('iconP1.x') + -139)
    setProperty('picoIcon.angle', getProperty('iconP2.angle'))
    setProperty('picoIcon.y', getProperty('iconP1.y') - 10)
    setProperty('picoIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('picoIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)

    setProperty('picoDangerIcon.x', getProperty('iconP1.x') + -139)
    setProperty('picoDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('picoDangerIcon.y', getProperty('iconP1.y') - 10)
    setProperty('picoDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('picoDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)

    setProperty('tactieIcon.x', getProperty('iconP1.x') + -79)
    setProperty('tactieIcon.angle', getProperty('iconP2.angle'))
    setProperty('tactieIcon.y', getProperty('iconP1.y') + 10)
    setProperty('tactieIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('tactieIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)

    setProperty('tactieDangerIcon.x', getProperty('iconP1.x') + -79)
    setProperty('tactieDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('tactieDangerIcon.y', getProperty('iconP1.y') + 10)
    setProperty('tactieDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.3)
    setProperty('tactieDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.3)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note' then
        playSound('AWP', 0.6);
		characterPlayAnim('dad', 'shootRIGHTalt', false);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
    end

    if noteType == 'Bullet_Note2' then
        playSound('hankshoot', 1);
		characterPlayAnim('gf', 'ubershoot', false);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('gf.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
    end

    if noteType == 'Bullet_NoteR' then
        playSound('ganyushoot', 5)
        characterPlayAnim('boyfriend', 'attack', false)
        characterPlayAnim('dad', 'dodge', false)
        characterPlayAnim('gf', 'dodge', false)
        runTimer('gfidle', 0.6, 1)
        setProperty('boyfriend.specialAnim', true);
		setProperty('gf.specialAnim', true);
        setProperty('dad.specialAnim', true);
        setProperty('health', getProperty('health') + 0.05)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note' then
		setProperty('health', -1);
		playSound('AWP', 0.6);
    end

    if noteType == 'Bullet_Note2' then
        setProperty('health', -1);
		playSound('hankshoot', 1);
    end
end

local healthdrain = false

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Duet Note' then
        characterPlayAnim('gf', getProperty('singAnimations')[math.abs(direction)+1], true)
		setProperty('gf.holdTimer', 0)
    end

    if healthdrain and getProperty('health') > 0.03 then
        setProperty('health', getProperty('health') - 0.023)
    end
end

function onStepHit()
    if curStep == 32 or curStep == 552 or curStep == 928 or curStep == 1152 or curStep == 1552 or curStep == 1952 then
		setProperty('defaultCamZoom', 0.9)
		doTweenAlpha('twen', 'flash', 0, 0.2, 'linear')
	end

    if curStep == 272 or curStep == 800 then
		setProperty('defaultCamZoom', 1.1)
	end

    if curStep == 288 or curStep == 1312 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 544 or curStep == 2448 then
		setProperty('defaultCamZoom', 1.2)
	end

	if curStep == 1040 then
		setProperty('defaultCamZoom', 1.2)
        doTweenAlpha('twen', 'flash', 0.6, 0.7, 'linear')
        healthdrain = true
	end

    if curStep == 1952 then
        healthdrain = false
    end

    if curStep == 1568 or curStep == 1632 or curStep == 1696 or curStep == 1760 then
		setProperty('defaultCamZoom', 0.65)
	end

	if curStep >= 1568 and curStep < 1824 and curStep % 16 == 0 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.15)
	end

	if curStep == 2464 then
		setProperty('defaultCamZoom', 0.8)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'gfidle' then
        characterPlayAnim('gf', 'idle', true)
    end
end