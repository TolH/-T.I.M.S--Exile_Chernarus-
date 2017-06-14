pvpfw_chatIntercept_allCommands = [
	[
		"help",
		{
			_commands = "";
			{
				_commands = _commands + (pvpfw_chatIntercept_commandMarker + (_x select 0)) + ", ";
			}forEach pvpfw_chatIntercept_allCommands;
			systemChat format["Available Commands: %1",_commands];
		}
	],
	[
		"gear",
		{
			["Open",true] spawn BIS_fnc_arsenal;
		}
	],
	[
		"tp",
		{
			execVM "custom\teleport.sqf";
		}
	]
];