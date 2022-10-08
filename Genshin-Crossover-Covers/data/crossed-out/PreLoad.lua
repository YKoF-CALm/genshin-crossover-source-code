function onCreate()
    addLuaScript('epicScripts/CrossedOut')
    if not lowQuality then
        precacheImage('crossed-out/CupheadStage2_BfGhost')
        precacheImage('crossed-out/CupheadStage2_Rain1')
        precacheImage('crossed-out/CupheadStage2_Rain2')
        precacheImage('crossed-out/SansEvent_Blaster')
        precacheImage('crossed-out/BendyStage1_Back')
        precacheImage('crossed-out/BendyStage1_Background')
        precacheImage('crossed-out/BendyStage1_Boi')
        precacheImage('crossed-out/BendyStage1_Chains')
        precacheImage('crossed-out/BendyStage1_Devil')
        precacheImage('crossed-out/BendyStage1_Front')
        precacheImage('crossed-out/BendyStage1_Pillar')
        precacheImage('crossed-out/BendyStage2_Back')
        precacheImage('crossed-out/BendyStage3_Back')
        precacheImage('crossed-out/BendyStage2_InkRain')
        precacheImage('crossed-out/Final_CharChangeSplash')
        precacheImage('crossed-out/Final_Base')
        precacheImage('characters/Ganyu-Indie-NIGHTMARE')
        precacheImage('characters/xiao-indie-nightmare')
        precacheImage('characters/Zhongli-Indie-NIGHTMARE')
        precacheImage('crossed-out/Final_Stars1')
        precacheImage('crossed-out/Final_Stars2')
        precacheImage('crossed-out/Final_Stars3')
        precacheImage('crossed-out/Final_Stars4')
        precacheImage('crossed-out/InkAmbiente')
        precacheImage('crossed-out/Ink_shit')
        precacheImage('crossed-out/SansStage1_Back')
        precacheImage('crossed-out/SansStage3_Back')
        precacheImage('crossed-out/SansStage3_Front')
        precacheImage('crossed-out/BendyStage1_Sammy')
        precacheImage('crossed-out/SansStage3_Shitter')
        precacheImage('crossed-out/SansStage3_SnowStorm')
        precacheImage('characters/Yanfei-Dance')
        precacheImage('characters/Ganyu-Dancin')
    else
        precacheImage('crossed-out/LowQuality_Cuphead1')
        precacheImage('crossed-out/LowQuality_Cuphead2')
        precacheImage('crossed-out/LowQuality_Sans1')
        precacheImage('crossed-out/LowQuality_Sans3')
        precacheImage('crossed-out/LowQuality_Sans4')
        precacheImage('crossed-out/LowQuality_Bendy1')
        precacheImage('crossed-out/LowQuality_Final')
    end

    if not lowQuality then
        addCharacterToList('bf_bendy_1', 'boyfriend')
        addCharacterToList('bf_bendy_3', 'boyfriend')
        addCharacterToList('bf_cuphead_2', 'boyfriend')
        addCharacterToList('bf_sans_1', 'boyfriend')
        addCharacterToList('bf_sans_3', 'boyfriend')
        addCharacterToList('bf_sans_4', 'boyfriend')
        addCharacterToList('zhongli-indie-fly-dark', 'dad')
        addCharacterToList('xiao-indie-sans-sit', 'dad')
    end
    addCharacterToList('bf_bendy_2', 'boyfriend')
    addCharacterToList('bf_cuphead_1', 'boyfriend')
    addCharacterToList('bf_sans_2', 'boyfriend')
    addCharacterToList('zhongli-crossed-out', 'dad')
    addCharacterToList('ganyu-crossed-out', 'dad')
    addCharacterToList('xiao-crossed-out', 'dad')
    addCharacterToList('nothing', 'gf')
    addCharacterToList('ganyu-indie-angry', 'dad')
    addCharacterToList('ganyu-indie-mad-dark', 'dad')
    addCharacterToList('ganyu-indie-mad', 'gf')
    addCharacterToList('xiao-indie-attack', 'dad')
    addCharacterToList('xiao-indie', 'dad')
    addCharacterToList('zhongli-indie-bendy', 'dad')
    addCharacterToList('zhongli-indie-fly', 'dad')
    addCharacterToList('xiao-indie-sans', 'dad')

    if not lowQuality then
        precacheSound('crossed-out/BlasterShoot')
        precacheSound('crossed-out/boo')
        precacheSound('crossed-out/cuphead_CardIsReady')
        precacheSound('crossed-out/cuphead_CardAttack')
        precacheSound('ganyushoot')
        precacheSound('ganyuna')
    end
end