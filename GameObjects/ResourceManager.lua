-----------------------------------------------------------------------------------------
--
-- ResourceManager.lua
--
-----------------------------------------------------------------------------------------
ResourceManager = {};

ResourceManager.new = function()
	
	local self = {};
	sheetSettings = {};
	spriteSheets = {};

	---------------------
	-- Load all assets --
	---------------------

	self.loadAssets = function()

		sheetSettings["pumpkin"] = {
			
			width = 65,
			height = 65,
			numFrames = 22
		};
		spriteSheets["pumpkin"] = graphics.newImageSheet( "Assets/PumpkinSheet.png", sheetSettings["pumpkin"] );

	end

	---------------
	-- Get asset --
	---------------
	self.getAsset = function(asset)

		return spriteSheets[asset];

	end

	return self;
end