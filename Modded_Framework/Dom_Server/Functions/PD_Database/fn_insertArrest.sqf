/*
	File: fn_insertArrest.sqf
	Author: Dom
	Description: Inserts arrest into the DB
*/

params [
	["_name","",[""]],
	["_crimes","",[""]],
	["_officer","",[""]],
	["_time",30,[0]],
	["_bail",0,[0]]
];

[format["insertArrest:%1:%2:%3:%4",_name,_crimes,_officer,_time,_bail],1] call MySQL_fnc_DBasync;