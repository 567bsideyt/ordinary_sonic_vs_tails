function onCreate()
    setProperty('introSoundsSuffix', 'muted')
    makeLuaSprite('blueBG', 'bluething', 0, -1200)
    makeLuaSprite('daRed', 'redthing', 1200, 0)
    makeLuaSprite('yewish', 'yellowthing', 1200, 0)
    makeLuaSprite('daText', 'zonetext', -1200, 0)

    
    setObjectCamera('blueBG', 'other')
    setObjectCamera('daRed', 'other')
    setObjectCamera('yewish', 'other')
    setObjectCamera('daText', 'other')

    addLuaSprite('blueBG', true)
    addLuaSprite('daRed', true)
    addLuaSprite('yewish', true)
    addLuaSprite('daText', true)
end

function onUpdatePost()
	setProperty('countdownReady.visible', false)
	setProperty('countdownSet.visible', false)
end


function onCountdownStarted()
	runTimer('yomama', 1.5, 0)
    doTweenX('yewTweenX', 'yewish', 0, 0.4, 'circOut')
    doTweenX('redTweenX', 'daRed', 0, 0.5, 'circOut')
    doTweenY('blueyTweenX', 'blueBG', 0, 0.5, 'circOut')
    doTweenX('textTweenX', 'daText', 0, 0.4, 'circOut')
end

function onTimerCompleted(tag, loop, loopsLeft)

	doTweenY('removebg', 'blueBG', -1200, 0.5, 'linear')
    
    doTweenX('redTweenX', 'daRed', -1200, 0.5, 'circOut')
    doTweenX('yewTweenX', 'yewish', 1200, 0.2, 'circOut')
	doTweenX('textTweenX', 'daText', 1200, 0.5, 'circOut')

        doTweenAlpha('removered', 'daRed', 0, 1, 'circOut')
        doTweenAlpha('removebg', 'blueBG', 0, 1, 'circOut')
        doTweenAlpha('removetext', 'daText', 0, 1, 'circOut')
        doTweenAlpha('removeyew', 'yewish', 0, 1, 'circOut')
end

