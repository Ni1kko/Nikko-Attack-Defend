/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

params [
	["_item","",[""]],
	["_to","",[""]]
];

if (_item == "") exitWith {false};
private _return = false;

if (_to == "") then {
	switch (true) do {
		case (player canAddItemToBackpack _item) : {
			player addItemToBackpack _item;
			_return = true;
		};
		case (player canAddItemToVest _item) : {
			player addItemToVest _item;
			_return = true;
		}; 
		case (player canAddItemToUniform _item) : {
			player addItemToUniform _item;
			_return = true;
		};
		default {
			private _weaponHolder = nearestObject [player, "WeaponHolder"];
        	if (isNull _weaponHolder OR {player distance _weaponHolder > 2}) then {
        	    _weaponHolder = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "NONE"];
        	    _weaponHolder setPosASL getPosASL player;
        	};
        	_return = [_item,_weaponHolder] call NikkoClient_script_addItemToBox;
        	if (_return) then {
        		systemChat "You have no free space in your inventory, so the item has been dropped to the ground! Do not forget to pick it up!";
        	};
		};
	};
} else {
	switch (_to) do {
		case "backpack" : {
			if (player canAddItemToBackpack _item) then {
				player addItemToBackpack _item;
				_return = true;
			} else {
				_return = [_item] call NikkoClient_script_addItemToInventory;
			};
		};
		case "vest" : {
			if (player canAddItemToVest _item) then {
				player addItemToVest _item;
				_return = true;
			} else {
				_return = [_item] call NikkoClient_script_addItemToInventory;
			}
		};
		case "uniform" : {
			if (player canAddItemToUniform _item) then {
				player addItemToUniform _item;
				_return = true;
			} else {
				_return = [_item] call NikkoClient_script_addItemToInventory;
			}
		};
	};
};

_return