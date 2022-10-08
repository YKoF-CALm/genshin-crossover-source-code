local InstaKillSammy = false
local DodgeSammy = 0;
local event = false

function onCreate()
    makeAnimatedLuaSprite('Axe', 'characters/SammyRemastered',800,900);
	addAnimationByPrefix('Axe','Attack','Axe attack instance 1',24,false);
    scaleObject('Axe',1.5,1.5)
    updateHitbox('Axe')

    makeAnimatedLuaSprite('Dodge', 'indie/IC_Buttons', 30, 350)
    addAnimationByPrefix('Dodge', 'idle', 'Dodge instance', 24, false)
    addAnimationByPrefix('Dodge', 'click', 'Dodge click instance', 24, false)
    setObjectCamera('Dodge', 'hud')
    scaleObject('Dodge', 0.4, 0.4)
    updateHitbox('Dodge')
    addLuaSprite('Dodge', false)
    setProperty('Dodge.alpha', 0)
end

function onEvent(name,value1,value2)
    if name == "SammyAttack" then
        characterPlayAnim('dad','End1', true)
        setProperty('dad.specialAnim', true);
        runTimer('AxeAttackTime',0.6, 1)
        playSound('bendy/Sammy/sammyAxeThrow')
        event = true
        DodgeSammy = 3
        if value2 ~= '' then
            InstaKillSammy = true
        else
            InstaKillSammy = false
        end
    end
end



function onUpdate(elapsed)
    if DodgeSammy == 3 and (keyJustPressed('space') or botPlay) then
        DodgeSammy = 2;
        objectPlayAnimation('Dodge', 'click', true)
        runTimer('unclick', 0.2, 1)
    end
    if DodgeSammy == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
    end
    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'dodge' and DodgeSammy == 1 or getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' and DodgeSammy == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        DodgeSammy = 0
    end

    if not event then
        objectPlayAnimation('Dodge', 'idle', true)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)  
    if tag == 'AxeAttackTime' then
        addLuaSprite('Axe',true)
        objectPlayAnimation('Axe','Attack',true)
        runTimer('AxeGroundSound',0.3)
        

        if DodgeSammy == 2 then
            characterPlayAnim('boyfriend','dodge',true)
            setProperty('boyfriend.specialAnim',true);
            DodgeSammy = 1
        end

        if DodgeSammy == 3 then
            characterPlayAnim('boyfriend','hurt',false)
            setProperty('boyfriend.specialAnim',true);
            if (getProperty('health') - 1) > -0.01 and not InstaKillSammy then
                setProperty('health',getProperty('health') - 1)
            
            elseif (getProperty('health') - 1) <= -0.01 or InstaKillSammy then
                runTimer('GameOver',0.35)
            end
            event = false
        end
    end
    if tag == 'GameOver' then
        setProperty('health', -500);
    end
    if tag == 'AxeGroundSound' then
        playSound('bendy/Sammy/sammyAxeGround')
    end
    if tag == 'unclick' then
        event = false
    end
end

function onStepHit()
    if curStep == 1266 then
        setProperty('Dodge.alpha', 1)
    end
end