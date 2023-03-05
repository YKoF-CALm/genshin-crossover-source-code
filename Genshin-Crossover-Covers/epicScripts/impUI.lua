function onCreatePost()
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('scoreTxt.visible', false)
    
    makeLuaText('NewScoreTxt','Score: 0 | Combo Breaks: 0 | Accurary: 0%', getPropertyFromClass('flixel.FlxG', 'width'),getProperty('scoreTxt.x'), getProperty('scoreTxt.y'))
    setTextSize('NewScoreTxt',23)
	setObjectCamera('NewScoreTxt', 'hud')
	setTextColor('NewScoreTxt', '0xffffff')
    setTextBorder('NewScoreTxt', 2, '000000');
    setTextAlignment('NewScoreTxt', 'center');
	addLuaText('NewScoreTxt');
end

function toHexString(red, green, blue, prefix)
	if (prefix == nil) then prefix = true end
	
	return (prefix and "0x" or "") .. (
			string.format("%02X%02X%02X", red, green, blue)
		)
end

function onUpdatePost()
    if dadName == 'black' or dadName == 'zhongli-indie-nightmare' then
        setTextColor('NewScoreTxt', 'FF0000')
    else
        local dadColors = getProperty("dad.healthColorArray")
	    local dadColor = tonumber(toHexString(dadColors[1], dadColors[2], dadColors[3]))
	
        setProperty("NewScoreTxt.color", dadColor)
    end
    local acc = rating * 100
    setProperty('NewScoreTxt.scale.x', getProperty('scoreTxt.scale.x'))
    setProperty('NewScoreTxt.scale.y', getProperty('scoreTxt.scale.y'))
    if hits > 0 then
        setTextString("NewScoreTxt", "Score: " .. score .. " | Combo Breaks: " .. misses .. " | Accuracy: " .. math.floor(acc * 100) / 100 .. "% ["..ratingFC..']')
    else
        setTextString("NewScoreTxt", "Score: 0 | Combo Breaks: 0 | Accurary: 0%")
    end
end