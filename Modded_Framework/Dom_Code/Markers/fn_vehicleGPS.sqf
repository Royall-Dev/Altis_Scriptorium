/*
	File: fn_vehicleGPS.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Allows you to put a GPS tracker on a car
*/
params [
	["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle || {player distance _vehicle > 3}) exitWith {};
if !("ItemGPS" in (items player)) exitWith {["You need a GPS.","orange"] call DT_fnc_notify};


["Attaching GPS",15,"AinvPknlMstpSnonWnonDnon_medic_1","isNull objectParent player && player distance _vehicle < 5",
{
	player removeItem "ItemGPS";
	["GPS Tracker attached.","green"] call DT_fnc_notify;
	MB_Interaction_Target setVariable ["tracked",true,false];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Attaching cancelled."};
		case 2: {"You are dead."};
		case 3: {"Attaching failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;