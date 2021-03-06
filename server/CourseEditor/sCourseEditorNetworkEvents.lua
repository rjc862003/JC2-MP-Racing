
function CourseEditor:SubscribeNetworkEvents()
	
	local NetworkSub = function(name)
		table.insert(
			self.networkEvents ,
			Network:Subscribe("CE"..name , self , self["Network"..name])
		)
	end
	
	NetworkSub("AddCP")
	NetworkSub("RemoveCP")
	NetworkSub("AddSpawn")
	NetworkSub("RemoveSpawn")
	NetworkSub("SetCourseInfo")
	
	NetworkSub("TestDrive")
	NetworkSub("SaveCourse")
	NetworkSub("LoadCourse")
	
	NetworkSub("Exit")
	
end

-- Helps with making sure client doesn't spam us with network events.
function CourseEditor:GetCanPlayerDoActions(player)
	
	local playerInfo = self.players[player:GetId()]
	-- Make sure this player is ours.
	if playerInfo == nil then
		return false
	end
	
	-- Prevents spawning spam.
	local timer = playerInfo.timer
	if timer then
		if timer:GetSeconds() < settingsCE.actionRateSeconds then
			-- Timer still active, abort.
			return false
		else
			-- Expire timer.
			playerInfo.timer = nil
		end
	end
	
	-- Set timer.
	playerInfo.timer = Timer()
	
	return true
	
end

function CourseEditor:NetworkAddCP(position , player)
	
	if self:GetCanPlayerDoActions(player) == false then
		return
	end
	
	self:AddCP(position)
	
end

function CourseEditor:NetworkRemoveCP(position , player)
	
	if self:GetCanPlayerDoActions(player) == false then
		return
	end
	
	self:RemoveCP(position)
	
end

function CourseEditor:NetworkAddSpawn(args , player)
	
	if self:GetCanPlayerDoActions(player) == false then
		return
	end
	
	local position = args[1]
	local angle = args[2]
	local modelIds = args[3]
	
	self:AddSpawn(position , angle , modelIds)
	
end

function CourseEditor:NetworkRemoveSpawn(position , player)
	
	if self:GetCanPlayerDoActions(player) == false then
		return
	end
	
	self:RemoveSpawn(position)
	
end

function CourseEditor:NetworkSetCourseInfo(courseInfo)
	
	self.course.name = courseInfo.name
	self.course.type = courseInfo.type
	self.course.numLaps = courseInfo.numLaps
	self.course.timeLimitSeconds = courseInfo.timeLimitSeconds
	
	self:NetworkSend("CESetCourseInfo" , self.course:MarshalInfo())
	
end

function CourseEditor:NetworkTestDrive(nilArgs , player)
	
	local playerInfo = self.players[player:GetId()]
	-- Make sure this player is ours.
	if playerInfo == nil then
		return false
	end
	
	self:TestDrive()
	
end

function CourseEditor:NetworkSaveCourse()
	
	self:SaveCourse()
	
end

function CourseEditor:NetworkLoadCourse(name)
	
	self:LoadCourse(name)
	
end

function CourseEditor:NetworkExit(nilArgs , player)
	
	if self:GetCanPlayerDoActions(player) == false then
		return
	end
	
	self:RemovePlayer(player , "Exited.")
	
end
