function onCreate()
    makeLuaSprite('Black','indie/sans/black',0,0)
    setObjectCamera('Black','other')
    scaleObject('Black', 60, 60)
    updateHitbox('Black')
    addLuaSprite('Black',true)
    setProperty('Black.alpha', 0)

    setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
    cameraSetTarget('boyfriend')
end

local xx = 620;
local yy = 420;
local xx2 = 1020;
local yy2 = 420;
local ofs = 30;
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

    if curStep > 704 then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/80)
        doTweenY(dadTweenY, 'dad', -300 + 50*math.sin((currentBeat*1)*math.pi),0.5)
    end

    if curStep >= 704 and curStep <= 719 then
        cameraSetTarget('dad')
    end
end

function onStepHit()
    if curStep == 684 then
        doTweenAlpha('hi', 'Black', 1, 1, 'linear')
    end

    if curStep == 698 then
        setProperty('defaultCamZoom',0.8)
    end
      
    if curStep == 700 then
        doTweenX('Curtain1','Curtain2',1250,1)
        doTweenX('Curtain2','Curtain1',-950,1)
    end

    if curStep == 704 then
        triggerEvent('Change Character','dad','venti-flying')
        removeLuaSprite('Black',true)
        yy = 170
    end
end