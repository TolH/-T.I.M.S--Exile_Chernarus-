/*
										-=TolH=- 
									(Bunker_Timer.sqf)
									Track Bunker Timer.
				Usage: 
				nul_script8 = [] execVM BUNKER1_TIMER;
				
				This will ADD reinforcment to the bunker area every X minutes.
				If AI Take bunker back, TIMER resetart to 1. If RadioTower is destroyed, Disable then disable reinforcments.
*/
//============================================////============================================//
	//START TIMER
	_count1 = 0;
		//SEND REINFORCEMENT AFTER A WHILE IF BUNKER IS PLAYER OWNED
		while {StartTimer1 isEqualTo 1} do 
		{
			//wait for timer while loop method
			while {_count1 < 900 && StartTimer1 isEqualTo 1} do 
			{
			  _count1 = _count1 + 1;
			  uiSleep 1;
				//SEND REINFORCMENT #1
				if (_count1 isEqualTo 300) then 
				{
					Bunker1_AI_GROUP1 = 1;
				};
				//SEND REINFORCMENT #2
				if (_count1 isEqualTo 600) then 
				{
					Bunker1_AI_GROUP1 = 2;
				};
				//SEND REINFORCMENT #3
				if (_count1 isEqualTo 900) then 
				{
					Bunker1_AI_GROUP1 = 3;
					_count1 = 901;
				};
			};
			if (_count1 >= 901) then 
			{
				StartTimer1 = 0;
			};
		};