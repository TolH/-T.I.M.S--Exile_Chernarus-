//============================================////============================================//
//-T.I.M.S- (WIP) by TolH
//============================================////============================================//
private ["_Missionmarker1","_towns","_kRandSpawnPos","_RandomTownPosition","_spawnRandomisation","_spwnposNew","_SPWradioTower","_TowerMarker"];
//============================================////============================================//
	//MISSION RUNNING CHECK
		MISSION_ISRUNNING = 1;
		diag_log "=======================================================================";
		diag_log "-=T.I.M.S=-: Mission -Invasion.sqf- Started";
		diag_log "=======================================================================";
	//SELECT A LOCATION
		_towns = nearestLocations [position player, ["NameVillage","NameCity","NameCityCapital"], 40000];
		_RandomTownPosition = position (_towns select (floor (random (count _towns))));
		//_airport = nearestLocations [position player, ["NameLocal"], 25000]; //"Airport" For Tanoa only
		//_RandomAirportPosition = position (_airport select (floor (random (count _airport)))); //"Airport" For Tanoa only
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
	//POSITION OF MISSION OBJECTS, AI, VEHICLES AND LOOTS
		_kRandSpawnPos = [(getMarkerPos "Missionmarker1"), 1, 600, 0.1, 0, 200, 0] call BIS_fnc_findSafePos;	//RADIOTOWER
		_kRandSpawnPos1 = [(getMarkerPos "Missionmarker1"), 250, 800, 1, 0, 100, 0] call BIS_fnc_findSafePos;	//BUNKER1
		_kRandSpawnPos8 = [(getMarkerPos "Missionmarker1"), 225, 825, 1, 0, 100, 0] call BIS_fnc_findSafePos;	//BUNKER2
		_kRandSpawnPos2 = [(getMarkerPos "Missionmarker1"), 1, 100, 1, 0, 100, 0] call BIS_fnc_findSafePos;		//AI patrol
		_kRandSpawnPos3 = [(getMarkerPos "Missionmarker1"), 1, 200, 1, 0, 100, 0] call BIS_fnc_findSafePos;		//AI patrol
		_kRandSpawnPos4 = [(getMarkerPos "Missionmarker1"), 1, 150, 1, 0, 100, 0] call BIS_fnc_findSafePos;		//AI NEAR CENTER TOWN
		_kRandSpawnPos5 = [(getMarkerPos "Missionmarker1"), 1, 900, 1, 0, 100, 0] call BIS_fnc_findSafePos;		//GROUND PATROL
		_kRandSpawnPos6 = [(getMarkerPos "Missionmarker1"), 800, 1400, 1, 0, 150, 0] call BIS_fnc_findSafePos;	//BonusLoot1 Ground Vehicle POS
		_kRandSpawnPos7 = [(getMarkerPos "Missionmarker1"), 800, 1410, 1, 0, 150, 0] call BIS_fnc_findSafePos;	//BonusLoot2 Air Vehicle POS
//============================================////============================================//
	//CREATE RADIOTOWER
		_SPWradioTower = "Land_TTowerBig_2_F" createVehicle _kRandSpawnPos;
		waitUntil {uiSleep 1; alive _SPWradioTower};
		_SPWradioTower setVectorUp [0,0,1];
	//MARKER AT RADIOTOWER
		_TowerMarker = createMarker ["Radio-Tower", getPos _SPWradioTower];
		"Radio-Tower" setMarkerColor "ColorYellow";
		"Radio-Tower" setMarkerType "loc_Transmitter";
		"Radio-Tower" setMarkerText " -RadioTower-";
	//CREATE BUNKER1
		_SPWbunker1 = "Land_Ammostore2" createVehicle _kRandSpawnPos1;
		waitUntil {uiSleep 0.2; alive _SPWbunker1};
		_SPWbunker1 allowDamage false;
		//_SPWbunker1 setVectorUp [0,0,1];
	//CREATE BUNKER2
		_SPWbunker2 = "Land_Ammostore2" createVehicle _kRandSpawnPos8;
		waitUntil {uiSleep 0.2; alive _SPWbunker2};
		_SPWbunker2 allowDamage false;
		//_SPWbunker2 setVectorUp [0,0,1];
	//MARKER AT BUNKER1
		_BunkerMarker1 = createMarker ["Bunker1", getPos _SPWbunker1];
		"Bunker1" setMarkerSize [3.0,3.0];
		"Bunker1" setMarkerColor "ColorGrey";
		"Bunker1" setMarkerType "loc_Bunker";
		"Bunker1" setMarkerText "#1";
	//MARKER AT BUNKER2
		_BunkerMarker2 = createMarker ["Bunker2", getPos _SPWbunker2];
		"Bunker2" setMarkerSize [3.0,3.0];
		"Bunker2" setMarkerColor "ColorGrey";
		"Bunker2" setMarkerType "loc_Bunker";
		"Bunker2" setMarkerText "#2";
//============================================////============================================//
	//CREATE ALL CRATES
		//CRATE TYPE
			_bunker1POS = getPos _SPWbunker1;
			_bunker2POS = getPos _SPWbunker2;
			//_Type_FuelTank = "B_Slingload_01_Fuel_F";
			_Type_AmmoBox = "B_CargoNet_01_ammo_F";
		//CRATE #1
			_supplyBox1 = createVehicle [_Type_AmmoBox, _bunker1POS, [], 0, "CAN_COLLIDE"];
			_supplyBox1 allowDamage false;
			_supplyBox1 enableSimulation true;
		//CRATE #2
			_supplyBox2 = createVehicle [_Type_AmmoBox, _bunker2POS, [], 0, "CAN_COLLIDE"];
			_supplyBox2 allowDamage false;
			_supplyBox2 enableSimulation true;
	//CLEAR CRATE ITEMS
		//CRATE #1
			clearBackpackCargoGlobal _supplyBox1;
			clearWeaponCargoGlobal _supplyBox1;
			clearMagazineCargoGlobal _supplyBox1;
			clearItemCargoGlobal _supplyBox1;
		//CRATE #2
			clearBackpackCargoGlobal _supplyBox2;
			clearWeaponCargoGlobal _supplyBox2;
			clearMagazineCargoGlobal _supplyBox2;
			clearItemCargoGlobal _supplyBox2;
	//CREATE ALL CRATES MARKERS
		//(Crate_1)
			_Crate_1 = createMarker ["Crate_1", getPos _supplyBox1];
			"Crate_1" setMarkerSize [0.8,0.8];
			"Crate_1" setMarkerColor "ColorKhaki";
			"Crate_1" setMarkerType "respawn_para";
			"Crate_1" setMarkerText "";		//Construction loot
		//(Crate_2)
			_Crate_2 = createMarker ["Crate_2", getPos _supplyBox2];
			"Crate_2" setMarkerSize [0.8,0.8];
			"Crate_2" setMarkerColor "ColorKhaki";
			"Crate_2" setMarkerType "respawn_para";
			"Crate_2" setMarkerText "";		//Weapons loot
//============================================////============================================//
	//MESSAGE
		showNotification = ["NewMain", "Town Invasion Started!"]; publicVariable "showNotification";
	//WAIT 15 SECONDS BEFORE SENDING NEXT MESSAGE
		uiSleep 15;
		showNotification = ["NewSub", "Destroy the RadioTower."]; publicVariable "showNotification";	
//============================================////============================================//
	//ADDING AI TO RADIOTOWER
		//GROUP #1
			_LVgroup1 = ["Missionmarker1",3,1100,[true,true],[true,true,true],false,[50,0],[3,0],0.3,nil,nil,1,true,true,["ALL"]] execVM "TIMS\LV\militarize.sqf";
			//_Tower = getPos _SPWradioTower;
			//_spawnGroup1 = [[(_Tower select 0) + 10,(_Tower select 1) - 10, 0], resistance, AI_DEFEND_TOWER] ExecVM CUSTOM_FN_SPAWNGROUP;
			//nul_script1 = [_spawnGroup1, getpos _SPWradioTower, 50] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
	//ADDING AI TO BUNKER1
		//GROUP #9
			//_BunkerPOS1 = getPos _SPWbunker1;
			//_spawnGroup9 = [[(_BunkerPOS1 select 0) + 200,(_BunkerPOS1 select 1) - 75, 0], resistance, AI_DEFEND_BUNKER_1] ExecVM CUSTOM_FN_SPAWNGROUP;
			//nul_script9 = [_spawnGroup9, getpos _SPWbunker1, 40] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
	//ADDING AI TO BUNKER2
		//GROUP #15
			//_BunkerPOS2 = getPos _SPWbunker2;
			//_spawnGroup15 = [[(_BunkerPOS2 select 0) + 100,(_BunkerPOS2 select 1) - 300, 0], resistance, AI_DEFEND_BUNKER_2] ExecVM CUSTOM_FN_SPAWNGROUP;
			//nul_script15 = [_spawnGroup15, getpos _SPWbunker2, 40] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
	//ADDING AI AROUND MAP
		//GROUP #3
			//_spawnGroup3 = [_kRandSpawnPos2, resistance, 10] ExecVM CUSTOM_FN_SPAWNGROUP;
			//nul_script3 = [_spawnGroup3, _kRandSpawnPos2, 50] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
		//GROUP #4
			//_spawnGroup4 = [_kRandSpawnPos2, resistance, 4] ExecVM CUSTOM_FN_SPAWNGROUP;
			//nul_script4 = [_spawnGroup4, _kRandSpawnPos2, 25] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
	//ADDING AI NEAR CENTER TOWN
		//GROUP #5
			//_spawnGroup5 = [_kRandSpawnPos4, resistance, 10] ExecVM CUSTOM_FN_SPAWNGROUP;
			//nul_script5 = [_spawnGroup5, _kRandSpawnPos4, 70] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
	//ADDING GROUND PATROL
		//GROUP #6
			//_spawnGroup6 = [_kRandSpawnPos5, 180, "O_G_Offroad_01_armed_F", resistance] ExecVM CUSTOM_FNC_SPAWNVEHICLE; //bis_fnc_spawnvehicle;
			//nul_script6 = [(_spawnGroup6 select 2), (getMarkerPos "Missionmarker1"), 1000] ExecVM VEHICLE_PATROL;	//BIS_fnc_taskPatrol;
			TANK_AI_1 = _spawnGroup6 select 0;
				//CREATE VEHICLE MARKER IS OPTION SELECTED
				if (VEHICLE_MARKER isEqualTo 1) then
				{
					_VehicleMarker1 = createMarker ["Vehicle_1", getPos TANK_AI_1];
					"Vehicle_1" setMarkerColor "ColorRed";
					"Vehicle_1" setMarkerShape "ICON";
					"Vehicle_1" setMarkerType "o_mech_inf";
					"Vehicle_1" setMarkerText "";
					"Vehicle_1" setMarkerSize [0.6,0.6];
				};
	//ADDING FLYING PATROL
		//GROUP #7
			//_spawnGroup7 = [[getMarkerPos "Missionmarker1" select 0, getMarkerPos "Missionmarker1" select 1], 270, "O_Heli_Light_02_F", resistance] ExecVM CUSTOM_FNC_SPAWNVEHICLE; //bis_fnc_spawnvehicle;
			//nul_script7 = [(_spawnGroup7 select 2), (getMarkerPos "Missionmarker1"), 1000] ExecVM HELI_PATROL;	//BIS_fnc_taskPatrol;
			HELI_AI_1 = _spawnGroup7 select 0;
				//CREATE VEHICLE MARKER IF OPTION ENABLED
				if (VEHICLE_MARKER isEqualTo 1) then
				{
				_VehicleMarker2 = createMarker ["Heli_1", getPos HELI_AI_1];
				"Heli_1" setMarkerColor "ColorRed";
				"Heli_1" setMarkerShape "ICON";
				"Heli_1" setMarkerType "c_plane";
				"Heli_1" setMarkerText "";
				"Heli_1" setMarkerSize [0.6,0.6];
				};
//============================================////============================================//
	//SET MISSION VARIABLES
		_AiCounter = 1;
		_TowerCheck = 1;
		_Tank1Alive = 1;
		_Heli1Alive = 1;
		//BUNKER #1
		_Bunker1OwnedByAI = 0;			//BUNKER1 CAPTURED BY AI 	= 1; 	(Default 0)
		_Bunker1OwnedByPlayer = 0;		//BUNKER1 CAPTURED BY PLAYER = 1; 	(Default 0)
		 Bunker1_AI_GROUP1 = 0;			//BUNKER1 REINFORCEMENT AI 	= 1,2,3 (Default 0)
		//BUNKER #2
		_Bunker2OwnedByAI = 0;			//BUNKER2 CAPTURED BY AI 	= 1; 	(Default 0)
		_Bunker2OwnedByPlayer = 0;		//BUNKER2 CAPTURED BY PLAYER = 1; 	(Default 0)
		Bunker2_AI_GROUP2 = 0;			//BUNKER2 REINFORCEMENT AI 	= 1,2,3 (Default 0)
	//SET AI_Counter Radius
		_radius = 1250;			//_AiCount RADIUS
		_BunkerRadius = 60;		//_PlCount RADIUS
	//START TRACKING CRATE MARKERS
		CRATETRACKING = 1;
		[_supplyBox1, _supplyBox2] execVM LOOT_MARKER;
//============================================////============================================//
	//START MISSION
		while {_AiCounter isEqualTo 1} do 
		{
		  //AICOUNTER
		  _AiCount = ({alive _x AND (side _x) isEqualTo resistance AND (_x distance getMarkerPos "Missionmarker1" < _radius)} count allunits);
		  //BUNKER #1 COUNTER
		  _Bunker1PLCount = ({alive _x AND (side _x) isEqualTo east AND (_x distance getPos _SPWbunker1 < _BunkerRadius)} count allunits);
		  _Bunker1AICount = ({alive _x AND (side _x) isEqualTo resistance AND (_x distance getPos _SPWbunker1 < _BunkerRadius)} count allunits);
		  //BUNKER #2 COUNTER
		  _Bunker2PLCount = ({alive _x AND (side _x) isEqualTo east AND (_x distance getPos _SPWbunker2 < _BunkerRadius)} count allunits);
		  _Bunker2AICount = ({alive _x AND (side _x) isEqualTo resistance AND (_x distance getPos _SPWbunker2 < _BunkerRadius)} count allunits);
		  uiSleep 4;
		  //CREATE AI_COUNTER MARKER
		  "AI_COUNTER" setMarkerText format ["(Ennemies left: (%1)", _AiCount];
			//CREATE AI VEHICLE MOVING MARKER
			if (VEHICLE_MARKER isEqualTo 1) then
			{
				"Vehicle_1" setmarkerpos getPos TANK_AI_1;
				"Heli_1" setmarkerpos getPos HELI_AI_1;
			};
			//WAIT UNTIL RADIOTOWER IS DESTROYED
			if ((!alive _SPWradioTower) && (_TowerCheck isEqualTo 1)) then
			{
				diag_log format ["-=T.I.M.S=-: Mission -Invasion.sqf- TOWER DESTROYED"];
				"Radio-Tower" setMarkerColor "ColorGrey";
				"Radio-Tower" setMarkerText " -=RadioTower=- Destroyed";
				uiSleep 5;
				showNotification = ["CompletedSub", "RadioTower Deactivated! Reinforcements stopped at all bunker."]; publicVariable "showNotification";
				_TowerCheck = 0;
				StartTimer1 = 0;
				StartTimer2 = 0;
			};
			//BUNKER #1 CAPTURED BY AI
			if ((_Bunker1AICount > _Bunker1PLCount) && (_Bunker1OwnedByAI isEqualTo 0)) then
			{
				showNotification = ["BunkerTakenByAI", "Bunker #1 captured by AI's."]; publicVariable "showNotification";
				"Bunker1" setMarkerColor "ColorRed";
				//"Bunker1" setMarkerText " (Captured by: (AI)";
				_Bunker1OwnedByAI = 1;
				_Bunker1OwnedByPlayer = 0;
				StartTimer1 = 0;
			};
			//BUNKER #1 CAPTURED BY PLAYER
			if ((_Bunker1PLCount > _Bunker1AICount) && (_Bunker1OwnedByPlayer isEqualTo 0)) then
			{
				showNotification = ["BunkerTakenByPlayer", "Bunker #1 captured by PLAYERS."]; publicVariable "showNotification";
				"Bunker1" setMarkerColor "ColorBlue";
				//"Bunker1" setMarkerText " (Captured by: (Players)";
				_Bunker1OwnedByAI = 0;
				_Bunker1OwnedByPlayer = 1;
				//IF RADIOTOWER IS ALIVE SEND REINFORCMENT
				if (alive _SPWradioTower) then
				{
					StartTimer1 = 1;
					[] execVM BUNKER1_TIMER;
				};
			};
			//BUNKER #2 CAPTURED BY AI
			if ((_Bunker2AICount > _Bunker2PLCount) && (_Bunker2OwnedByAI isEqualTo 0)) then
			{
				showNotification = ["BunkerTakenByAI", "Bunker #2 captured by AI's."]; publicVariable "showNotification";
				"Bunker2" setMarkerColor "ColorRed";
				//"Bunker1" setMarkerText " (Captured by: (AI)";
				_Bunker2OwnedByAI = 1;
				_Bunker2OwnedByPlayer = 0;
				StartTimer2 = 0;
			};
			//BUNKER #2 CAPTURED BY PLAYER
			if ((_Bunker2PLCount > _Bunker2AICount) && (_Bunker2OwnedByPlayer isEqualTo 0)) then
			{
				showNotification = ["BunkerTakenByPlayer", "Bunker #2 captured by PLAYER."]; publicVariable "showNotification";
				"Bunker2" setMarkerColor "ColorBlue";
				//"Bunker2" setMarkerText " (Captured by: (Players)";
				_Bunker2OwnedByAI = 0;
				_Bunker2OwnedByPlayer = 1;
				//IF RADIOTOWER IS ALIVE SEND REINFORCMENT
				if (alive _SPWradioTower) then
				{
					StartTimer2 = 1;
					[] execVM BUNKER2_TIMER;
				};
			};
			//ADD BUNKER #1 REINFORCMENT AFTER A WHILE FOR Bunker1_AI_GROUP1
			if (Bunker1_AI_GROUP1 isEqualTo 1) then
			{
				showNotification = ["OptionalFailed", "Sending troops to Bunker #1. Destroy the RadioTower to avoid reinforcement."]; publicVariable "showNotification";	
				//_spawnGroup22 = [[(_bunker1POS select 0) + 300,(_bunker1POS select 1) - 180, 0], resistance, AI_WAVE_1] ExecVM CUSTOM_FN_SPAWNGROUP;
				//nul_script22 = [_spawnGroup22, getpos _SPWbunker1, 25] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
				Bunker1_AI_GROUP1 = 0;
			};
			//ADD BUNKER #1 REINFORCMENT AFTER A WHILE FOR Bunker1_AI_GROUP1
			if (Bunker1_AI_GROUP1 isEqualTo 2) then
			{
				showNotification = ["OptionalFailed", "Sending troops to Bunker #1. Destroy the RadioTower to avoid reinforcement."]; publicVariable "showNotification";
				//_spawnGroup23 = [[(_bunker1POS select 0) + 190,(_bunker1POS select 1) - 300, 0], resistance, AI_WAVE_2] ExecVM CUSTOM_FN_SPAWNGROUP;
				//nul_script23 = [_spawnGroup23, getpos _SPWbunker1, 25] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
				Bunker1_AI_GROUP1 = 0;
			};
			//ADD BUNKER #1 REINFORCMENT AFTER A WHILE FOR Bunker1_AI_GROUP1
			if (Bunker1_AI_GROUP1 isEqualTo 3) then
			{
				showNotification = ["OptionalFailed", "Sending troops to Bunker #1. Destroy the RadioTower to avoid reinforcement."]; publicVariable "showNotification";
				//_spawnGroup33 = [[(_bunker1POS select 0) + 90,(_bunker1POS select 1) - 300, 0], resistance, AI_WAVE_3] ExecVM CUSTOM_FN_SPAWNGROUP;
				//nul_script33 = [_spawnGroup33, getpos _SPWbunker1, 25] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
				Bunker1_AI_GROUP1 = 0;
			};
			//ADD BUNKER #2 REINFORCMENT AFTER A WHILE FOR Bunker2_AI_GROUP2
			if (Bunker2_AI_GROUP2 isEqualTo 1) then
			{
				showNotification = ["OptionalFailed", "Sending troops to Bunker #2. Destroy the RadioTower to avoid reinforcement."]; publicVariable "showNotification";	
				//_spawnGroup47 = [[(_bunker2POS select 0) + 300,(_bunker2POS select 1) - 180, 0], resistance, AI_WAVE_1] ExecVM CUSTOM_FN_SPAWNGROUP;
				//nul_script47 = [_spawnGroup47, getpos _SPWbunker2, 25] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
				Bunker2_AI_GROUP2 = 0;
			};
			//ADD BUNKER #2 REINFORCMENT AFTER A WHILE FOR Bunker2_AI_GROUP2
			if (Bunker2_AI_GROUP2 isEqualTo 2) then
			{
				showNotification = ["OptionalFailed", "Sending troops to Bunker #2. Destroy the RadioTower to avoid reinforcement."]; publicVariable "showNotification";
				//_spawnGroup32 = [[(_bunker2POS select 0) + 190,(_bunker2POS select 1) - 300, 0], resistance, AI_WAVE_2] ExecVM CUSTOM_FN_SPAWNGROUP;
				//nul_script32 = [_spawnGroup32, getpos _SPWbunker2, 25] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
				Bunker2_AI_GROUP2 = 0;
			};
			//ADD BUNKER #2 REINFORCMENT AFTER A WHILE FOR Bunker2_AI_GROUP2
			if (Bunker2_AI_GROUP2 isEqualTo 3) then
			{
				showNotification = ["OptionalFailed", "Sending troops to Bunker #2. Destroy the RadioTower to avoid reinforcement."]; publicVariable "showNotification";
				//_spawnGroup55 = [[(_bunker2POS select 0) + 90,(_bunker2POS select 1) - 300, 0], resistance, AI_WAVE_3] ExecVM CUSTOM_FN_SPAWNGROUP;
				//nul_script55 = [_spawnGroup55, getpos _SPWbunker2, 25] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;
				Bunker2_AI_GROUP2 = 0;
			};
			//TANK_AI_1 KILLED
			if ((!alive TANK_AI_1) && (_Tank1Alive isEqualTo 1)) then
			{
				uiSleep 5;
				showNotification = ["CompletedOptional", "Ground Vehicle Destroyed! Congrats.. Rewarded a copy of this vehicle!"]; publicVariable "showNotification";
				_Tank1Alive = 0;
				//ADD BONUS LOOT IF TANK_AI_1 KILLED
				_BonusLoot1 = createVehicle ["O_G_Offroad_01_armed_F", _kRandSpawnPos6, [], 0, "CAN_COLLIDE"];
				_BonusLoot1 call EPOCH_server_setVToken;
				//MARKER AT VEHICLE
				_BonusLoot1Marker = createMarker ["BonusLoot1", getPos _BonusLoot1];
				"BonusLoot1" setMarkerSize [0.8,0.8];
				"BonusLoot1" setMarkerColor "ColorBlue";
				"BonusLoot1" setMarkerType "o_mech_inf";
				"BonusLoot1" setMarkerText "BonusLoot: Armed Offroad!";
				if (VEHICLE_MARKER isEqualTo 1) then
				{
					"Vehicle_1" setMarkerColor "ColorGrey";
				};
			};
			//HELI_AI_1 KILLED
			if ((!alive HELI_AI_1) && (_Heli1Alive isEqualTo 1)) then
			{
				uiSleep 5;
				showNotification = ["CompletedOptional", "Air Vehicle Destroyed! Congrats.. Rewarded a copy of this vehicle!"]; publicVariable "showNotification";
				_Heli1Alive = 0;
				//ADD BONUS LOOT IF HELI_AI_1 KILLED
				_BonusLoot2 = createVehicle ["O_Heli_Light_02_F", _kRandSpawnPos7, [], 0, "CAN_COLLIDE"];
				_BonusLoot2 call EPOCH_server_setVToken;
				//MARKER AT VEHICLE
				_BonusLoot2Marker = createMarker ["BonusLoot2", getPos _BonusLoot2];
				"BonusLoot2" setMarkerSize [0.8,0.8];
				"BonusLoot2" setMarkerColor "ColorBlue";
				"BonusLoot2" setMarkerType "c_plane";
				"BonusLoot2" setMarkerText "BonusLoot: Armed PO-30 Orca!";
				if (VEHICLE_MARKER isEqualTo 1) then
				{
					"Heli_1" setMarkerColor "ColorGrey";
				};
			};
			//ALL ENNEMIES KILLED. ENDING MISSION
			if ((_Bunker1OwnedByPlayer isEqualTo 1) && (_Bunker2OwnedByPlayer isEqualTo 1)) then
			{
				if (_AiCount < 5) then 
				{
					//CHANGE AI_COUNTER MARKER
					"AI_COUNTER" setMarkerColor "ColorOrange";
					"AI_COUNTER" setMarkerText "The town has been taken back!";
					_AiCounter = 0;
				};
			};
		};
//============================================////============================================//
	//WAIT UNTIL AI ELEMINATED (< 5)
		waitUntil {uiSleep 5; _AiCounter isEqualTo 0};
	//MESSAGE
		showNotification = ["CompletedMain", "You have taken back the town!"]; publicVariable "showNotification";
		"Missionmarker1" setMarkerColor "ColorGreen";
	//CREATE LOOT IF INVASION COMPLETED THEN START A SMOKE GRENADE
		//_Crate_1
		[_supplyBox1,"CONSTRUCTION"] ExecVM NORMAL_Loot_Setup;
		//SMOKE_1
		
		//_Crate_2
		[_supplyBox2,"WEAPONS"] ExecVM HIGH_Loot_Setup;
		//SMOKE_2
		
		//_Crate_2
		[_supplyBox2,"MEDIC"] ExecVM LOW_Loot_Setup;
//============================================////============================================//
	//WAIT X SECONDS BEFORE DELETING EVERYTHING
		uiSleep MISSION_CLEAN_TIME;
		CRATETRACKING = 0;
		//DELETE SPECIALS
			if (!alive _SPWradioTower) then
			{
				_wreck = getMarkerPos "Radio-Tower" nearestObject "Land_TTowerBig_2_ruins_F";
				deletevehicle _wreck;
				//WAIT OR WONT DELETE
				uiSleep 1;
			};
			//DELETE VEHICLE_AI IF ALIVE
			if (_Tank1Alive isEqualTo 1) then 
			{
				deletevehicle TANK_AI_1;
			};
			//
			if (_Heli1Alive isEqualTo 1) then 
			{
				deletevehicle HELI_AI_1;
			};
		//DELETE LOOTBOX AND OBJECTS
			deletevehicle _supplyBox1;
			deletevehicle _supplyBox2;
			deleteVehicle _SPWradioTower;
			deleteVehicle _SPWbunker1;
			deleteVehicle _SPWbunker2;
		//DELETE MARKER
			deleteMarker "Missionmarker1";
			deleteMarker "Missionmarker2";
			deleteMarker "Radio-Tower";
			deleteMarker "AI_COUNTER";
			deleteMarker "Crate_1";
			deleteMarker "Crate_2";
			deleteMarker "Bunker1";
			deleteMarker "Bunker2";
			deleteMarker "BonusLoot1";
			deleteMarker "BonusLoot2";
			if (VEHICLE_MARKER isEqualTo 1) then
			{
				deleteMarker "Vehicle_1";
				deleteMarker "Heli_1";
			};
//============================================////============================================//
	//MISSION ENDED
		diag_log "-=T.I.M.S=-: Mission -Invasion.sqf- Ended";
		//MISSION ENDED CHECK
			MISSION_ISRUNNING = 0;
//============================================////============================================//