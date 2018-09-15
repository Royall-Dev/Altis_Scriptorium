/*
	File: fn_initClothingShop.sqf
	Author: Dom
	Description: Initiliases item shops
*/
params [
	["_shop","",[""]]
];
if (_shop isEqualTo "") exitWith {};
if (!isClass(missionConfigFile >> "Shops" >> "Clothing" >> _shop)) exitWith {};
private _conditions = getText(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "conditions");
if !([_conditions] call DT_fnc_conditionChecker) exitWith {["You cannot use this shop.","orange"] call DT_fnc_notify};

private _uniform = uniform player;
private _vest = vest player;
private _backpack = backpack player;
private _goggles = goggles player;
private _headgear = headgear player;

client_preview = "C_man_polo_2_F" createVehicleLocal [190.764,10128.4,0];

removeUniform client_preview;
removeVest client_preview;
removeBackpack client_preview;
removeGoggles client_preview;
removeHeadgear client_preview;
if !(_uniform isEqualTo "") then {client_preview addUniform _uniform};
if !(_vest isEqualTo "") then {client_preview addVest _vest};
if !(_backpack isEqualTo "") then {client_preview addBackpack _backpack};
if !(_goggles isEqualTo "") then {client_preview addGoggles _goggles};
if !(_headgear isEqualTo "") then {client_preview addHeadgear _headgear};

if !(createDialog "DT_clothingShop") exitWith {deleteVehicle client_preview};
uiNamespace setVariable ["Shop_Type",_shop];
uiNamespace setVariable ["Shop_Filter",0];

client_target = createAgent ["Logic",position client_preview,[],0,"none"];
client_target attachTo [client_preview,client_cameraSettings select 3,""];

client_camera = "CAMERA" camCreate position client_preview;
client_camera cameraEffect ["Internal", "Back"];
client_camera camPrepareFocus [-1,-1];
client_camera camPrepareFov 0.35;
client_camera camCommitPrepared 0;
showcinemaBorder false;
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;

["Clothing",[controlNull,0,0]] call DT_fnc_handleMouse;
preview_handle = addMissionEventHandler ["draw3D",{call DT_fnc_updateCamera}];

private _list = ((findDisplay 1013) displayCtrl 1500);
lbClear _list;
private _filter = ((findDisplay 1013) displayCtrl 2100);
lbClear _filter;
_filter lbAdd "Clothing";
_filter lbAdd "Vests";
_filter lbAdd "Backpacks";
_filter lbAdd "Facewear";
_filter lbAdd "Headgear";
_filter lbSetCurSel 0;