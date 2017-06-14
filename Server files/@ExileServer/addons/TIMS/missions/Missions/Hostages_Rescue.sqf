//============================================////============================================//
//-T.I.M.S- (WIP) by TolH
//============================================////============================================//
private ["_towns","_RandomTownPosition","_Missionmarker1","_Missionmarker2","_Missionmarker3","_AI_COUNTER","_radius"];
//============================================////============================================//
	//MISSION RUNNING CHECK
		MISSION_ISRUNNING = 1;
		diag_log "=======================================================================";
		diag_log "-=T.I.M.S=-: Mission -Hostages_Rescue.sqf- Started";
		diag_log "=======================================================================";
	//SELECT A RANDOM LOCATION
		_towns = nearestLocations [position player, ["NameVillage","NameCity","NameCityCapital"], 40000];
		_RandomTownPosition = position (_towns select (floor (random (count _towns))));
//============================================////============================================//
	//CREATE MISSION MARKER
		_Missionmarker1 = createMarker ["Missionmarker1", _RandomTownPosition];
		//
		_Missionmarker2 = createMarker ["Missionmarker2", getMarkerPos "Missionmarker1"];
		"Missionmarker2" setMarkerColor "ColorRed";
		"Missionmarker2" setMarkerShape "ELLIPSE";
		"Missionmarker2" setMarkerBrush "Border";
		"Missionmarker2" setMarkerSize [1200,1200];
		"Missionmarker2" setMarkerAlpha 1.0;
		//
		_Missionmarker3 = createMarker ["Missionmarker3", getMarkerPos "Missionmarker1"];
		"Missionmarker3" setMarkerColor "ColorGreen";
		"Missionmarker3" setMarkerShape "ELLIPSE";
		"Missionmarker3" setMarkerBrush "Border";
		"Missionmarker3" setMarkerSize [1300,1300];
		"Missionmarker3" setMarkerAlpha 1.0;
	//PAUSE MISSION UNTIL PLAYER ARE AT LEAST 1250m OF MARKER
		["Missionmarker1", 1250, "ColorRed"] ExecVM PAUSE_MISSION;
		waitUntil {uiSleep 3; ANIMEMARKER isEqualTo 0};
		deleteMarker "Missionmarker3";
//============================================////============================================//
	//CREATE MARKERS + AICOUNTER
		"Missionmarker1" setMarkerColor "ColorOrange";
		"Missionmarker1" setMarkerShape "ELLIPSE";
		"Missionmarker1" setMarkerBrush "SolidFull";
		"Missionmarker1" setMarkerSize [1200,1200];
		"Missionmarker1" setMarkerAlpha 0.2;
		//CREATE AI_COUNTER MARKER
		_AI_COUNTER = createMarker ["AI_COUNTER", getMarkerPos "Missionmarker1"];
		"AI_COUNTER" setMarkerColor "ColorGrey";
		"AI_COUNTER" setMarkerType "hd_dot";
//============================================////============================================//
	//MESSAGE
		showNotification = ["NewMain", "Primary Objective: Save hostages in town before they got killed."]; publicVariable "showNotification";
	//WAIT 15 SECONDS BEFORE SENDING NEXT MESSAGE
		uiSleep 15;
		showNotification = ["NewSub", "Secondary Objective: Kill all resistances!"]; publicVariable "showNotification";
//============================================////============================================//
	//ADDING AI
		//GROUP #1 LVgroup1
			//nul = ["Missionmarker1",3,1100,[true,true],[true,true,true],false,[50,0],[3,0],0.3,nil,nil,1,true,true,["ALL"]] execVM "TIMS\LV\militarize.sqf";
			nul = ["Missionmarker1",3,true,1,[12,0],700,0.1,nil,nil,1,["ALL"]] execVM "LV\fillHouse.sqf";
			uiSleep 5;
//============================================////============================================//
	//SET MISSION VARIABLES
		//AI counter + Radius
		_AiCounter = 1;			//_AiCounter
		_radius = 1250;			//_AiCount RADIUS

//============================================////============================================//
	//START MISSION
		while {_AiCounter isEqualTo 1} do 
		{
		  //AI COUNTER FOR MISSION MARKER
		  _AiCount = ({alive _x AND (side _x) isEqualTo resistance AND (_x distance getMarkerPos "Missionmarker1" < _radius)} count allunits);
		  //
		  uiSleep 4;
		  //
		  "AI_COUNTER" setMarkerText format ["(Ennemies left: (%1)", _AiCount];
			//
			//ALL ENNEMIES KILLED. ENDING MISSION
			//
			if (_AiCount < 20) then 
			{
				//CHANGE AI_COUNTER MARKER
				"AI_COUNTER" setMarkerColor "ColorOrange";
				"AI_COUNTER" setMarkerText "The town has been taken back!";
				_AiCounter = 0;
			};
		};
//============================================////============================================//
	//WAIT X SECONDS BEFORE DELETING EVERYTHING
		uiSleep MISSION_CLEAN_TIME;
//============================================////============================================//
	//MISSION CLEANUP
		//DELETE MARKER
		deleteMarker "Missionmarker1";
		deleteMarker "Missionmarker2";
		deleteMarker "AI_COUNTER";
		//DELETE AI GROUP LVgroup1
		nul = [500,LVgroup1] execVM "TIMS\LV\LV_fnc_removeDead.sqf";
		nul = [LVgroup1] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
//============================================////============================================//
	//MISSION ENDED
		diag_log "-=T.I.M.S=-: Mission -Hostages_Rescue.sqf- Ended";
		//MISSION ENDED CHECK
			MISSION_ISRUNNING = 0;
//============================================////============================================//