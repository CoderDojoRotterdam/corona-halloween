-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--------------
-- requires --
--------------

-- Load assets
require "GameObjects.ResourceManager"
resourceMgr = ResourceManager.new();
resourceMgr.loadAssets();

require "GameObjects.Enemy"

------------------------------------
-- ====== Game Achtergrond ====== --
------------------------------------
-- Code Here


------------------------------
-- ====== Variabelen ====== --
------------------------------
-- Code Here

----------------------------
-- ====== GameLoop ====== --
----------------------------
local gameTime = 0;
local spawnStart = 3;
local spawnCount = spawnStart;
local totalEnemies = 3;
local function gameloop( event )
	
	--clearEnemyArray();

	gameTime = event.time/1000;

	if gameTime >= spawnCount then

		-----------------------------------------
		-- ====== Maak een enge Pompoen ====== --
		-----------------------------------------
		
		-- Code Here
		
		spawnCount = spawnCount + spawnStart;
		
	end

	--updateSprites();
	
end 

Runtime:addEventListener( "enterFrame", gameloop )

--------------------
-- Sprite updates --
--------------------

function updateSprites()

	for i, enemy in ipairs(enemies) do
		
		if enemy.getSprite() ~= nil then

			enemy.move();
			
		end
		
	end

end

--------------------
-- Sprite cleanup --
--------------------
function clearEnemyArray()
	
	for key, enemy in pairs(enemies) do

		if enemy.getSprite() ~= nil then

			if enemy.getDestructionState() == "pumpkinDestroy" then

				enemy.destroyEnemy();
				table.remove( enemies, key );
				break;

			elseif enemy.getDestructionState() == "pumpkinDie" then

				--------------------------------------
				-- ====== Pompoenen stoppen! ====== --
				--------------------------------------

				-- Code Here
				
				

				break;

			end
		end

	end
	
end

----------------------
-- Helper functions --
----------------------

-- Get table length
function tableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
