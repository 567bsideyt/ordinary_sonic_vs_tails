function onCreate()
setPropertyFromClass('GameOverSubstate', 'characterName', 'tails-pixel-dead')
setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'DeathSound')
setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-pixel')
setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-pixel')
end

function onCountdownStarted()
	for i= 0, 3 do
		setPropertyFromGroup('playerStrums', i, 'texture', 'TAILSNOTE_assets')
    end
    for b = 0, getProperty('unspawnNotes.length') - 1 do
		if getPropertyFromGroup('unspawnNotes', b, 'mustPress') then
			setPropertyFromGroup('playerStrums', b, 'texture', 'TAILSNOTE_assets')
		end
	end
end

function onUpdatePost(elapsed)
	for i = 0, getProperty('unspawnNotes.length') - 1 do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'TAILSNOTE_assets');
		end
	end
end