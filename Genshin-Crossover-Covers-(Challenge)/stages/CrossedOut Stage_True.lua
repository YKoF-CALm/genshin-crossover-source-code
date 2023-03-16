function onCreate()
	if not lowQuality then -- The Normal Stage, if you got a solid compüter
		makeLuaSprite('CupheadStage1_Background', 'crossed-out/CupheadStage1_Background', -795, -495);
		setScrollFactor('CupheadStage1_Background', 0.6, 0.6);
		scaleObject('CupheadStage1_Background', 3.2, 3.2);

		makeLuaSprite('CupheadStage1_Back', 'crossed-out/CupheadStage1_Back', -795, -495);
		setScrollFactor('CupheadStage1_Back', 0.8, 0.8);
		scaleObject('CupheadStage1_Back', 3.5, 3.2);

		makeLuaSprite('CupheadStage1_Front', 'crossed-out/CupheadStage1_Front', -795, -495);
		setScrollFactor('CupheadStage1_Front', 1, 1);
		scaleObject('CupheadStage1_Front', 3.2, 3.2);

		makeLuaSprite('CupheadStage2_Dark_Background', 'crossed-out/CupheadStage2_Dark_Background', -795, -495);
		setScrollFactor('CupheadStage2_Dark_Background', 0.6, 0.6);
		scaleObject('CupheadStage2_Dark_Background', 3.2, 3.2);

		makeLuaSprite('CupheadStage2_Dark_Back', 'crossed-out/CupheadStage2_Dark_Back', -795, -495);
		setScrollFactor('CupheadStage2_Dark_Back', 0.8, 0.8);
		scaleObject('CupheadStage2_Dark_Back', 3.5, 3.2);

		makeLuaSprite('CupheadStage2_Dark_Front', 'crossed-out/CupheadStage2_Dark_Front', -795, -495);
		setScrollFactor('CupheadStage2_Dark_Front', 1, 1);
		scaleObject('CupheadStage2_Dark_Front', 3.2, 3.2);

		doTweenAlpha('CupheadStage2_Dark_Background', 'CupheadStage2_Dark_Background', 0, 0.01,'linear')
		doTweenAlpha('CupheadStage2_Dark_Back', 'CupheadStage2_Dark_Back', 0, 0.01,'linear')
		doTweenAlpha('CupheadStage2_Dark_Front', 'CupheadStage2_Dark_Front', 0, 0.01,'linear')

		makeLuaSprite('SansStage_Gaster', 'crossed-out/SansStage_Gaster', 80, -600);
		scaleObject('SansStage_Gaster', 2, 2);
		
		makeLuaSprite('SansStage1_Back', 'crossed-out/SansStage1_Back', -800, -550);
		setScrollFactor('SansStage1_Back', 1, 1);
		scaleObject('SansStage1_Back', 2.5, 2.5);

		makeLuaSprite('BendyStage1_Front', 'crossed-out/BendyStage1_Front', -700, -470);
		setScrollFactor('BendyStage1_Front', 1, 1);
		scaleObject('BendyStage1_Front', 0.9, 0.9);

		makeLuaSprite('BendyStage1_Pillar', 'crossed-out/BendyStage1_Pillar', 1300, -580);
		setScrollFactor('BendyStage1_Pillar', 1.2, 1.2);

		makeAnimatedLuaSprite('CupheadStage2_Rain1','crossed-out/CupheadStage2_Rain1', -700, -250)
		addAnimationByPrefix('CupheadStage2_Rain1','RainFirstlayer instance ','RainFirstlayer instance ',24, true)
		scaleObject('CupheadStage2_Rain1', 1.6, 1.6);

		makeAnimatedLuaSprite('CupheadStage2_Rain2','crossed-out/CupheadStage2_Rain2', -700, -250)
		addAnimationByPrefix('CupheadStage2_Rain2','RainFirstlayer instance ','RainFirstlayer instance ',24, true)
		scaleObject('CupheadStage2_Rain2', 1.6, 1.6);

		makeLuaSprite('BendyStage1_Chains1', 'crossed-out/BendyStage1_Chains', -800, -750);
		setScrollFactor('BendyStage1_Chains1', 1.1, 1.1);
		scaleObject('BendyStage1_Chains1', 1.5, 1.5);

		makeLuaSprite('BendyStage1_Chains2', 'crossed-out/BendyStage1_Chains', 650, -50);
		setScrollFactor('BendyStage1_Chains2', 0.72, 0.72);
		scaleObject('BendyStage1_Chains2', 0.5, 0.5);
		setProperty('BendyStage1_Chains2.flipX', true);

		makeLuaSprite('BendyStage1_Chains3', 'crossed-out/BendyStage1_Chains', 1300, -750);
		setScrollFactor('BendyStage1_Chains3', 1.1, 1.1);
		scaleObject('BendyStage1_Chains3', 1.5, 1.5);
		setProperty('BendyStage1_Chains3.flipX', true);

		makeAnimatedLuaSprite('Final_Base1','crossed-out/Final_Base', 430, 600)
		addAnimationByPrefix('Final_Base1','Ground Bop instance1 ','Ground Bop instance ', 24, false)
		scaleObject('Final_Base1', 2, 2);

		makeAnimatedLuaSprite('Final_Base2','crossed-out/Final_Base', -1880, 440)
		addAnimationByPrefix('Final_Base2','Ground Bop instance2 ','Ground Bop instance ', 24, false)
		scaleObject('Final_Base2', 4.5, 3);

		addLuaSprite('CupheadStage1_Background', false);
		addLuaSprite('CupheadStage1_Back', false);
		addLuaSprite('CupheadStage1_Front', false);
		addLuaSprite('CupheadStage2_Dark_Background', false);
		addLuaSprite('CupheadStage2_Dark_Back', false);
		addLuaSprite('CupheadStage2_Dark_Front', false);

	else -- The low quality version, a lot better to play with a not good compüter
		makeLuaSprite('LowQuality_Cuphead1', 'crossed-out/LowQuality_Cuphead1', -700, -550);
		scaleObject('LowQuality_Cuphead1', 3.3, 3.3);

		makeLuaSprite('LowQuality_Cuphead2', 'crossed-out/LowQuality_Cuphead2', -700, -550);
		scaleObject('LowQuality_Cuphead2', 3.3, 3.3);

		makeLuaSprite('LowQuality_Sans1', 'crossed-out/LowQuality_Sans1', -700, -500);
		scaleObject('LowQuality_Sans1', 3.3, 3.3);

		makeLuaSprite('LowQuality_Sans3', 'crossed-out/LowQuality_Sans3', -700, -550);
		scaleObject('LowQuality_Sans3', 3.3, 3.3);

		makeLuaSprite('LowQuality_Sans4', 'crossed-out/LowQuality_Sans4', -700, -550);
		scaleObject('LowQuality_Sans4', 3.3, 3.3);

		makeLuaSprite('LowQuality_Bendy1', 'crossed-out/LowQuality_Bendy1', -700, -500);
		scaleObject('LowQuality_Bendy1', 3.15, 3.15);

		makeLuaSprite('LowQuality_Final', 'crossed-out/LowQuality_Final', -1200, -550);
		scaleObject('LowQuality_Final', 4, 4);
		
		addLuaSprite('LowQuality_Cuphead1', false);
	end
	
		-- These are used in both veresions
	makeAnimatedLuaSprite('BendyStage2_Back','crossed-out/BendyStage2_Back', -750, -450)
	scaleObject('BendyStage2_Back', 2, 2);
	addAnimationByPrefix('BendyStage2_Back','Pain ','Pain ', 48, true)
	doTweenAlpha('BendyStage2_Back','BendyStage2_Back', 0, 0.01, 'linear')

	makeAnimatedLuaSprite('BendyStage3_Back','crossed-out/BendyStage3_Back', -750, -450)
	scaleObject('BendyStage3_Back', 2, 2);
	addAnimationByPrefix('BendyStage3_Back','Pain ','Pain ', 48, true)
	doTweenAlpha('BendyStage3_Back','BendyStage3_Back', 0, 0.01, 'linear')

	makeAnimatedLuaSprite('Final_Sans','characters/xiao-indie-nightmare', -20, 60)
	addAnimationByPrefix('Final_Sans','IdleSans','idle xiao',24, true)

	makeAnimatedLuaSprite('Final_Sans_front','characters/xiao-indie-nightmare', -20, 60)
	addAnimationByPrefix('Final_Sans_front','IdleSans','idle xiao',24, true)

	close(true);
end

-- if not lowQuality then
-- end
