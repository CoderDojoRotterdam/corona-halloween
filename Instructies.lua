--[[
Mobile Game Development met de Corona SDK!

Met de Corona SDK gaan we aan de slag met een Halloween game! 
De taal die we gaan gebruiken is Lua, een scripting taal voor snelle game development!

We hebben verschillende niveaus voor elke Ninja. Dus als je een beginnend Ninja bent, dan kun je makkelijk en snel
de beginner mode volgen en snel en makkelijk game bouwen en spelen! Ben je snel klaar en je wil meer doen? Dan kun je de 
normal mode volgen om het spel uit te kunnen breiden met nieuwe monsters! Als het nog steeds makkelijk is, dan kun je 
voor hard mode gaan en de spel uitbreiden met uitdagende features!

Volg de instructies goed en als je vragen hebt, wees niet bang om je aan Sensei hulp te vragen!

Success Ninja en bouw een awesome game!
--]]

----------
-- TIPS -- 
----------

--[[
	
	* Alle codes worden in main.lua en enemy.lua geschreven
	
	* Elke stap heeft zijn eigen CodeBlok in main.lua om aan te geven waar je je code moet schrijven. 
	De hoofstukken zien er zo uit:
	
	----------------------------
	-- ====== CodeBlok ====== --
	----------------------------
	
	* LETOP: Sommige stappen gebruiken meerdere CodeBlokken, dus lees de instructies goed door!
	
	* Als je ergens vast loopt, vraag aan een van je mede-ninjas voor hulp. Ninjas laten niemand achter, dus als
	je zelf wat verder bent, help je mede ninjas! Met samenwerken, kun je alles oplossen!
	
	* Als er iets is die echt moeilijk is, wees niet bang om je Sensei voor hulp te vragen! Een Sensei laat ook geen Ninja achter! 
	
--]]

--------------
-- Beginner -- 
--------------

--[[
	
	===============================================
	=== STAP 1: Het begin van een nieuwe wereld ===
	===============================================
	
	CodeBlokken: "Game Achtergrond"-(main.lua)
	
	Welkom Ninja! Als het goed is heb je al je je Corona Simulator aan en je SublimeText2 open. Een Ninja is altijd gooed voorbereid!
	Als je naar de simulator kijkt, dan zie je alleen een swart scherm. Niet echt een spel, maar daarom ben jij hier! Om te beginnen gaan de 
	game een achtergrand geven. Het is Halloween dus we gaan de game een griezilige achtergrond geven! Je kan het in het volgende manier doen:
		
		** Code om een nieuwe achtergond image te kunnen laden - CodeBlok: Game Achtergrond **
		
			local gameBackground = display.newImage("Assets/background.png");
	
	Je hebt een achtergrond gegeven maar iets is niet goed... De achtergrond is te groot en op de verkeerde plek! Gelukkig hebben we de 
	mogelijkheid om de achtergrond aan te passen! De achtergrond aanpassen kunnen we in de volgende manier doen:
	
		** Code om de achtergrond van plek te veranderen - CodeBlok: Game Achtergrond **
		
			gameBackground:translate(0, 0);
		
		** Code om de achtergrond groter of kleiner te maken - CodeBlok: Game Achtergrond **
		
			gameBackground:scale(0, 0);
			
	Speel met de nummers en kijk wat er gebeurd! Probeer de achtergrond op de goede plek te zetten en een goede grootte geven!
	Heb je de goede waarden? Laat het aan je mede-ninjas en Sensei zien!
	
	
	==============================================
	=== STAP 2: Het aanval van enge pompoenen! ===
	==============================================
	
	CodeBlokken: "Variabelen"-(main.lua), "Maak een enge Pompoen"-(main.lua), "GameLoop"-(main.lua)
	
	Goed gedaan Ninja, je hebt je eigen wereld gemaakt! Maar er is nog geen leven, daar ben je hier voor Ninja, je gaat de goed en de kwaad maken!
	Laten we eerst beginnen met de kwaad. Hiervoor gaan we een enge lopende pompoen in de wereld zetten!
	
	Als eerste, hebben een array nodig om onze enge pompoenen erin te kunnen stoppen. Met een array, kunnen we de pompoenen makkelijk en snel aanpassen en
	controleren. Om een array te maken, kun je de volgende code gebruiken:
	
		** Array voor de pompoenen - CodeBlok: Variabelen **
		
			local enemies = {};
	
	Een array is gemaakt! Nu ga je de array invullen met de enge pompoenen en tot leven brengen in de wereld! Je kan het in de volgende manier doen:
	
		** Code om pompoenen te maken - CodeBlok: Maak een enge Pompoen **
		
			if tableLength(enemies) < totalEnemies then
				
				table.insert(enemies, Enemy.new(0,0));
			
			end
	
		== UITLEG ==
		
			De code ziet er een beetje moeilijk uit, maar het is vrij simpel! We gaan het stap voor stap doornemen en kijken wat elke gedeelte doet.
			
			Als eerste, kun je het misschien herkennen van de andere programeer talen. De "if" statement. In Lua schrijf je het in de volgende manier:
			
				if waardeA < waardeB then
					-- Voer code uit
				end
				
				Voorbeeld:
				
				local waardeA = 5;
				local waardeB = 10;
				
				if waardeA < waardeB then
					
					print("Waarde A is minder dan waarde B!");
					
				end
				
			De volgende code zorgt ervoor dat je een nieuwe enge pompoen aanmaakt en in een array stoppen:
			
				table.insert(array, waarde);
				
			De array is dus enemies en de waarde is de pompoen die wordt aangemaakt.
			In plaats van waarde zetten we dan:
				
				Enemy.new(0,0)
				
			Hier maak je een nieuwe enemy aan en je moet de posities doorgeven (0,0).
			
		== EINDE UITLEG ==
		
	Speel met de waarden en zet de pompoenen op een goede plek! Je kan ook een random waarde doorgeven! Dit kun je doen door
	de volgende code te gebruiken:
	
		math.random(A, B);
		
		Voorbeeld:
		
		local randomNummer = math.random(0, 10);
		
		print(randomnummer);
		
		-- print een random nummer tussen 0 en 10
		
	Probeer de code te combineren!
	
	== EXTRA == 
	
		** Automatisch pompoenen aanmaken - CodeBlok: GameLoop -(main.lua) **
		
		De stukje code die je net heb geschreven is in een gameloop. Een gameloop voert een code uit bij elke frame. Een frame wordt bedoeld
		dat de scherm wordt elke keer refreshed en hertekent nieuwe fotos, sprites, etc. Maar die frames wordt elke milliseconde refreshed, dus 
		er worden heel veel pompoenen getekend en dit zorgt ervoor dat de game crashed! We willen natuurlijk wereld met te veel enge pompoenen!
		
		Daarom zijn er een aantal variabelen gemaakt om ervoor te zorgen dat er een limiet is voor de enge pompoenen. Je kan met de volgende
		variabelen spelen en kijken wat er allemaal gebeurd!
		
			-- Dit zorgt ervoor dat er elke 3 seconde een pompoen wordt gemaakt!
			local spawnStart = 3;
			
			-- Dit zorgt ervoor dat er in totaal 5 pompoenen gemaakt kan worden. Niet meer!
			local totalEnemies = 5;
			
		Speel met de waarden en bepaal zelf hoe vaak en hoeveel pompoenen worden gemaakt!
	
	== EINDE EXTRA ==
	
	
	========================================
	=== STAP 3: De enge pompoenen lopen! ===
	========================================
	
	CodeBlokken: "Een lopende pompoen"-(enemy.lua), "Pompoen attributen"-(enemy.lua)

	LETOP: Haal de twee streepjes voor "updateSprites()" weg om de code te laten draaien! Die kun je vinden bij de gameloop functie.
	
	Je wordt nog steeds beter Ninja! We hebben een wereld met enge pompoenen, maar ze blijven allemaal op een plek. Ze zijn wel aan het bewegen, maar
	ze weten niet waar! Jij gaat ervoor zorgen dat ze een bepaalde richting moet lopen! Een enge pompoen kan niks doen als ze nergens kunnen bewegen!
	Jr kan de volgende code gebruiken:
	
		** Code om pompoenen te laten bewegen - CodeBlok: Een lopende pompoen  **
		
			self.pumpkin.x = self.pumpkin.x + self.direction;

		** Code voor de snelheid van de pompoen - CodeBlok: Pompoen attributen **
		
			self.speed = -5;
			
	Zet de code op de goede plek en bepaal zelf de snelheid!
	
	Je hebt een pompoen gemaakt die beweegt maar hij loopt buiten de scherm! Nu wordt het een uitdaging Ninja! Hoe kan je ervoor zorgen
	dat de pompoen niet buiten de scherm loopt? Probeer het maar en werk samen met je mede-Ninjas! Hier zijn een paar tips:
	
		-- Maak gebruik van de if statement!
		
			if ... >= ... then
				-- Verander richting!
			end
			
			if ... <= ... then
				-- Verander richting!
			end
		
		-- Verander de richting van de pompoen
		self.changeDirection();
		
		-- Huidige positie van de pompoen
		self.pumpkin.x
		
	Kom je niet eruit? Vraag het maar aan de Sensei!
	
	
	==========================================
	=== STAP 4: De enge pompoenen stoppen! ===
	==========================================
		
	CodeBlokken: "Pompoenen stoppen!"-(main.lua), "Variabelen"-(main.lua)

	LETOP: Haal de twee streepjes voor "clearEnemyArray()" weg om de code te laten draaien! Die kun je vinden bij de gameloop functie.
		
	Goed gedaan Ninja! Je hebt een wereld gemaakt vol met pompoenen, maar nu lopen ze rond en de mensen van die wereld zijn bang! Het is tijd om de 
	pompoenen te stoppen! Je kan al op de pompoen klikken of aanraken(op de mobiel) maar er gebeurd nog niks, dus het is nu aan jou om de laatste stuk 
	code te schrijven! Gebruik de volgennde code:
		
		** Stop de pompoen! - CodeBlok: Pompoenen stoppen! **
		enemy.setDestroyState();
		
	Zet de code op de goed plek en dan ben je klaar! Nu kan je pompoenen stoppen en de wereld redden!
	
	== EXTRA == 
	
		Voor je laatste uitdaging als Beginner Mobile Ninja, kun je een score toevoegen om bij te houden hoeveel enge pompoenen je heeft gestopt!
		Werk samen met je mede-ninjas en maak een score die het aantal gestopte pompoenen bijhoudt! Hier zijn de tips:
		
		-- variabel om de score bij te kunnen houden
		local score;
		
		== UITLEG ==
			
			Je kan berekeningen doen met variabelen bijvoorbeeld:
			
			local a = 4;
			
			local b = a + 1;
			
			print(b);
			
			-- UIT: 5
			
		== EINDE UITLEG ==
		
		-- variabel met een text en weergeven
		local scoreText = display.newText( "text", 0, 0, native.systemFont, 16 );
		
		== UITLEG ==
			
			-- dit is een stuk code om een text te laten zien met een bepaalde positie, grootte en font
			display.newText( "text", 0, 0, native.systemFont, 16 );
			
			De parameters zijn:

			display.newText( string, positie X, positie Y, lettertype, size );
			
			Je kan ook variablen toevoegen aan een string door:
			
			local age = 21;
			local text = "Ik ben " .. age
			
			print(text);
			
			-- UIT: "Ik ben 21"
			
		== EINDE UITLEG ==
		
		-- Text veranderen van een text element
		scoreText.text = "New text";
		
		Er zijn twee plekken waat je do code moet zetten, bij "Pompoenen stoppen!" en "Variabelen".
		Zet alles op de goede plek!
		
	== EINDE EXTRA == 
	
	En dat was het laatste stap Ninja! Je bent geslaagd als een Beginner Mobile Game Developer! 
	Gefiliciteerd en vergeet niet om van je spel te genieten!
	
	Wil je nog meer uitdagingen? Vraag het aan de Sensei! 
--]]
