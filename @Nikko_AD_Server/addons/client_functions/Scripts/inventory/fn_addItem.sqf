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
	//weapons are the most valuable, therefore, we do not allow disappearance and replacement
	case "Weapon": {
		private _config = configFile >> "CfgWeapons" >> _item;
		if (!isClass _config OR (getNumber (_config >> "scope") < 1)) exitWith {_return};
		
		// can we add directly to the hands
		private _canAdd = switch (getNumber (_config >> "type")) do {
			case (1): {(primaryWeapon player) == ""};
			case (2): {(handgunWeapon player) == ""};
			case (4): {(secondaryWeapon player) == ""};
			default {false};
		};

		// add if the desired slot is free
		if (_canAdd) then {
			player addWeapon _item;
			_return = true;
		} else {
			// try to add to inventory
			_return = [_item] call NikkoClient_script_addItemToInventory;
		};
	};
	// we have simpler clothes, the main thing is to save the contents
	case "Equipment": {
		switch (_type) do {
			case "Glasses": {
				if ((goggles player) == "") then {
					player addGoggles _item;
					_return = true;
				} else {
					[(goggles player)] call NikkoClient_script_addItemToInventory; // try to add the current item to inventory
					removeGoggles player;
					player addGoggles _item;
					_return = true;
				};
			};
			case "Headgear": {
				if ((headGear player) == "") then {
					player addHeadGear _item;
					_return = true;
				} else {
					[(headGear player)] call NikkoClient_script_addItemToInventory; // try to add the current item to inventory
					removeHeadGear player;
					player addHeadgear _item;
					_return = true;
				};
			};
			case "Vest": {
				if ((vest player) == "") then {
					player addVest _item;
					_return = true;
				} else {
					[(vest player)] call NikkoClient_script_addItemToInventory; // try to add the current item to inventory
					private _items = (vestItems player);
					removeVest player;
					player addVest _item;
					{
						[_x,"vest"] call NikkoClient_script_addItemToInventory;
					} forEach _items;
					_return = true;
				};
			};
			case "Uniform": {
				if ((uniform player) == "") then {
					player forceAddUniform _item;
					_return = true;
				} else {
					[(uniform player)] call NikkoClient_script_addItemToInventory; // try to add the current item to inventory
					private _items = (uniformItems player);
					removeUniform player;
					player forceAddUniform _item;
					{
						[_x,"uniform"] call NikkoClient_script_addItemToInventory;
					} forEach _items;
					_return = true;
				};
			};
			case "Backpack": {
				if ((backpack player) == "") then {
					player addBackpack _item;
					clearAllItemsFromBackpack player;
					_return = true;
				} else {
					private _items = (backpackItems player);
					removeBackpack player;
					player addBackpack _item;
					clearAllItemsFromBackpack player;
					{
						[_x,"backpack"] call NikkoClient_script_addItemToInventory;
					} forEach _items;
					_return = true;
				};
			};
			default {};
		};
	};
	// clips. while we just throw in inventory
	case "Magazine": {
		_return = [_item] call NikkoClient_script_addItemToInventory;
	};
	// now with all sorts of trash  
	case "Item": {
		switch (true) do {
			//bipod, sights, ect
			case (_type in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]) : {
				_return = [_item] call NikkoClient_script_addItemToWeapon;
			};
			//map, binoculars, etc.
			case (_type in ["Compass","GPS","Map","Radio","Watch","NVGoggles","UAVTerminal","MineDetector","LaserDesignator","Binocular"]) : {
				if (_item in (assignedItems player)) then {
					_return = [_item] call NikkoClient_script_addItemToInventory;
				} else {
					switch (true) do { 
						case (_type == "Binocular") : {
							player addWeapon _item; _return = true;
						};
						default {
							_return = [_item] call NikkoClient_script_addItemToInventory;
							player assignItem _item;
						}; 
					};
				};
			}; 
			default {_return = [_item] call NikkoClient_script_addItemToInventory};
		};
	};
	default {};
};

_return