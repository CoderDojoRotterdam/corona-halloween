-----------------------------------------------------------------------------------------
--
-- Enemy.lua
--
-----------------------------------------------------------------------------------------
Enemy = {};

Enemy.new = function(x,y)
	
	--------------------------------------
	-- ====== Pampoen attributen ====== --
	--------------------------------------

	local self = {};
	self.speed = -5;
	self.direction = self.speed;
	self.destruction = false;
	self.alive = true;

	-----------------------
	-- Spritesheet setup --
	-----------------------
	local spriteSheetSequence = {
		
		-- Walking sequence
		{
			name = "walk",
			start = 1,
			count = 12,
			time = 1000,
			loopCount = 0,
			loopDirection = "forward"

		},
		-- Die sequence
		{
			name = "die",
			start = 13,
			count = 22,
			time = 1000,
			loopCount = 1,
			loopDirection = "forward"

		}

	};
	
	self.pumpkin = display.newSprite( resourceMgr.getAsset("pumpkin"), spriteSheetSequence );
	self.pumpkin.id = "pumpkin";
	self.pumpkin.x = x;
	self.pumpkin.y = y;
	self.pumpkin:play();

	---------------------
	-- Animation event --
	---------------------
	local function animationEnder(event)

		local thisSprite = event.target;

		if(thisSprite.sequence == "die") then
			
			if(event.phase == "ended") then

				thisSprite.id = "pumpkinDestroy";
			end
		end
		
	end
	self.pumpkin:addEventListener( "sprite", animationEnder );

	-----------------------
	-- Click/touch event --
	-----------------------
	local function onTouchPumpkin(self, event)

		if(event.phase == "began") then

			self.id = "pumpkinDie";
			
		end

		return true;
	end

	self.pumpkin.touch = onTouchPumpkin;
	self.pumpkin:addEventListener( "touch", self.pumpkin );

	---------------------
	-- Other functions --
	---------------------
	self.destroyEnemy = function() 

		if self.alive == true then
			self.alive = false;
			self.pumpkin:removeSelf();
		end
				
	end

	self.setDestroyState = function()
		
		self.pumpkin.id = "pumpkin";
		self.pumpkin:setSequence("die");
		self.pumpkin:play();
		self.destruction = true;
	end

	self.move = function()

		if self.destruction ~= true then

			---------------------------------------
			-- ====== Een lopende pampoen ====== --
			---------------------------------------
			
			-- Code Here
		end
	end

	self.changeDirection = function ()

		self.direction = self.direction * -1;
		self.pumpkin:scale(-1,1);

	end

	self.getDestructionState = function() return self.pumpkin.id; end

	self.getSprite = function() return self.pumpkin; end

	return self;
end