/*
    File: fn_arrestPlayer.sqf
    Author: Dom
    Description: Arrests the player
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit] call DT_fnc_checkPlayer) exitWith {["Invalid target.","red"] call DT_fnc_notify};
if !(_unit getVariable ["restrained",false]) exitWith {["Person must be restrained."] call DT_fnc_notify; closeDialog 0};

private _display = findDisplay 1009;
private _hours = parseNumber (ctrlText (_display displayCtrl 1400));
private _minutes = parseNumber (ctrlText (_display displayCtrl 1401));
private _seconds = parseNumber (ctrlText (_display displayCtrl 1402));
private _crimes = ctrlText (_display displayCtrl 1403);
closeDialog 0;

private _time = _seconds + (_minutes * 60) + (_hours * 3600);

//private _cells = [["A01",[0,0,0]],["A02",[0,0,0]]]; //cell name, location
//(selectRandom _cells) params ["_cell"];

_unit setVariable ["jail_details",[1,_crimes,_time,""],true];
_unit setPosATL (getMarkerPos "Jail_Default");
_unit setVariable ["restrained",false,true];

[_time] remoteExec ["DT_fnc_jailTimer",_unit];
