/*
										-=TolH=- 
									(Bunker_Timer.sqf)
									Track Bunker Timer.
				Usage: 
				nul_script8 = [] execVM BUNKER2_TIMER;
				
				This will ADD reinforcment to the bunker area every X minutes.
				If AI Take bunker back, TIMER resetart to 1. If RadioTower is destroyed, Disable then disable reinforcments.
*/
//============================================////============================================//
	//START TIMER
	_count2 = 0;
		//SEND REINFORCEMENT AFTER A WHILE IF BUNKER IS PLAYER OWNED
		while {StartTimer2 isEqualTo 1} do 
		{
			//wait for timer while loop method
			while {_count2 < 900 && StartTimer2 isEqualTo 1} do 
			{
			  _count2 = _count2 + 1;
			  uiSleep 1;
				//SEND REINFORCMENT #1
				if (_count2 isEqualTo 300) then 
				{
					Bunker2_AI_GROUP2 = 1;
				};
				//SEND REINFORCMENT #2
				if (_count2 isEqualTo 600) then 
				{
					Bunker2_AI_GROUP2 = 2;
				};
				//SEND REINFORCMENT #3
				if (_count2 isEqualTo 900) then 
				{
					Bunker2_AI_GROUP2 = 3;
					_count2 = 901;
				};
			};
			if (_count2 >= 901) then 
			{
				StartTimer2 = 0;
			};
		};