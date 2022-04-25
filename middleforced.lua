function onUpdate()
    if middlescroll then
    --nothing lol
      else
         MoveNote()
    end
end
  
  function MoveNote()
      noteTweenX('middle', 4, defaultPlayerStrumX0 - 320, 0.01, 'linear')
      noteTweenX('middle1', 5, defaultPlayerStrumX1 - 320, 0.01, 'linear')
      noteTweenX('middle2', 6, defaultPlayerStrumX2 - 315, 0.01, 'linear')
      noteTweenX('middle3', 7, defaultPlayerStrumX3 - 315, 0.01, 'linear')
  end