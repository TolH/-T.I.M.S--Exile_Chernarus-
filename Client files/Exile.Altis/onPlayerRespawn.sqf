if (!hasInterface && !isDedicated) exitWith {};
//============================================////============================================//
	//BLACK SCREEN
		titleText ["", "BLACK", 0];
//============================================////============================================//
if (!isDedicated and hasInterface) then 
{
	waitUntil {alive vehicle player};
	//waituntil {!isnull (finddisplay 46)};
	waitUntil {typeOF player != "Exile_Unit_GhostPlayer"};
	[] execVM "custom\loadout.sqf";
};