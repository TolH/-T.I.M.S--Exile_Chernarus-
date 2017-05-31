if (!isDedicated) exitWith {};
	private ["_playerCount"];
//============================================////============================================//
	MISSION_ISRUNNING = 0;
	//START MISSION IF PLAYER COUNT >= ONLINE_PLAYERS AND MISSION_ISRUNNING = 0;
		while {true} do
		{
		  //WAIT 1 MINUTE AFTER THE INVASION ENDED FOR NOW
		  uiSleep 60;
			_playerCount = {alive _x} count playableUnits;
			if ((_playerCount >= ONLINE_PLAYERS) && (MISSION_ISRUNNING == 0)) then 
			{
				mission_script1 = [] execVM "TIMS\missions\Missions\Town_Invasion.sqf";
				waitUntil {uiSleep 5; scriptDone mission_script1};
			}
			else
			{
				if (_playerCount < ONLINE_PLAYERS) then 
				{
					if (DEBUG_RPT == 1) then 
					{
						diag_log "-=T.I.M.S=-: NOT ENOUGH PLAYER TO START A MISSION, AT LEAST 1 PLAYER IS NEEDED. Rechecking in 1 minutes...";
					};
				};
			};
		};
//============================================////============================================//