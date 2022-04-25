
local defX = 550;                         -- Default x position
local defY = 140;                     -- Default y position

local followCam = false;  -- followCam true is not avaible . ask Ammar
local SIZE = 5;


local beatScale = 0.2; -- bounce when beat


------------------------------- for advanced only

local targetFound = false;
local startBop = false;

local customX = -9999;
local customY = -9999;

-- script By An Ammar

function onCreatePost()

	makeLuaText("yyyyy", "", 1, 0,0) -- for moving SPRITE


end




function onUpdatePost()
	if inGameOver then 
          if followCam then
			   setProperty("continueImage.x", defX + (getProperty("camFollow.x") - getProperty("camFollowPos.x")) )
			   setProperty("continueImage.y", defY + (getProperty("camFollow.y") - getProperty("camFollowPos.y")) )
          end


			if startBop then
				if getProperty("boyfriend.animation.curAnim.curFrame") == 1 then 
					beat(beatScale, 0.4)
				end
			end
	end

	-- var lerpVal:Float = CoolUtil.boundTo(elapsed * 0.6, 0, 1);
	--camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));
end


function beat(custom, dur)
	
	cancelTween("dmsx")
	cancelTween("dmsy")
	setProperty("continueImage.scale.x", SIZE + custom)
	setProperty("continueImage.scale.y", SIZE + custom)
	doTweenX("dmsx", "continueImage.scale", SIZE, dur, "quadOut")
	doTweenY("dmsy", "continueImage.scale", SIZE, dur, "quadOut")
end

function onGameOverStart()
   makeLuaSprite("continueImage", "continue", getProperty("camFollow.x"), getProperty("camFollow.y"))
   if not followCam then
	   setObjectCamera("continueImage", "hud")
      SIZE = SIZE / 1.2
   else  
      setObjectCamera("continueImage", "game") 
      
   end
   setGraphicSize("continueImage", getProperty("continueImage.width") * SIZE)

	setProperty("continueImage.antialiasing", false)
   

	addLuaSprite("continueImage", true)
	setProperty("continueImage.alpha", 0)

   if followCam then
     
   else  
      setProperty("continueImage.y", -60 + 600)
      setProperty("continueImage.x", 250)
   end


	runTimer("Gamewait")
end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == "Gamewait" then 
      doTweenY("moveContinue", "continueImage", getProperty("continueImage.y") - 600, 2.5, "bounceOut")
		doTweenAlpha("continueAlpha", "continueImage", 1, 3)
		startBop = true;
	end
	if tag == "Gameend" then 
		doTweenAlpha("continueAlpha", "continueImage", 0, 2.2)
	end
end

function onGameOverConfirm(retry)
	if retry then 
		startBop = false;
		--cameraFlash("game", "0x66FFFFFF", 1,true)
		runTimer("Gameend", 0.5)
		beat(0.6, 0.7)
	end
end
