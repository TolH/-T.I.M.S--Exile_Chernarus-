/*
										-=TolH=- 
									(RadioTower_Timer.sqf)
									Track RadioTower Timer.
				Usage: 
				nul_script8 = [] execVM RADIOTOWER_TIMER;
				
				This will ADD reinforcment to the radiotower area every X minutes.
				If AI Take radiotower back, TIMER resetart.
*/
//============================================////============================================//
	//START RADIOTOWER_TIMER
	RTcountAI = 0;
	RTcountPL = 0;
		//START MAIN TIMER
		while {RADIOTOWER_StartTimer >= 1} do 
		{
			//START AI TIMER
			while {RADIOTOWER_StartTimer isEqualTo 2} do 
			{
			  RTcountAI = RTcountAI + 1;
			  uiSleep 1;
				//SEND REINFORCMENT #1
				if (RTcountAI isEqualTo 300) then 
				{
					//SEND AI
					
				};
				//SEND REINFORCMENT #2
				if (RTcountAI isEqualTo 600) then 
				{
					//SEND AI
					
				};
				//SEND REINFORCMENT #3
				if (RTcountAI isEqualTo 900) then 
				{
					//SEND AI
					showNotification = ["RadioTowerTakenByAI", "The AI claimed the radiotower after holding it for over 15mins."]; publicVariable "showNotification";
					"Radio-Tower" setMarkerColor "ColorOrange";
					"Radio-Tower" setMarkerText " (Claimed by: (AI)";
					//LAST TIMER REACHED CLAIM RADIOTWER AI AND STOP MAIN MISSION CHECK
					RADIOTOWER_CLAIMED = 1;
					//STOP TIMER EXIT SECONDARY LOOP
					RADIOTOWER_StartTimer = 0;
				};
			};
			//START PLAYER TIMER
			while {RADIOTOWER_StartTimer isEqualTo 3} do 
			{
			  RTcountPL = RTcountPL + 1;
			  uiSleep 1;
				//SEND REINFORCMENT #1
				if (RTcountPL isEqualTo 300) then 
				{
					//SEND AI
					
				};
				//SEND REINFORCMENT #2
				if (RTcountPL isEqualTo 600) then 
				{
					//SEND AI
					
				};
				//SEND REINFORCMENT #3
				if (RTcountPL isEqualTo 900) then 
				{
					//SEND AI
					showNotification = ["RadioTowerTakenByPlayer", "You have claimed the radiotower after holding it for over 15mins."]; publicVariable "showNotification";
					//LAST TIMER REACHED CLAIM RADIOTWER PLAYER AND STOP MAIN MISSION CHECK
					"Radio-Tower" setMarkerColor "ColorGreen";
					"Radio-Tower" setMarkerText " (Claimed by: (Players)";
					RADIOTOWER_CLAIMED = 2;
					//STOP TIMER EXIT SECONDARY LOOP
					RADIOTOWER_StartTimer = 0;
				};
			};
		};