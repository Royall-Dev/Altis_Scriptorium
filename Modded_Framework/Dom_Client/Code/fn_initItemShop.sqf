/*
    File: fn_robStore.sqf
    Author: Dom
    Description: Switches player on or off duty
*/
params [
	["_target",objNull,[objNull]],
	"",
	"",
	["_shop","",[""]]
];

[_target,_shop] call DT_fnc_initItemShop;