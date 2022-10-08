function onCreate()
    Dodge = 0;
    BigShotSpeedX = 0;
    BigShotMove = false;
    bf_visibleCuphead = 0
    bf_characterFound = false
    BigShotYOffset = 0


    DodgeTimer = 0
    DodgeTimer = (getProperty('boyfriend.x') - getProperty('dad.x')) / 10200
    
    if not downscroll then

        makeAnimatedLuaSprite('CupAlert','indie/cup/mozo',500,340)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    else
        makeAnimatedLuaSprite('CupAlert','indie/cup/gay',500,110)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    end

    if getProperty('boyfriend.curCharacter') == 'BF_IC_Rain' then
        makeAnimatedLuaSprite('BF_Dodge','characters/BoyFriend_IC_Rain',getProperty('boyfriend.x') + 20,getProperty('boyfriend.y') - 5)
        addAnimationByPrefix('BF_Dodge','dodge','boyfriend dodge instance 1',24,false)
        bf_characterFound = true
    end

    if getProperty('boyfriend.curCharacter') == 'bf' then
        makeAnimatedLuaSprite('BF_Dodge','characters/BOYFRIEND',getProperty('boyfriend.x') + 20,getProperty('boyfriend.y') - 5)
        addAnimationByPrefix('BF_Dodge','dodge','boyfriend dodge',24,false)
        bf_characterFound = true
    end

    if getProperty('boyfriend.curCharacter') == 'BoyFriend_NM' then
        makeAnimatedLuaSprite('BF_Dodge','characters/BoyFriend_NM',getProperty('boyfriend.x') + 20,getProperty('boyfriend.y') - 5)
        addAnimationByPrefix('BF_Dodge','dodge','boyfriend dodge instance 1',24,false)
        bf_characterFound = true
    end

    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
        makeAnimatedLuaSprite('BigShotCuphead', 'indie/cup/bull/Cuphead Hadoken',getProperty('dad.x') - 200,getProperty('dad.y') - 50);
        addAnimationByPrefix('BigShotCuphead','Burst','BurstFX instance 1',24,false);
        addAnimationByPrefix('BigShotCuphead','Hadolen','Hadolen instance 1',24,true);
        objectPlayAnimation('BigShotCuphead','Hadolen',true)
        BigShotYOffset = -50
    end

    if getProperty('dad.curCharacter') == 'Nightmare-Cuphead' then
        makeAnimatedLuaSprite('BigShotCuphead', 'indie/cup/bull/NMcupheadAttacks',getProperty('dad.x') - 200,getProperty('dad.y') + 100);
        addAnimationByPrefix('BigShotCuphead','Hadolen','DeathBlast instance 1',24,true);
        objectPlayAnimation('BigShotCuphead','Hadolen',true)
        scaleObject('BigShotCuphead',1.2,1.2)
        BigShotYOffset = 100
    end

    setBlendMode('BigShotCuphead','add')
end

function onEvent(name,value1)





    if name == "CupheadAttack" then
        BigShotY = getProperty('dad.y') + BigShotYOffset
        if value1 ~= '' then
            addLuaSprite('CupAlert',true)
            playSound('Cup/fuckyoumoro')
        end
    Dodge = 2
    characterPlayAnim('dad', 'big shot', true);
    setProperty('dad.specialAnim', true);
    runTimer('CupheadAttack',0.6)
    playSound('Cup/CupPre_shoot')
    end
end

function onUpdate(elapsed)

    if getProperty('CupAlert.animation.curAnim.finished') then
        removeLuaSprite('CupAlert',false)
        objectPlayAnimation('CupAlert','Alert',true)
    end
    if BigShotMove == true then
     setProperty('BigShotCuphead.x',getProperty('BigShotCuphead.x') + 25)
    end

    if getProperty('BigShotCuphead.animation.curAnim.finished') == true and getProperty('BigShotCuphead.animation.curAnim.name') == 'Burst' then
        removeLuaSprite('BigShotCuphead',false)
    end
 
    if Dodge == 2 and keyJustPressed('space') and not botPlay or Dodge == 2 and botPlay then
        Dodge = 1;
    end

    if getProperty('BF_Dodge.animation.curAnim.finished') == true then
        if bf_visibleCuphead == 1 then
            setProperty('boyfriend.visible',true)
            bf_visibleCuphead = 0
        end
        removeLuaSprite('BF_Dodge',false)
    end

    if bf_visibleCuphead == 1 and bf_characterFound == true then
        setProperty('boyfriend.visible',false)
    end
    if getProperty('BigShotCuphead.x') > screenWidth + getProperty('BigShotCuphead.width') then
        removeLuaSprite('BigShotCuphead',false)
    end

end

function onTimerCompleted(tag)


    if tag == 'CupheadAttack' then

     setProperty('BigShotCuphead.x',getProperty('dad.x') - 200,getProperty('dad.y') - 50)
     BigShotSpeedX = 0
     BigShotMove = true;
     removeLuaSprite('BigShotCuphead', false)
     addLuaSprite('BigShotCuphead',true)
     setProperty('BigShotCuphead.y',BigShotY)
     objectPlayAnimation('BigShotCuphead','Hadolen',true)
     playSound('cup/CupShoot')
     if songName ~=  "Devil's Gambit" then
     runTimer('dodgeCupAttack',DodgeTimer)
     else
        runTimer('dodgeCupAttack',0.1)
     end

    end

    if tag == 'dodgeCupAttack' then
        if Dodge == 1 then
            if bf_characterFound == true then
            addLuaSprite('BF_Dodge',false)
            objectPlayAnimation('BF_Dodge','dodge',false)
            setProperty('boyfriend.visible',false)
            else
                characterPlayAnim('boyfriend','dodge',false)
                setProperty('boyfriend.specialAnim',true)
                objectPlayAnimation('CupAlert','Alert',true)
            end
            playSound('cup/CupDodge',1)
            bf_visibleCuphead = 1
            Dodge = 0
        end
   
        if Dodge == 2 then
         characterPlayAnim('boyfriend','hurt',false);
         setProperty('boyfriend.specialAnim',true);
            if getProperty('health') - 1.4 > 0 then
             setProperty('health',getProperty('health') - 1.4)
            else
             runTimer('GameOver',0.3);
            end
            if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
             objectPlayAnimation('BigShotCuphead','Burst',false)    
             setProperty('BigShotCuphead.y',BigShotY - 500)
             BigShotMove = false
            end
        end
   
 
    end

    if tag == 'GameOver' then
     removeLuaSprite('BigShotCuphead', false)
     setProperty('health', -500);
    end
end

function onStepHit()

    if curStep == 1174 and songName == 'Knockout' then
        BigShotMove = false
        objectPlayAnimation('BigShotCuphead','Burst',false)    
        setProperty('BigShotCuphead.y',getProperty('BigShotCuphead.y') - 500)   
    end
end