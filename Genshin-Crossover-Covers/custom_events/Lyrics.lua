-- Event notes hooks
function onEvent(name, value1, value2)
    local string = (value1)
    if name == "Lyrics" then

        makeLuaText('yappin', 'Lyrics go here!', 900, 200, 500)
        setTextString('yappin',  string)
        setTextFont('yappin', 'vcr.ttf')
        setTextSize('yappin', 75);
        addLuaText('yappin')
        setTextAlignment('yappin', 'center')
        setObjectCamera("yappin", 'hud');
        setTextColor('yappin', value2)
    end
end