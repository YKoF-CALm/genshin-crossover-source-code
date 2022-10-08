function onCreate()
	if boyfriendName == 'TactieP' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'TactieP'); --Character json file for the death animation
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'DeathTac'); --put in mods/sounds/
	end
end