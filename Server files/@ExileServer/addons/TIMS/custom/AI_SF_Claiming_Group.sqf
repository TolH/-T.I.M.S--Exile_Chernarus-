/*
										    -=TolH=- 
									(AI_SF_Claiming_Group.sqf)
									  TIMER FOR CLAIMING_GROUP
				Usage: 
				nul_script8 = [] execVM AI_SF_CG;
				exemple:
				AI_SF_CG_WAVE_1	= [60, 5, 0.10]; // SET AI_SF_CG_WAVE_1 SETTINGS. Default=[300, 5, 0.10]; 	5MINS+5(AI)
				Send AI group at radiotower to claim it.
*/
//============================================////============================================//
private["_countHP1","_AI_SF_CG_Timer1","_AI_SF_CG_Timer2","_AI_SF_CG_Timer3","_AI_NUMBER1","_AI_NUMBER2","_AI_NUMBER3","_AI_SKILLS1","_AI_SKILLS2","_AI_SKILLS3"];
//============================================////============================================//

	//SELECT TIMER 		ARRAY 0
	_AI_SF_CG_Timer1 = AI_SF_CG_WAVE_1 select 0;
	_AI_SF_CG_Timer2 = AI_SF_CG_WAVE_2 select 0;
	_AI_SF_CG_Timer3 = AI_SF_CG_WAVE_3 select 0;
	//SELECT AI_NUMBER 	ARRAY 1
	_AI_NUMBER1 = AI_SF_CG_WAVE_1 select 1;
	_AI_NUMBER2 = AI_SF_CG_WAVE_2 select 1;
	_AI_NUMBER3 = AI_SF_CG_WAVE_3 select 1;
	//SELECT AI_SKILLS 	ARRAY 2
	_AI_SKILLS1 = AI_SF_CG_WAVE_1 select 2;
	_AI_SKILLS2 = AI_SF_CG_WAVE_2 select 2;
	_AI_SKILLS3 = AI_SF_CG_WAVE_3 select 2;

//============================================////============================================//
	_timerTRUE = 1;
	_countHP1 = 0;
		//CLAIMING_GROUP TIMER,SPAWNER 
		while {AI_SF_CG_Timer isEqualTo 1} do 
		{
			//START TIMER
			while {_timerTRUE isEqualTo 1} do 
			{
			  _countHP1 = _countHP1 + 1;
			  uiSleep 1;
				//SEND CLAIMING_GROUP #1 AT RADIOTOWER TO CLAIM IT
				if (_countHP1 isEqualTo _AI_SF_CG_Timer1 && CLAIMING_GROUP_NUMBER >= 1) then 
				{
					//[LVgroup6] AI_SF_CG_WAVE_1
					_LVgroup6 = ["Missionmarker1",3,true,true,1500,"random",true,120,110,_AI_NUMBER1,0.5,60,true,true,false,true,["Radio-Tower","Missionmarker1"],true,_AI_SKILLS1,nil,nil,6,false,false,["TOHL_HARD"]] execVM "TIMS\LV\heliParadrop.sqf";
					diag_log format ["-=T.I.M.S=-: FIRST SPECIAL AI PARTY SENT TO THE RADIOTOWER TO CLAIM IT. LVgroup6."];
					//DELETE CHECK
					AI_SF_CG_SPAWNED_WAVE_1 = 1;
					//STOP TIMER IF CLAIMING_GROUP_NUMBER IS SET TO 1
					if (CLAIMING_GROUP_NUMBER isEqualTo 1) then 
					{
						//EXIT LOOP TIMER
						_timerTRUE = 0;
					};
				};
				//SEND CLAIMING_GROUP #2 AT RANDOM PLAYER FOR NOW
				if (_countHP1 isEqualTo _AI_SF_CG_Timer2 && CLAIMING_GROUP_NUMBER >= 2) then 
				{
					//[LVgroup7] AI_SF_CG_WAVE_2
					
					diag_log format ["-=T.I.M.S=-: SECOND SPECIAL AI PARTY SENT TO A RANDOM PLAYER. LVgroup7."];
					//DELETE CHECK
					AI_SF_CG_SPAWNED_WAVE_2 = 1;
					//STOP TIMER IF CLAIMING_GROUP_NUMBER IS SET TO 2
					if (CLAIMING_GROUP_NUMBER isEqualTo 2) then 
					{
						//EXIT LOOP TIMER
						_timerTRUE = 0;
					};
				};
				//SEND CLAIMING_GROUP #3 AT RANDOM PLAYER FOR NOW
				if (_countHP1 isEqualTo _AI_SF_CG_Timer3 && CLAIMING_GROUP_NUMBER isEqualTo 3) then 
				{
					//[LVgroup8] AI_SF_CG_WAVE_3
					
					diag_log format ["-=T.I.M.S=-: THIRD SPECIAL AI PARTY SENT TO A RANDOM PLAYER. LVgroup8."];
					//DELETE CHECK
					AI_SF_CG_SPAWNED_WAVE_3 = 1;
					//STOP TIMER IF CLAIMING_GROUP_NUMBER IS SET TO 3
					if (CLAIMING_GROUP_NUMBER isEqualTo 3) then 
					{
						//EXIT LOOP TIMER
						_timerTRUE = 0;
					};
				};
			};
			if (_timerTRUE isEqualTo 0) then 
			{
				//EXIT LOOP TIMER
				AI_SF_CG_Timer = 0;
			};
		};
	//DIAG_LOG AND AI_SF_CG_Timer CHECK
	diag_log format ["-=T.I.M.S=-: ALL SPECIAL AI PARTY TO CLAIM CLAIMABLE MISSION OBJECTIVES HAS BEEN SENT."];