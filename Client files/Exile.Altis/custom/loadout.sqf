//============================================////============================================//
		waitUntil {alive vehicle player};
		//waituntil {!isnull (finddisplay 46)};
		waitUntil {typeOF player != "Exile_Unit_GhostPlayer"};
//============================================////============================================//
	//PLAYER RESPAWN POSITIONS
		//_pos1 = [14625.8, 16771, 0.00143814];    //MAIN AIRPORT
		_pos1 = getMarkerPos "respawn_west";
		_pos2 = [8935.1592, 7494.0469, 1.378685]; //ALTIS CHURCH SPAWN
	//RADIUS RANDOMISATION FOR PLAYER SPAWN
		//_spawnRandomisation=5; //5m RADIUS
		//_spwnposNew = [(_pos1),random _spawnRandomisation, random 360] call BIS_fnc_relPos;
//============================================////============================================//
	//NEW PLAYER SPAWNNING CONFIG
	if ((player distance _pos1 <5) && (EPOCH_playerCrypto <1)) then
	{
		//SCREEN COMING BACK SLOWLY
		titleText ["", "BLACK IN", 10];
		//playerfog = 1;
		//player setDamage 0.30;
		player setpos _pos2;
		player setDir 270;
		//player enableFatigue false;
		waitUntil{!isNull (findDisplay 46) && !dialog && cameraOn isEqualTo player && cameraView == "INTERNAL"};
		player switchCamera "EXTERNAL";
		uiSleep 1;
        _PistolANDmag = ["Rollins_F","5Rnd_rollins_mag"];
		_riffle = _PistolANDmag select 0;
        _mag = _PistolANDmag select 1;
		player addWeapon _riffle;
        player addMagazine _mag;
		player addMagazine _mag;
		player addWeapon "EpochRadio0";
		player addItem "FirstAidKit";
		player addPrimaryWeaponItem "acc_flashlight";
		//player action ["GunLightOn", player];
		HALV_takegive = [player,100];
		publicVariableServer "HALV_takegive";
		uiSleep 3;
		systemchat format ["Welcome -=(%1)=-", name player];
	}
	else
	{
	//OLD PLAYER SPAWNNING CONFIG
		//SCREEN COMING BACK SLOWLY
		titleText ["", "BLACK IN", 10];
		//player enableFatigue false;
		waitUntil{!isNull (findDisplay 46) && !dialog && cameraOn isEqualTo player && cameraView == "INTERNAL"};
		player switchCamera "EXTERNAL";
		uiSleep 3;
		systemchat format ["Welcome back -=(%1)=-", name player];
	};
//============================================////============================================//