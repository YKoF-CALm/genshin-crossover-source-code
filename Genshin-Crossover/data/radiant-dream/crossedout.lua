function onCreate()
    makeAnimatedLuaSprite('Final_Base1','crossed-out/Final_Base', getProperty('boyfriend.x') - 600, getProperty('boyfriend.y') + 50)
	addAnimationByPrefix('Final_Base1','Ground Bop instance1 ','Ground Bop instance ', 24, false)
	scaleObject('Final_Base1', 2, 2);
    setProperty('Final_Base1.alpha', 0)

	makeAnimatedLuaSprite('Final_Base2','crossed-out/Final_Base', getProperty('dad.x') - 1700, getProperty('dad.y') + 200)
	addAnimationByPrefix('Final_Base2','Ground Bop instance2 ','Ground Bop instance ', 24, false)
	scaleObject('Final_Base2', 4.5, 3);
    setProperty('Final_Base2.alpha', 0)

    makeLuaSprite('Final_Stars1', 'crossed-out/Final_Stars1', -700, -230);
    setScrollFactor('Final_Stars1', 0.6, 0.6);
    scaleObject('Final_Stars1', 1.5, 1.5); 
    makeLuaSprite('Final_Stars2', 'crossed-out/Final_Stars2', -700, -230);
    setScrollFactor('Final_Stars2', 0.4, 0.4);
    scaleObject('Final_Stars2', 1.5, 1.5);

    makeLuaSprite('Final_Stars3', 'crossed-out/Final_Stars3', -700, -230);
    setScrollFactor('Final_Stars3', 0.2, 0.2);
    scaleObject('Final_Stars3', 1.5, 1.5);
    makeLuaSprite('Final_Stars4', 'crossed-out/Final_Stars4', -700, -230);
    setScrollFactor('Final_Stars4', 0.05, 0.05);
    scaleObject('Final_Stars4', 1.5, 1.5);    
    doTweenAlpha('Final_Stars3', 'Final_Stars3', 0, 0.01,'linear')
    doTweenAlpha('Final_Stars4', 'Final_Stars4', 0, 0.01,'linear')

    makeLuaSprite('Final_Stars5', 'crossed-out/Final_Stars3', -700, -230);
    setScrollFactor('Final_Star5', 1.4, 1.4);
    scaleObject('Final_Stars5', 3, 3);
    makeLuaSprite('Final_Stars6', 'crossed-out/Final_Stars4', -700, -230);
    setScrollFactor('Final_Stars6', 1.2, 1.2);
    scaleObject('Final_Stars6', 3, 3);

    doTweenAlpha('Final_Stars1', 'Final_Stars1', 0, 0.01,'linear')
    doTweenAlpha('Final_Stars2', 'Final_Stars2', 0, 0.01,'linear')
    doTweenAlpha('Final_Stars3', 'Final_Stars3', 0, 0.01,'linear')
    doTweenAlpha('Final_Stars4', 'Final_Stars4', 0, 0.01,'linear')
    doTweenAlpha('Final_Stars5', 'Final_Stars5', 0, 0.01,'linear')
    doTweenAlpha('Final_Stars6', 'Final_Stars6', 0, 0.01,'linear')
    addLuaSprite('Final_Base2',false)
    addLuaSprite('Final_Base1',false)
    addLuaSprite('Final_Stars3', false);
    addLuaSprite('Final_Stars4', false)
    addLuaSprite('Final_Stars5', false);
    addLuaSprite('Final_Stars6', false)
    addLuaSprite('Final_Stars1', false);
    addLuaSprite('Final_Stars2', false)
end