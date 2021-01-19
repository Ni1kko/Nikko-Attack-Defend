/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
params [
	["_item","",[""]],
	["_box",objNull,[objNull]],
	["_global",true,[false]]
];

if ((_item == "") OR isNull _box) exitWith {};

private _itemInformation = [_item] call NikkoClient_script_itemDetails;
private _itemCategory = _itemInformation select 4;
private _itemType = _itemInformation select 5;

if (_itemCategory == "") exitWith {false};

private _added = false;
switcH (_itemCategory) do {
	case "Weapon": {
		if (_global) then {_box addWeaponCargoGlobal [_item, 1]} else {_box addWeaponCargo [_item, 1]};
		_added = true;
	};
	case "Mine";//TO BE FIXED (Deleted it by accident)
	case "Magazine": {			
		if (_global) then {_box addMagazineCargoGlobal [_item, 1]} else {_box addMagazineCargo [_item, 1]};
		_added = true;
	};
	default {
		if (_itemType == "Backpack") then {
			if (_global) then {_box addBackpackCargoGlobal [_item, 1]} else {_box addBackpackCargo [_item, 1]};			
			_added = true;
		} else {			
			if (_global) then {_box addItemCargoGlobal [_item, 1]} else {_box addItemCargo [_item, 1]};
			_added = true;
		};
	};
};

_added