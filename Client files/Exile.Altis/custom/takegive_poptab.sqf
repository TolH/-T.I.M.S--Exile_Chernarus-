/*
	Original HALV_takegive_crypto.sqf by Halv
	Copyright (C) 2015  Halvhjearne > README.md
	Edit to takegive_poptab.sqf for Exile by Dodo
*/

_player = _this select 0;
_costsMoney = _this select 1;
_costsRespect = _this select 2;

_money = _player getVariable ["ExileMoney", 0];
_respect = _playerObj getVariable ["ExileScore", 0];
_money = _money - _costsMoney;
_respect = _respect - _costsRespect;
_player setVariable ["ExileMoney", _money];
_player setVariable ["ExileScore", _respect];
format["setAccountMoney:%1:%2", _money, (getPlayerUID _player)] call ExileServer_system_database_query_fireAndForget;
format["setAccountScore:%1:%2", _respect, (getPlayerUID _player)] call ExileServer_system_database_query_fireAndForget;

[_player, "purchaseVehicleSkinResponse", [0, str _money]] call ExileServer_system_network_send_to;
//[_player, "purchaseVehicleSkinResponse", [0, str _money]] call ExileServer_system_network_send_to;
