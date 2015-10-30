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
local gameBackground = display.newImage("Assets/background.png");
gameBackground:translate(240, 160);
gameBackground:scale(0.62, 0.62);


------------------------------
-- ====== Variabelen ====== --
------------------------------
local enemies = {};
local textFields = {};
local score = 0;

textFields["score"] = display.newText( "Score: "..score, 10, 20, native.systemFont, 16 );

----------------------------
-- ====== GameLoop ====== --
----------------------------
local gameTime = 0;
local spawnStart = 3;
local spawnCount = spawnStart;
local totalEnemies = 3;
local function gameloop( event )
	
	
	clearEnemyArray();

	gameTime = event.time/1000;

	if gameTime >= spawnCount then

		-----------------------------------------
		-- ====== Maak een enge Pampoen ====== --
		-----------------------------------------
		
		print(tableLength(enemies));

		if tableLength(enemies) < totalEnemies then
			table.insert(enemies, Enemy.new(500, math.random(240, 290)));
		end
		
		spawnCount = spawnCount + spawnStart;
		
	end

	updateSprites();
	
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

		--print(key .. " belongs to " .. enemy.getDestructionState());

		if enemy.getSprite() ~= nil then

			if enemy.getDestructionState() == "pumpkinDestroy" then

				enemy.destroyEnemy();
				table.remove( enemies, key );
				break;

			elseif enemy.getDestructionState() == "pumpkinDie" then

				--------------------------------------
				-- ====== Pampoenen stoppen! ====== --
				--------------------------------------

				enemy.setDestroyState();

				
				score = score + 10;

				if score <= 9999 then
					textFields["score"].text = "Score: " .. score;
				end
				
				

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