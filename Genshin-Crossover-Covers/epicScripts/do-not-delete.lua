function onCreatePost()
    makeLuaText("message", "Mod Ported By TieGuo\n- Psych Engine -", 500, 30, 50)
    setTextAlignment("message", "left")
    addLuaText("message")
	if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('message.y', 680)
    end
end