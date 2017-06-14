/*
										    -=TolH=- 
									(Heli_Paradrop_Timer_1.sqf)
									  TIMER FOR HELIPARADROP
				Usage: 
				nul_script8 = [] execVM HELI_PARADROP_TIMER_1;
				
				This will ADD reinforcment to the area every X minutes.
*/
//============================================////============================================//
private["_countHP1","_HP_TIMER_1","_HP_TIMER_2","_HP_TIMER_3","_AI_NUMBER1","_AI_NUMBER2","_AI_NUMBER3","_AI_SKILLS1","_AI_SKILLS2","_AI_SKILLS3"];
//============================================////============================================//
	//SELECT TIMER 		ARRAY 0
	_HP_TIMER_1 = HP_WAVE_1 select 0;
	_HP_TIMER_2 = HP_WAVE_2 select 0;
	_HP_TIMER_3 = HP_WAVE_3 select 0;
	//SELECT AI_NUMBER 	ARRAY 1
	_AI_NUMBER1 = HP_WAVE_1 select 1;
	_AI_NUMBER2 = HP_WAVE_2 select 1;
	_AI_NUMBER3 = HP_WAVE_3 select 1;
	//SELECT AI_SKILLS 	ARRAY 2
	_AI_SKILLS1 = HP_WAVE_1 select 2;
	_AI_SKILLS2 = HP_WAVE_2 select 2;
	_AI_SKILLS3 = HP_WAVE_3 select 2;
	//SELECT AI_TARGET 	ARRAY 3
	_AI_TARGET1 = HP_WAVE_1 select 3;
	_AI_TARGET2 = HP_WAVE_2 select 3;
	_AI_TARGET3 = HP_WAVE_3 select 3;
//============================================////============================================//
	_countHP1 = 0;
		//SEND REINFORCEMENT AFTER A WHILE IF BUNKER IS PLAYER OWNED
		while {HeliTimer1 isEqualTo 1} do 
		{
			//wait for timer while loop method
			while {_countHP1 < _HP_TIMER_3} do 
			{
			  _countHP1 = _countHP1 + 1;
			  uiSleep 1;
				//SEND HELI_PARADROP #1 AT RADIOTOWER TO CLAIM IT
				if (_countHP1 isEqualTo _HP_TIMER_1) then 
				{
					//[LVgroup7] HP_WAVE1
					_LVgroup7 = [_AI_TARGET1,3,true,true,1500,"random",true,150,110,_AI_NUMBER1,0.5,50,true,true,false,true,"Radio-Tower",false,_AI_SKILLS1,nil,nil,7,false,false,["TOHL_HARD"]] execVM "TIMS\LV\heliParadrop.sqf";
					diag_log format ["-=T.I.M.S=-: HELI_PARADROP TIMER #1 REACHED. SENDING IN AI REINFORCEMENTS LVgroup7."];
					HP_WAVE1 = 1;
				};
				//SEND HELI_PARADROP #2
				if (_countHP1 isEqualTo _HP_TIMER_2) then 
				{
					//[LVgroup8] HP_WAVE2
					_LVgroup8 = [player,3,true,true,1500,"random",true,150,130,_AI_NUMBER2,0.6,75,true,true,false,true,player,false,_AI_SKILLS2,nil,nil,8,true,false,["TOHL_HARD"]] execVM "TIMS\LV\heliParadrop.sqf";
					diag_log format ["-=T.I.M.S=-: HELI_PARADROP TIMER #2 REACHED. SENDING IN AI REINFORCEMENTS LVgroup8."];
					HP_WAVE2 = 1;
				};
				//SEND HELI_PARADROP #3
				if (_countHP1 isEqualTo _HP_TIMER_3) then 
				{
					//[LVgroup9] HP_WAVE3
					_LVgroup9 = [player,3,true,true,1500,"random",true,150,130,_AI_NUMBER3,0.6,75,true,true,false,true,player,false,_AI_SKILLS3,nil,nil,9,true,false,["TOHL_HARD"]] execVM "TIMS\LV\heliParadrop.sqf";
					diag_log format ["-=T.I.M.S=-: HELI_PARADROP TIMER #3 REACHED. SENDING IN AI REINFORCEMENTS LVgroup9."];
					HP_WAVE3 = 1;
					//LAST TIMER REACHED, PREPARING TO EXIT
					_countHP1 = _HP_TIMER_3+1;
				};
			};
			//TIMER REACHED MAX LIMIT.
			if (_countHP1 >= _HP_TIMER_3+1) then 
			{
				//EXIT LOOP TIMER
				HeliTimer1 = 2;
			};
		};
	//DIAG_LOG AND HeliTimer1 CHECK
	diag_log format ["-=T.I.M.S=-: HELI_PARADROP COMPLETED! NO MORE TROOPS WILL BE SENT"];