//============================================////============================================//
	//WAIT 1 MINUTE BEFORE STARTING AT SERVER RESTART.
		uiSleep 60;
	//LOAD CONFIG
		SPAM_STOP = 1;
		config_script = [] execVM "TIMS\config.sqf";
		waitUntil {scriptDone config_script};
		diag_log "=======================================================================";
		diag_log "-=T.I.M.S=-: config File Loaded!";
	//CALL LOOT LIST
		call compile preprocessFileLineNumbers "TIMS\Loot\Loot_List\Loot_WEAPONS_List.sqf";
		call compile preprocessFileLineNumbers "TIMS\Loot\Loot_List\Loot_MEDIC_List.sqf";
		call compile preprocessFileLineNumbers "TIMS\Loot\Loot_List\Loot_CONSTRUCTION_List.sqf";
		diag_log "-=T.I.M.S=-: Loot List Loaded!";
	//CALL LOOT RATE/QUALITY
		call compile preprocessFileLineNumbers "TIMS\functions.sqf";
		diag_log "-=T.I.M.S=-: Functions File Loaded!";
		uiSleep SERVER_LOAD_WAIT;
//============================================////============================================//
	//MISSION SYSTEM CHECK IF ENABLED
		if (MISSIONS_SYSTEM isEqualTo 1) then 
		{
			if (DEBUG_RPT isEqualTo 1) then 
			{
				diag_log "-=T.I.M.S=-: !!!MISSION SYSTEM ENABLED FROM CONFIG!!! STARTING MISSION...";
				diag_log "=======================================================================";
			};
		  //MISSION SYSTEM ENABLED
		  ExecVM "TIMS\missions\init.sqf";
		}
		else
		{
			if (DEBUG_RPT isEqualTo 1 && SPAM_STOP isEqualTo 1) then 
			{
				//MISSION SYSTEM DISABLED
				diag_log "-=T.I.M.S=-: !!!MISSION SYSTEM DISABLED FROM CONFIG!!! EXITING...";
				diag_log "===============================================================";
				SPAM_STOP = 0;
			};
		};
//============================================////============================================//