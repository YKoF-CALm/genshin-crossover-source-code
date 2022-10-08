function onCreate()
    setProperty('dad.y', getProperty('dad.y') - 140)

    makeAnimatedLuaSprite('tea', 'characters/tea_assets', getCharacterX('gf'), getCharacterY('gf'))
    addAnimationByPrefix('tea', 'scared', 'GF FEAR', 24, true)
    addLuaSprite('tea', false)
    objectPlayAnimation('tea', 'scared', true)

    makeAnimatedLuaSprite('fever', 'characters/casFEVER', 950, 500)
    addAnimationByPrefix('fever', 'scared', 'BF idle shaking', 24, true)
    addLuaSprite('fever', false)
    objectPlayAnimation('fever', 'scared', true)
end

function onUpdate(elapsed)
    local songPos = getSongPosition()
    local currentBeat = (songPos / 1000)*(bpm/60)
    local currentBeat2 = (songPos / 1000)*(bpm/120)
    if curStep >= 0 and curStep < 12 then
        for i=0,3 do
            noteTweenX(i..'1tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'1tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'1tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'1tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    if curStep == 1528 then
        for i=0,3 do
            setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
        end
    end
    
    if curStep == 1558 then
        for i=0,3 do
            setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
        end
    end
    
    
    if curStep >= 128 and curStep < 624 or curStep >= 1152 and curStep < 1648 then
        for i=0,3 do
            noteTweenX(i..'2tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat2 + i*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'2tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat2 + i*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    if curStep >= 640 and curStep < 896 or curStep >= 1664 and curStep < 2176 then
        for i=0,3 do
            noteTweenY(i..'3tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'3tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    
    if curStep >= 1024 and curStep < 1154 then
        for i=0,3 do
            noteTweenY(i..'4tweenyo', i, _G['defaultOpponentStrumY'..i] + 25 * math.cos((currentBeat + i*5) * math.pi), 0.1, 'linear')
            noteTweenY(i..'4tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 25 * math.cos((currentBeat + (i+4)*5) * math.pi), 0.1, 'linear')
        end
    end
    
    
    
    if curStep >= 12 and curStep < 16 then
        for i=0,3 do
            cancelTween(i..'1tweenxo')
            cancelTween(i..'1tweenxp')
            cancelTween(i..'1tweenyo')
            cancelTween(i..'1tweenyp')
            noteTweenY(i..'5tweenyo', i, _G['defaultOpponentStrumY'..i] + -120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'5tweenyp', i+4, _G['defaultPlayerStrumY'..i] + -120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 16 and curStep < 28 then
        for i=0,3 do
            cancelTween(i..'5tweenyo')
            cancelTween(i..'5tweenyp')
            noteTweenX(i..'6tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'6tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'6tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'6tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 28 and curStep < 32 then
        for i=0,3 do
            cancelTween(i..'6tweenxo')
            cancelTween(i..'6tweenxp')
            cancelTween(i..'6tweenyo')
            cancelTween(i..'6tweenyp')
            noteTweenY(i..'7tweenyo', i, _G['defaultOpponentStrumY'..i] + 120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'7tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 32 and curStep < 44 then
        for i=0,3 do
            cancelTween(i..'7tweenyo')
            cancelTween(i..'7tweenyp')
            noteTweenX(i..'8tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'8tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'8tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'8tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 44 and curStep < 48 then
        for i=0,3 do
            cancelTween(i..'8tweenxo')
            cancelTween(i..'8tweenxp')
            cancelTween(i..'8tweenyo')
            cancelTween(i..'8tweenyp')
            noteTweenY(i..'9tweenyo', i, _G['defaultOpponentStrumY'..i] + -120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'9tweenyp', i+4, _G['defaultPlayerStrumY'..i] + -120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    if curStep >= 48 and curStep < 60 then
        for i=0,3 do
            cancelTween(i..'9tweenyo')
            cancelTween(i..'9tweenyp')
            noteTweenX(i..'0tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'0tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'0tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'0tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 60 and curStep < 64 then
        for i=0,3 do
            cancelTween(i..'0tweenxo')
            cancelTween(i..'0tweenxp')
            cancelTween(i..'0tweenyo')
            cancelTween(i..'0tweenyp')
            noteTweenY(i..'10tweenyo', i, _G['defaultOpponentStrumY'..i] + 120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'10tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 64 and curStep < 76 then
        for i=0,3 do
            cancelTween(i..'10tweenyo')
            cancelTween(i..'10tweenyp')
            noteTweenX(i..'11tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'11tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'11tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'11tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 76 and curStep < 80 then
        for i=0,3 do
            cancelTween(i..'11tweenxo')
            cancelTween(i..'11tweenxp')
            cancelTween(i..'11tweenyo')
            cancelTween(i..'11tweenyp')
            noteTweenY(i..'12tweenyo', i, _G['defaultOpponentStrumY'..i] + -120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'12tweenyp', i+4, _G['defaultPlayerStrumY'..i] + -120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 80 and curStep < 92 then
        for i=0,3 do
            cancelTween(i..'12tweenyo')
            cancelTween(i..'12tweenyp')
            noteTweenX(i..'13tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'13tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'13tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'13tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 92 and curStep < 96 then
        for i=0,3 do
            cancelTween(i..'13tweenxo')
            cancelTween(i..'13tweenxp')
            cancelTween(i..'13tweenyo')
            cancelTween(i..'13tweenyp')
            noteTweenY(i..'14tweenyo', i, _G['defaultOpponentStrumY'..i] + 120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'14tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 96 and curStep < 108 then
        for i=0,3 do
            cancelTween(i..'14tweenyo')
            cancelTween(i..'14tweenyp')
            noteTweenX(i..'15tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'15tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'15tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'15tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 108 and curStep < 112 then
        for i=0,3 do
            cancelTween(i..'15tweenxo')
            cancelTween(i..'15tweenxp')
            cancelTween(i..'15tweenyo')
            cancelTween(i..'15tweenyp')
            noteTweenY(i..'16tweenyo', i, _G['defaultOpponentStrumY'..i] + -120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'16tweenyp', i+4, _G['defaultPlayerStrumY'..i] + -120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end	
    end
    
    if curStep >= 112 and curStep < 124 then
        for i=0,3 do
            cancelTween(i..'16tweenyo')
            cancelTween(i..'16tweenyp')
            noteTweenX(i..'17tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'17tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'17tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'17tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 124 and curStep < 126 then
        for i=0,3 do
            cancelTween(i..'17tweenxo')
            cancelTween(i..'17tweenxp')
            cancelTween(i..'17tweenyo')
            cancelTween(i..'17tweenyp')
            noteTweenY(i..'18tweenyo', i, _G['defaultOpponentStrumY'..i] + 118 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'18tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 118 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep == 264 or curStep == 280 or curStep == 296 or curStep == 312 then
        setProperty('camHUD.zoom', 1.1)
    end
    
    
    if curStep == 646 or curStep == 652 or curStep == 658 or curStep == 660 or curStep == 666 or curStep == 672 or curStep == 678 or curStep == 684 or curStep == 690 or curStep == 692 or curStep == 698 or curStep == 704 or curStep == 710 or curStep == 716 or curStep == 722 or curStep == 724 or curStep == 730 or curStep == 736 or curStep == 742 or curStep == 748 or curStep == 754 or curStep == 756 or curStep == 762 then
        setProperty('camGame.zoom', 0.62)
    end
    
    if curStep == 648 or curStep == 664 or curStep == 680 or curStep == 696 or curStep == 712 or curStep == 728 or curStep == 744 or curStep == 760 then
        setProperty('camGame.zoom', 0.62)
    end
    
    if curStep == 768 or curStep == 774 or curStep == 780 or curStep == 786 or curStep == 788 or curStep == 794 or curStep == 800 or curStep == 806 or curStep == 812 or curStep == 818 or curStep == 820 or curStep == 826 or curStep == 832 or curStep == 838 or curStep == 844 or curStep == 850 or curStep == 852 or curStep == 858 or curStep == 864 or curStep == 870 or curStep == 876 then
        setProperty('camGame.zoom', 0.62)
    end
    
    if curStep == 776 or curStep == 792 or curStep == 808 or curStep == 824 or curStep == 840 or curStep == 856 or curStep == 872 then
        setProperty('camHUD.zoom', 1.1)
    end
    
    
    if curStep == 328 or curStep == 344 or curStep == 360 then
        setProperty('camGame.zoom', 0.62)
    end
    
    
    if curStep == 640 or curStep == 1664 then
        setProperty('camHUD.zoom', 1.1)
        setProperty('camGame.zoom', 0.65)
		setProperty('scoreTxt.visible', false);
		setProperty('healthBar.visible', false);
		setProperty('healthBarBG.visible', false);
		setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
    end
    
    if curStep == 896 or curStep == 2176 then
        setProperty('camHUD.zoom', 1.1)
        setProperty('camGame.zoom', 0.65)
		setProperty('scoreTxt.visible', true);
		setProperty('healthBar.visible', true);
		setProperty('healthBarBG.visible', true);
		setProperty('iconP1.visible', true);
		setProperty('iconP2.visible', true);
    end
    
    
    if curStep == 1164 then
        cameraShake('game', 0.02, 0.225)
    end   
    
    if curStep == 1180 then
        cameraShake('game', 0.02, 0.225)
    end
    
    if curStep == 1212 then
        cameraShake('game', 0.02, 0.225)
    end
    
    
    if curStep == 1228 then
        cameraShake('game', 0.02, 0.225)
    end 

    if curStep == 1244 then
        cameraShake('game', 0.02, 0.225)
    end
    
    if curStep == 1276 then
        cameraShake('game', 0.02, 0.225)
    end
    
     
    if curStep == 1288 or curStep == 1304 or curStep == 1320 or curStep == 1336 or curStep == 1352 or curStep == 1368 or curStep == 1384 then
        setProperty('camHUD.zoom', 1.1)
    end
    
    
    
    if curStep == 1672 or curStep == 1688 or curStep == 1704 or curStep == 1720 or curStep == 1736 or curStep == 1752 or curStep == 1784 or curStep == 1800 or curStep == 1816 or curStep == 1832 or curStep == 1848 or curStep == 1864 or curStep == 1880 or curStep == 1896 or curStep == 1928 or curStep == 1944 or curStep == 1960 or curStep == 1976 or curStep == 1992 or curStep == 2008 or curStep == 2024 or curStep == 2040 or curStep == 2056 or curStep == 2072 or curStep == 2088 or curStep == 2104 or curStep == 2120 or curStep == 2136 or curStep == 2152 or curStep == 2168 then
        setHudZoom(1.1)
        setProperty('camHUD.zoom', 1.1)
    end
    
    
    
    if curStep == 1664 or curStep == 1670 or curStep == 1676 or curStep == 1682 or curStep == 1684 or curStep == 1690 or curStep == 1696 or curStep == 1702 or curStep == 1708 or curStep == 1714 or curStep == 1716 or curStep == 1722 then
        setProperty('camGame.zoom', 0.62)
    end
    
    if curStep == 1728 or curStep == 1734 or curStep == 1740 or curStep == 1746 or curStep == 1748 or curStep == 1754 or curStep == 1760 or curStep == 1766 or curStep == 1772 or curStep == 1778 or curStep == 1780 or curStep == 1786 then
        setProperty('camGame.zoom', 0.62)
    end
    
    
    if curStep == 1792 or curStep == 1804 or curStep == 1810 or curStep == 1812 or curStep == 1818 or curStep == 1824 or curStep == 1830 or curStep == 1836 or curStep == 1842 or curStep == 1844 or curStep == 1850 then
        setProperty('camGame.zoom', 0.62)
    end
    
    if curStep == 1856 or curStep == 1862 or curStep == 1868 or curStep == 1874 or curStep == 1876 or curStep == 1882 or curStep == 1888 or curStep == 1894 or curStep == 1900 then
        setProperty('camGame.zoom', 0.62)
    end
    
    
    
    
    if curStep == 1920 or curStep == 1926 or curStep == 1932 or curStep == 1938 or curStep == 1940 or curStep == 1946 or curStep == 1952 or curStep == 1958 or curStep == 1964 or curStep == 1970 or curStep == 1972 or curStep == 1978 then
        setProperty('camGame.zoom', 0.62)
    end
    
    if curStep == 1984 or curStep == 1990 or curStep == 1996 or curStep == 2002 or curStep == 2004 or curStep == 2010 or curStep == 2016 or curStep == 2022 or curStep == 2028 or curStep == 2034 or curStep == 2036 or curStep == 2042 then
        setProperty('camGame.zoom', 0.62)
    end
    
    
    if curStep == 2048 or curStep == 2054 or curStep == 2060 or curStep == 2066 or curStep == 2068 or curStep == 2074 or curStep == 2080 or curStep == 2086 or curStep == 2092 or curStep == 2098 or curStep == 2100 or curStep == 2106 then
        setProperty('camGame.zoom', 0.62)
    end
    
    if curStep == 2112 or curStep == 2118 or curStep == 2124 or curStep == 2130 or curStep == 2132 or curStep == 2138 or curStep == 2144 or curStep == 2150 or curStep == 2156 or curStep == 2162 or curStep == 2164 or curStep == 2170 then
        setProperty('camGame.zoom', 0.62)
    end
    
    if curStep >= 2176 and curStep < 2188 then
        for i=0,3 do
            noteTweenX(i..'19tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'19tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'19tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'19tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 2188 and curStep < 2192 then
        for i=0,3 do
            cancelTween(i..'19tweenxo')
            cancelTween(i..'19tweenxp')
            cancelTween(i..'19tweenyo')
            cancelTween(i..'19tweenyp')
            noteTweenY(i..'20tweenyo', i, _G['defaultOpponentStrumY'..i] + -120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'20tweenyp', i+4, _G['defaultPlayerStrumY'..i] + -120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end	
    end
    
    
    if curStep >= 2192 and curStep < 2204 then
        for i=0,3 do
            cancelTween(i..'20tweenyo')
            cancelTween(i..'20tweenyp')
            noteTweenX(i..'21tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'21tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'21tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'21tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 2204 and curStep < 2208 then
        for i=0,3 do
            cancelTween(i..'21tweenxo')
            cancelTween(i..'21tweenxp')
            cancelTween(i..'21tweenyo')
            cancelTween(i..'21tweenyp')
            noteTweenY(i..'22tweenyo', i, _G['defaultOpponentStrumY'..i] + 120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'22tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end	
    end
    
    
    if curStep >= 2208 and curStep < 2220 then
        for i=0,3 do
            cancelTween(i..'22tweenyo')
            cancelTween(i..'22tweenyp')
            noteTweenX(i..'23tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'23tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'23tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'23tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 2220 and curStep < 2224 then
        for i=0,3 do
            cancelTween(i..'23tweenxo')
            cancelTween(i..'23tweenxp')
            cancelTween(i..'23tweenyo')
            cancelTween(i..'23tweenyp')
            noteTweenY(i..'24tweenyo', i, _G['defaultOpponentStrumY'..i] + -120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'24tweenyp', i+4, _G['defaultPlayerStrumY'..i] + -120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    if curStep >= 2224 and curStep < 2236 then
        for i=0,3 do
            cancelTween(i..'24tweenyo')
            cancelTween(i..'24tweenyp')
            noteTweenX(i..'25tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'25tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'25tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'25tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 2236 and curStep < 2240 then
        for i=0,3 do
            cancelTween(i..'25tweenxo')
            cancelTween(i..'25tweenxp')
            cancelTween(i..'25tweenyo')
            cancelTween(i..'25tweenyp')
            noteTweenY(i..'26tweenyo', i, _G['defaultOpponentStrumY'..i] + 120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'26tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end	
    end
    
    
    if curStep >= 2240 and curStep < 2252 then
        for i=0,3 do
            cancelTween(i..'26tweenyo')
            cancelTween(i..'26tweenyp')
            noteTweenX(i..'27tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'27tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'27tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'27tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 2252 and curStep < 2256 then
        for i=0,3 do
            cancelTween(i..'27tweenxo')
            cancelTween(i..'27tweenxp')
            cancelTween(i..'27tweenyo')
            cancelTween(i..'27tweenyp')
            noteTweenY(i..'28tweenyo', i, _G['defaultOpponentStrumY'..i] + -120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'28tweenyp', i+4, _G['defaultPlayerStrumY'..i] + -120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 2256 and curStep < 2268 then
        for i=0,3 do
            cancelTween(i..'28tweenyo')
            cancelTween(i..'28tweenyp')
            noteTweenX(i..'29tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'29tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'29tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'29tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 2268 and curStep < 2272 then
        for i=0,3 do
            cancelTween(i..'29tweenxo')
            cancelTween(i..'29tweenxp')
            cancelTween(i..'29tweenyo')
            cancelTween(i..'29tweenyp')
            noteTweenY(i..'30tweenyo', i, _G['defaultOpponentStrumY'..i] + 120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'30tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 2272 and curStep < 2284 then
        for i=0,3 do
            cancelTween(i..'30tweenyo')
            cancelTween(i..'30tweenyp')
            noteTweenX(i..'31tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'31tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'31tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'31tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    
    if curStep >= 2284 and curStep < 2288 then
        for i=0,3 do
            cancelTween(i..'31tweenxo')
            cancelTween(i..'31tweenxp')
            cancelTween(i..'31tweenyo')
            cancelTween(i..'31tweenyp')
            noteTweenY(i..'32tweenyo', i, _G['defaultOpponentStrumY'..i] + -120 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'32tweenyp', i+4, _G['defaultPlayerStrumY'..i] + -120 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
    
    if curStep >= 2288 and curStep < 2300 then
        for i=0,3 do
            cancelTween(i..'32tweenyo')
            cancelTween(i..'32tweenyp')
            noteTweenX(i..'33tweenxo', i, _G['defaultOpponentStrumX'..i] + 25 * math.sin((currentBeat + i*50) * math.pi), 0.1, 'linear')
            noteTweenX(i..'33tweenxp', i+4, _G['defaultPlayerStrumX'..i] + 25 * math.sin((currentBeat + (i+4)*50) * math.pi), 0.1, 'linear')
            noteTweenY(i..'33tweenyo', i, _G['defaultOpponentStrumY'..i] + 5 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'33tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 5 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end
    
    if curStep >= 2300 and curStep < 2302 then
        for i=0,3 do
            cancelTween(i..'33tweenxo')
            cancelTween(i..'33tweenxp')
            cancelTween(i..'33tweenyo')
            cancelTween(i..'33tweenyp')
            noteTweenY(i..'34tweenyo', i, _G['defaultOpponentStrumY'..i] + 118 * math.cos((currentBeat + i*10) * math.pi), 0.1, 'linear')
            noteTweenY(i..'34tweenyp', i+4, _G['defaultPlayerStrumY'..i] + 118 * math.cos((currentBeat + (i+4)*10) * math.pi), 0.1, 'linear')
        end
    end
end
    
    
function onBeatHit()
    if curStep >= 512 and curStep < 624 or curStep >= 1024 and curStep < 1152 or curStep >= 1536 and curStep < 1648 then
        setProperty('camGame.zoom', 0.62)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.015 then
        setProperty('health', getProperty('health') - 0.015)
    end
end