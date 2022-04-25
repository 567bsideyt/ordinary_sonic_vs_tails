function onCreate()
	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Elapsed')
	screenCenter('cTimeBarBG', 'xy')
	screenCenter('cTimeBarFG', 'xy')
	screenCenter('timeTxt', 'xy')
	setTextSize("timeTxt", 45)

    if downscroll then
		makeLuaSprite('score', 'score', 750, 105)
		scaleObject('score', 1, 1);
		setObjectCamera('score', 'hud')
		addLuaSprite('score', true)

		makeLuaSprite('time', 'time', 150, 680)
		scaleObject('time', 1, 1);
		setObjectCamera('time', 'hud')
		addLuaSprite('time', true)

		setProperty('timeTxt.x', '150')
		setProperty('timeTxt.y', '670')
    else

	
	makeLuaSprite('time', 'time', 150, 12)
	scaleObject('time', 1, 1);
	setObjectCamera('time', 'hud')
	addLuaSprite('time', true)

	makeLuaSprite('score', 'score', 750, 670)
	scaleObject('score', 1, 1);
	setObjectCamera('score', 'hud')
	addLuaSprite('score', true)

	setProperty('timeTxt.x', '150')
	setProperty('timeTxt.y', '0')
	end
end

function onCreatePost()

    makeLuaText("scoretext", "skill issue", 1200, getProperty('healthBarBG.x'), getProperty('healthBarBG.y') + 20)
    setTextSize("scoretext", 45)
    setTextFont("scoretext", "sonic-1-hud-font.ttf");
    setTextBorder("scoretext", 1, '000001')
    addLuaText("scoretext")
end

local SongTime=1
function onSongStart()
	setProperty('timeBar.visible', false);
	setProperty('timeBarBG.visible', false);
	setProperty('timeTxt.visible', true);
	setTextFont("timeTxt", "sonic-1-hud-font.ttf")

end


function onUpdatePost(elapsed)
    setProperty("scoreTxt.y", -100)
    setTextString("scoretext", '' .. getProperty('songScore'))
end

function onDestroy()
    setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Left')
end