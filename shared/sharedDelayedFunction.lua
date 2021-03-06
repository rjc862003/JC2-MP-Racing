
class("DelayedFunction")
function DelayedFunction:__init(delay , func , firstArg)
	
	self.delay = delay
	self.func = func
	self.firstArg = firstArg
	self.timer = Timer()
	
	-- blargh
	if Server then
		self.event = Events:Subscribe("PreServerTick" , self , self.Update)
	else
		self.event = Events:Subscribe("PreClientTick" , self , self.Update)
	end
	
end

function DelayedFunction:Update()
	
	if self.timer:GetSeconds() >= self.delay then
		self.func(self.firstArg)
		Events:Unsubscribe(self.event)
	end
	
end
