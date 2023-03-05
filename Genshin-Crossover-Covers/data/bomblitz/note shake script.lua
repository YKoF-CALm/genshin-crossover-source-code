local followchars = true
local xx = 200
local yy = 350
local xx2 = 700
local yy2 = 350
local ofs = 30

function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos / 1000)*(bpm/60)

    if curBeat >= 320 and curBeat < 352 then
        doTweenAngle('sway', 'camHUD', 5 * math.sin(currentBeat / 2), 0.1, 'linear')
    end

    if curBeat >= 352 and curBeat < 384 then
        doTweenAngle('swayfast', 'camHUD', 6 * math.sin(currentBeat * 2), 0.1, 'linear')
    end

    if curBeat >= 512 and curBeat < 576 then
        for i=0,3 do
            noteTweenY(i..'4tweenyo', i, _G['defaultOpponentStrumY'..i] + 25 * math.cos((currentBeat + i*5) * math.pi), 0.1, 'linear')
            noteTweenY(i..'4tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 25 * math.cos((currentBeat + (i+4)*5) * math.pi), 0.1, 'linear')
        end
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
            if getProperty('dad.animation.curAnim.name') == 'idle' or getProperty('dad.animation.curAnim.name') == 'danceLeft' then
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
    end
end

function onBeatHit()
    if curBeat == 384 then
        doTweenAngle('back', 'camHUD', 0, 0.2, 'linear')
    end

    if curBeat == 576 then
        for i=0,3 do
            cancelTween(i..'4tweenyo')
            cancelTween(i..'4tweenyp')
            noteTweenY(i..'opdef', i, _G['defaultOpponentStrumY'..i], 0.2, 'linear')
            noteTweenY(i..'pldef', i+4, _G['defaultPlayerStrumY'..i], 0.2, 'linear')
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if (curBeat >= 128 and curBeat < 192) or (curBeat >= 640 and curBeat < 704) then
        triggerEvent('Add Camera Zoom',0.01,0.02)
    end
end