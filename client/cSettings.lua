
settings = {}

-- Seed random generator.
math.randomseed(os.time())
math.random()

----------------------------------------------------------------------------------------------------
-- Racing
----------------------------------------------------------------------------------------------------

settings.blockedInputs = {
	Action.FireLeft , -- Blocks firing weapons on foot.
	Action.FireRight , -- Blocks firing weapons on foot.
	Action.McFire , -- Blocks firing one-handed weapons on bike/ATV.
	Action.VehicleFireLeft , -- Blocks firing vehicle weapons.
	Action.VehicleFireRight , -- Blocks firing vehicle weapons.
	Action.NextWeapon , -- Blocks switching weapons.
	Action.PrevWeapon , -- Blocks switching weapons.
	-- Action.StuntJump , -- Prevents people from riding on cars and hopping on people's bikes.
}
-- Not sure if all of these work.
settings.blockedInputsStartingGrid = {
	Action.Accelerate ,
	Action.Reverse ,
	Action.HeliIncAltitude ,
	Action.HeliDecAltitude ,
	Action.PlaneIncTrust ,
	Action.PlaneDecTrust ,
	Action.BoatForward ,
	Action.BoatBackward ,
}

-- Make sure everyone doesn't send their distance at the same time.
settings.sendCheckpointDistanceInterval = 0.4 + math.random() * 0.027

settings.gamemodeName = "Racing"

settings.gamemodeDescription = [[
The Racing gamemode lets you race other players in a variety of races, using vehicles from sports cars to buses to planes. It comes with a fully-featured GUI, letting you focus on the race.
 
Command list:
   "/race" - Begins a race, if the race is accepting players.
   "/race quality high" - (default)
   "/race quality low" - Lowers quality of GUI; makes checkpoint arrow flat and removes minimap icons. This won't affect your framerate much, only use it if you're desperate.
 
Earning money: You receive $10000 for winning a race. Each following finisher receives 75% of the last finisher (2nd place receives $7500, for example).
 
Known issues:
During races, sometimes the checkpoint arrow will be invisible. You can probably fix this by reconnecting to the server (press ~ to open the console and enter "reconnect").
]]


----------------------------------------------------------------------------------------------------
-- GUI
----------------------------------------------------------------------------------------------------

settings.backgroundColor = Color(38 , 26 , 15 , 110)
settings.backgroundAltColor = Color(5 , 6 , 12 , 90)
settings.textColor = Color(228 , 142 , 56 , 255)
settings.shadowColor = Color(0 , 0 , 0 , 255)

-- Normalized.
settings.startingGridBackgroundTopRight = Vector2(0.88 , -0.92)
-- Normalized.
settings.startingGridBackgroundSize = Vector2(0.35 , 0.105)
settings.startingGridTextSize = "Large"

settings.padding = 6

settings.checkpointArrowFlashNum = 3
settings.checkpointArrowFlashInterval = 7
settings.checkpointArrowColor = Color(204 , 54 , 51)
-- settings.checkpointArrowColorActivated = Color(56 , 200 , 45)
settings.checkpointArrowColorActivated = Color(0 , 0 , 0 , 0)

settings.nextCheckpointArrowColor = Color(228 , 142 , 56 , 128)

-- Normalized positions.
settings.lapLabelPos = Vector2(0.33 , -0.58)
settings.lapLabelSize = "Large"
settings.lapCounterPos = Vector2(0.33 , -0.68)
settings.lapCounterSize = "Huge"

settings.racePosLabel = "Pos"
settings.racePosLabelPos = Vector2(-0.33 , -0.58)
settings.racePosLabelSize = "Large"
settings.racePosPos = Vector2(-0.33 , -0.68)
settings.racePosSize = "Huge"

settings.timerLabelsStart = Vector2(0.95 , -0.39)
settings.timerLabelsSize = "Default"

settings.minimapCheckpointColor1 = Color(245 , 25 , 19)
settings.minimapCheckpointColor2 = Color(245 , 100 , 19 , 112)
settings.minimapCheckpointColorGrey1 = Color(180 , 170 , 150 , 255) -- Inside
settings.minimapCheckpointColorGrey2 = Color(130 , 70 , 60 , 220) -- Border

-- Normalized.
settings.leaderboardPos = Vector2(-0.95 , -0.39)
settings.leaderboardTextSize = "Default"
settings.leaderboardMaxPlayers = 8
settings.maxPlayerNameLength = 16

settings.largeMessageTextSize = "Huge"
settings.largeMessageBlendRatio = 0.1
settings.largeMessagePos = Vector2(0 , -0.2)

-- 0 = default
-- -1 = No minimap icons and low quality checkpoint arrow.
settings.guiQuality = 0

settings.useNametags = false
