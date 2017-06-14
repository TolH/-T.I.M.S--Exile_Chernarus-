/*
										-=TolH=- 
								(Loot_Crate_Markers.sqf)
								  Track mission loot markers.
					Usage: 
					LOOT_TRACKER = 1;
					[_supplyBox1, _supplyBox2] execVM LOOT_MARKER;
*/
//============================================////============================================//
	//OBJECTS ARRAY
	_Crate1 = _this select 0;	// first element of passed array is read,
	_Crate2 = _this select 1;	// second element of passed array is read,
//============================================////============================================//
	//VAR
	_CRATE1_TRACKING = 1;
	_CRATE2_TRACKING = 1;
//============================================////============================================//
	//START TRACKING
	while {LOOT_TRACKER isEqualTo 1} do 
	{
	  //MOVE MARKER EVERY 5 SECONDS
	  uiSleep 5;
	  "Crate_1" setmarkerpos getPos _Crate1;
	  "Crate_2" setmarkerpos getPos _Crate2;
		//TRACK CRATE #1
		if ((!alive _Crate1) && (_CRATE1_TRACKING isEqualTo 1)) then
		{
			deletevehicle _Crate1;
			deleteMarker "Crate_1";
			//STOP TRACKING
			_CRATE1_TRACKING = 0;
		};
		//TRACK CRATE #2
		if ((!alive _Crate2) && (_CRATE2_TRACKING isEqualTo 1)) then
		{
			deletevehicle _Crate2;
			deleteMarker "Crate_2";
			//STOP TRACKING
			_CRATE2_TRACKING = 0;
		};
		//STOP TRACKING
		if ((_CRATE1_TRACKING isEqualTo 0) && (_CRATE2_TRACKING isEqualTo 0)) then
		{
			//STOP TRACKING
			LOOT_TRACKER = 0;
		};
	};
//============================================////============================================//