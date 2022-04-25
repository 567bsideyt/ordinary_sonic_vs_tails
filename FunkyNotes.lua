function onUpdate()
	gurg = ((getPropertyFromClass('Conductor', 'songPosition') / 1044)*(bpm/135))
    if curStep >= 896 and curStep < 1036 then
		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY1 + 5 * math.sin((gurg + i*0.25) * math.pi), i)
		end
	end
end