/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

private _item = param [0,"",[""]];
if (_item == "") exitWith {false};

private _itemInfo = [_item] call NikkoClient_script_itemDetails;
private _category = _itemInfo select 4;
private _type = _itemInfo select 5;

if (_category == "") exitWith {false};

private _return = false;
switch (_category) do {
	case "Weapon": {
		_return = [_item] call NikkoClient_script_removeItemFromInventory;
		if !(_return) then {
			switch (true) do {
				case ((primaryWeapon player) == _item) : {
					{
						if (_x != "") then {
							[_x] call NikkoClient_script_addItemToInventory;
							player removePrimaryWeaponItem _x;
						};
					} forEach (primaryWeaponItems player);
					player removeWeapon _item;
					_return = true;
				};
				case ((handgunWeapon player) == _item) : {
					{
						if (_x !="") then {
							[_x] call NikkoClient_script_addItemToInventory;
							player removeHandgunItem _x;
						};
					} forEach (handgunItems player);
					player removeWeapon _item;
					_return = true;
				};
				case ((secondaryWeapon player) == _item) : {
					{
						if (_x != "") then {
							[_x] call NikkoClient_script_addItemToInventory;
							player removeSecondaryWeaponItem _x;
						};
					} forEach (secondaryWeaponItems player);
					player removeWeapon _item;
					_return = true;
				};
			};
		};
	};
	case "Equipment": {
		switch (_type) do {			
			case "Glasses": {
				_return = [_item] call NikkoClient_script_removeItemFromInventory;
				if !(_return) then {
					if ((goggles player) == _item) then {
						removeGoggles player;
						_return = true;
					};
				};				
			};
			case "Headgear": {
				_return = [_item] call NikkoClient_script_removeItemFromInventory;
				if !(_return) then {
					if ((headGear player) == _item) then {
						removeHeadgear player;
						_return = true;
					};
				};
			};
			case "Vest": {
				_return = [_item] call NikkoClient_script_removeItemFromInventory;
				if !(_return) then {
					if ((vest player) == _item) then {
						removeVest player;
						_return = true;
					};
				};
			};
			case "Uniform": {
				_return = [_item] call NikkoClient_script_removeItemFromInventory;
				if !(_return) then {
					if ((uniform player) == _item) then {
						removeUniform player;
						_return = true;
					};
				};
			};
			case "Backpack": {			
				_return = [_item] call NikkoClient_script_removeItemFromInventory;		
				if !(_return) then {
					if ((backpack player) == _item) then {
						removeBackpack player;
						_return = true;
					};
				};
			};
		};
	};
	case "Magazine": {
		_return = [_item] call NikkoClient_script_removeItemFromWeapon;
		if !(_return) then {
			_return = [_item] call NikkoClient_script_removeItemFromInventory;
		};
	};
	case "Item": {
		switch (true) do {
			// bipod, sights, ect
			case (_type in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]) : {
				_return = [_item] call NikkoClient_script_removeItemFromWeapon;
				if !(_return) then {
					_return = [_item] call NikkoClient_script_removeItemFromInventory;
				};
			};
			default {
				_return = [_item] call NikkoClient_script_removeItemFromInventory;
			};
		};
	};
};

_return