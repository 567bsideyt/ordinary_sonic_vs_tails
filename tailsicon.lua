function onCreate()
setPropertyFromClass('GameOverSubstate', 'characterName', 'tails-pixel-dead')
setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'DeathSound')
setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-pixel')
setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-pixel')
end

function onCountdownStarted()
	for i= 0, 3 do
		setPropertyFromGroup('playerStrums', i, 'texture', 'TailsNoteSkin')
    end
    for b = 0, getProperty('unspawnNotes.length') - 1 do
		if getPropertyFromGroup('unspawnNotes', b, 'mustPress') then
			setPropertyFromGroup('playerStrums', b, 'texture', 'TailsNoteSkin')
		end
	end
	for i = 0, getProperty('unspawnNotes.length') - 1 do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'TailsNoteSkin');
		end
	end
end