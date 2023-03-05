
local u = false;
local r = 0;
local i =0
local shot = false;
local agent = 1
local health = 0;
local xx = -700;
local yy = -690;
local xx2 = 100;
local yy2 = 0;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
    makeLuaSprite('exSky', 'h24/expurgated/sky', -1300, -650)
    setScrollFactor('exSky', 0.15, 0.15)
    scaleObject('exSky', 2, 2)
    updateHitbox('exSky')
    addLuaSprite('exSky', false)

    makeLuaSprite('exRock', 'h24/expurgated/rock2', -2400, -1300)
    setScrollFactor('exRock', 0.7, 0.7)
    scaleObject('exRock', 2.5, 2.5)
    updateHitbox('exRock')
    addLuaSprite('exRock', false)

    makeLuaSprite('exGround', 'h24/expurgated/ground', -2800, -1400)
    setScrollFactor('exGround', 1, 1)
    scaleObject('exGround', 2.5, 2.5)
    updateHitbox('exGround')
    addLuaSprite('exGround', false)

    makeLuaSprite('exOverlay', 'h24/expurgated/gradoverlay', -1440, -650)
    setScrollFactor('exOverlay', 0, 0)
    scaleObject('exOverlay', 2.5, 2.5)
    updateHitbox('exOverlay')
    setBlendMode('exOverlay', 'add')
    addLuaSprite('exOverlay', true)

    makeLuaSprite('exFront', 'h24/expurgated/signfront', -2950, -1400)
    setScrollFactor('exFront', 1.15, 1.15)
    scaleObject('exFront', 2.7, 2.7)
    updateHitbox('exFront')
    addLuaSprite('exFront', true)

    setProperty('defaultCamZoom',0.45)
    makeLuaSprite('bartop','',0,-30)
    makeGraphic('bartop',1280,100,'000000')
    addLuaSprite('bartop',true)
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,650)
    makeGraphic('barbot',1280,100,'000000')
    addLuaSprite('barbot',true)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')
end

function onUpdate(elapsed)

	daElapsed = elapsed * 30
	i = i + daElapsed
	
	setProperty('dad.y', (math.sin(i/20)*75) - 700)
	yy = (math.sin(i/20)*75) - 350

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
     if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.32)
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
      
            setProperty('defaultCamZoom',0.45)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

function onStepHit()
    Particle()
end

f = 1
  
function Particle()
    songPos = getSongPosition()
    currentBeat = (songPos/500)
    f = f + 1
    sus = math.random(2, 1500)
    sus2 = math.random(2, 1500)
    sus3 = math.random(2, 1500)
    sus4 = math.random(2, 1500)
    makeLuaSprite('part' .. f, 'h24/expurgated/particle', math.random(-200, 1500), 700)
    scaleObject('part' .. f, math.random(7, 10)*0.1, math.random(7, 10)*0.1);
    doTweenY(sus, 'part' .. f, -500*math.tan((currentBeat+1*0.1)*math.pi), 6, 'linear')
    doTweenX(sus2, 'part' .. f, -500*math.sin((currentBeat+1*0.1)*math.pi), 6, 'linear')
    addLuaSprite('part' .. f, false)
    setObjectOrder('part' .. f, getObjectOrder('exGround') - 1)
    doTweenX(sus3, 'part' .. f .. '.scale', 0, 6, 'linear')
    doTweenY(sus4, 'part' .. f .. '.scale', 0, 6, 'linear')
  
    if f >= 50 then
        f = 1
    end
end