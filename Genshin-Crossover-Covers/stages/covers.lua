
local u = false;
local r = 0;
local i =0
local shot = false;
local agent = 1
local health = 0;
local xx = 1050.95;
local yy = 1170;
local xx2 = 1802.9;
local yy2 = 1025;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
    makeLuaSprite('bg', 'h24/covers/bg', -960, -250)
    scaleObject('bg', 1.4, 1.2)
    updateHitbox('bg')
    setScrollFactor('bg', 0.1, 0.1)
    addLuaSprite('bg', false)

    makeLuaSprite('sun', 'h24/covers/sun', -1050, -360)
    scaleObject('sun', 1.3, 1.3)
    updateHitbox('sun')
    setScrollFactor('sun', 0.1, 0.1)
    addLuaSprite('sun', false)

    makeLuaSprite('clouds', 'h24/covers/clouds', -670, -220)
    setScrollFactor('clouds', 0.1, 0.1)
    addLuaSprite('clouds', false)

    makeLuaSprite('castle', 'h24/covers/castle', -800, -250)
    scaleObject('castle', 1.2, 1.2)
    updateHitbox('castle')
    setScrollFactor('castle', 0.3, 0.3)
    addLuaSprite('castle', false)

    makeLuaSprite('buildings', 'h24/covers/buildings', -700, -200)
    scaleObject('buildings', 1.2, 1.2)
    updateHitbox('buildings')
    setScrollFactor('buildings', 0.5, 0.5)
    addLuaSprite('buildings', false)

    makeLuaSprite('hills', 'h24/covers/hills', -600, -150)
    scaleObject('hills', 1.3, 1.3)
    updateHitbox('hills')
    setScrollFactor('hills', 1, 1)
    addLuaSprite('hills', false)

    makeLuaSprite('ground', 'h24/covers/ground', -260, -140)
    scaleObject('ground', 1.2, 1.2)
    updateHitbox('ground')
    setScrollFactor('ground', 1, 1)
    addLuaSprite('ground', false)

    makeLuaSprite('light', 'h24/covers/light', -260, -140)
    scaleObject('light', 1.2, 1.2)
    updateHitbox('light')
    setScrollFactor('light', 1.1, 1.1)
    setBlendMode('light', 'add')
    addLuaSprite('light', false)

    makeLuaSprite('cables', 'h24/covers/cables', -260, -140)
    scaleObject('cables', 1.2, 1)
    updateHitbox('cables')
    setScrollFactor('cables', 1.2, 1.2)
    addLuaSprite('cables', true)

    setProperty('defaultCamZoom',0.76)
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

	daYvalue = 
	
	setProperty('dad.y', (math.sin(i/20)*75) + 400)
	yy = (math.sin(i/20)*75) + 870

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
     if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.5)
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
      
            setProperty('defaultCamZoom',0.76)
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
