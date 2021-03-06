waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information

*/


//Start erst nach Spawn
waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};

_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];

[] spawn {
	uiSleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		uiSleep 1;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | COPS: %2 | CIVS: %3 | MEDICS: %4 | MONEY: %5 | ATM: %6 | PLAYERS: %7", round diag_fps, west countSide allPlayers, civilian countSide allPlayers, independent countSide allPlayers,[life_cash] call life_fnc_numberText,[life_atmcash] call life_fnc_numberText, count allPlayers,_counter];
	};
};
