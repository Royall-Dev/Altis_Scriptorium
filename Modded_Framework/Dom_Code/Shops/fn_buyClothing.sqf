/*
	File: fn_buyClothing.sqf
	Author: Dom
	Description: Buys selected clothing
*/

closeDialog 0;
private _totalPrice = 0;
{
	_x params ["_item","_singlePrice"];
	if !(_item isEqualTo "") then {
		_totalPrice = _totalPrice + _singlePrice;
		switch _forEachIndex do {
			case 0: {
				private _items = uniformItems player;
				removeUniform player; 
				player addUniform _item;
				{
					player addItemToUniform _x;
				} forEach _items;
			};
			case 1: {
				private _items = vestItems player;
				removeVest player; 
				player addVest _item;
				{
					player addItemToVest _x;
				} forEach _items;
			};
			case 2: {
				private _items = backpackItems player;
				removeBackpack player; 
				player addBackpack _item;
				{
					player addItemToBackpack _x;
				} forEach _items;
			};
			case 3: {
				removeGoggles player; 
				player addGoggles _item;
			};
			case 4: {
				removeHeadgear player; 
				player addHeadgear _item;
			};
		};
	};
} forEach client_purchase;

client_cash = client_cash - _totalPrice;
[0] call DT_fnc_saveStatsPartial;
[2] call DT_fnc_saveStatsPartial;