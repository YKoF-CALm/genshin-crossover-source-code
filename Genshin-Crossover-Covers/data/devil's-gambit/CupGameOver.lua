
function onCreate()
    GameOverActive = false
    enableEnd = false
    GameOverState = 0
    songPositionCup = getSongPosition()
    CupSelection = 0
    AlphaCupEffect = 1

    setPropertyFromClass('GameOverSubstate', 'characterName', 'BF_Ghost'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'Cup/CupDeath'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music

    makeAnimatedLuaSprite('BF_Ghost','characters/BF_Ghost',getProperty('boyfriend.x'),getProperty('boyfriend.y'))
    addAnimationByPrefix('BF_Ghost','Death','thrtr instance 1',24,true)

    makeLuaSprite('You re dead','indie/cup/death',200,300)
    setObjectCamera('You re dead','hud')
    scaleObject('You re dead',0.9,0.9)

    

    makeLuaSprite('DeathCard','indie/cup/devil_death',450,100)
    setObjectCamera('DeathCard','hud')
    scaleObject('DeathCard',0.7,0.7)
    setProperty('DeathCard.angle',200)
    setProperty('DeathCard.alpha',0)


    makeAnimatedLuaSprite('CupExitButton','indie/cup/buttons',getProperty('DeathCard.x') + 155,getProperty('DeathCard.y') + 385)
    addAnimationByPrefix('CupExitButton','Normal','menu basic',24,true)
    addAnimationByPrefix('CupExitButton','Selected','menu white',24,true)
    setObjectCamera('CupExitButton','hud')

    makeAnimatedLuaSprite('CupRetryButton','indie/cup/buttons',getProperty('DeathCard.x') + 200,getProperty('DeathCard.y') + 320)
    addAnimationByPrefix('CupRetryButton','Selected','retry white',24,true)
    addAnimationByPrefix('CupRetryButton','Normal','retry basic',24,true)

    setObjectCamera('CupRetryButton','hud')

    DadFrameCup = 0
end
function onGameOver()
    if not GameOverActive and not enableEnd then
     setPropertyFromClass('PlayState', 'instance.vocals.volume', 0)
     playSound('cup/CupDeath')
     setProperty('boyfriend.visible',false)
     addLuaSprite('BF_Ghost',true)
     addLuaSprite('You re dead',true)
     runTimer('GameOverText',2)
     GameOverActive = true
     addLuaSprite('DeathCard',true)
     addLuaSprite('CupExitButton',true)
     addLuaSprite('CupRetryButton',true)
     setProperty('boyfriend.stunned', true)
     setProperty('dad.stunned', true)
     setPropertyFromClass('PlayState', 'instance.generatedMusic', false)
    end
    return Function_Stop;
end

function onPause()
    if GameOverActive then
        return Function_Stop
    end
end
function onEndSong()
    if GameOverActive and not enableSong then
     return Function_Stop;
    end
    return Function_Continue;
end


function onUpdate(el)
    
    setProperty('CupExitButton.angle',getProperty('DeathCard.angle'))
    setProperty('CupRetryButton.angle',getProperty('DeathCard.angle'))
    setProperty('CupExitButton.alpha',getProperty('DeathCard.alpha'))
    setProperty('CupRetryButton.alpha',getProperty('DeathCard.alpha'))
    for i = 0, getProperty('notes.length')-1 do
        if GameOverActive then
         setPropertyFromGroup('notes', i, 'active', false)
         setPropertyFromGroup('notes', i, 'canBeHit', false)
        end
    end

    if GameOverActive then
        setProperty('dad.animation.curAnim.frameRate',0)
        cameraSetTarget('boyfriend')
        setProperty('BF_Ghost.y',getProperty('BF_Ghost.y') - 4)
    end

    if getProperty('You re dead.alpha') < 1 then
        setProperty('You re dead.alpha',getProperty('You re dead.alpha') - 0.05)
    end

    if GameOverState == 1 then

        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
        AlphaCupEffect = AlphaCupEffect - 0.05
        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'alpha', AlphaCupEffect)
            setPropertyFromGroup('opponentStrums', i, 'alpha', AlphaCupEffect)
        end
        for j = 0, getProperty('notes.length') do
            setPropertyFromGroup('notes', j, 'alpha', AlphaCupEffect)
        end
        if getProperty('DeathCard.alpha') < 1 then
            setProperty('DeathCard.alpha',getProperty('DeathCard.alpha') + 0.05)
        end
        setProperty('timeTxt.alpha',AlphaCupEffect)
        setProperty('scoreTxt.alpha',AlphaCupEffect)
        setProperty('iconP1.alpha',AlphaCupEffect)
        setProperty('iconP2.alpha',AlphaCupEffect)
        setProperty('healthBar.alpha',AlphaCupEffect)
    end

    if GameOverState == 2 then
        
        if CupSelection == 0 then
            objectPlayAnimation('CupRetryButton','Selected')
            objectPlayAnimation('CupExitButton','Normal')
            if keyJustPressed('up') or keyJustPressed('down') then
                playSound('cup/select')
                CupSelection = 1
            end
    
            if keyJustPressed('accept') then
                enableEnd = true
                playSound('cup/select')
                loadSong(songName, difficulty)
            end
        else
            objectPlayAnimation('CupRetryButton','Normal')
            objectPlayAnimation('CupExitButton','Selected')
            if keyJustPressed('up') or keyJustPressed('down') then
                playSound('cup/select')
                CupSelection = 0
            end
            if keyJustPressed('accept')  then
                enableEnd = true
                GameOverActive = false
                endSong()
                playSound('cup/select')
            end
        end
    end
   

end



function onTweenCompleted(tween)
    if tween == 'DeathCardAngle' then
        GameOverState = 2
    end
end

function onTimerCompleted(tag)
    if tag == 'GameOverText' then

        doTweenAngle('DeathCardAngle','DeathCard',340,0.7,'QuartOut')
        setProperty('You re dead.alpha',getProperty('You re dead.alpha') - 0.05)
        runTimer('GameOverBar',0.5)
        GameOverState = 1
    end
end

function lerp(a, b, ratio)
    return math.floor(a + ratio * (b - a))
end

