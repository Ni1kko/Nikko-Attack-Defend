/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

private _item = param [0,"",[""]];
if (_item == "") exitWith {false};

private _return = false;

// it is necessary to determine for which weapon this garbage is suitable
private _weapon = switch (true) do {
	case (_item in ([(primaryWeapon player)] call NikkoClient_script_compatibleItems)) : {"rifle"};
	case (_item in ([(handgunWeapon player)] call NikkoClient_script_compatibleItems)) : {"pistol"};
	case (_item in ([(secondaryWeapon player)] call NikkoClient_script_compatibleItems)) : {"launcher"};
	default {""};
};

// Now let's try to add to the gun based on the previous option, or just to inventory
switch (_weapon) do {
	case "rifle" : {
		if !(_item in (primaryWeaponItems player)) then {
			player addPrimaryWeaponItem _item;
			_return = true;
		} else {
			_return = [_item] call NikkoClient_script_addItemToInventory;
		};
	}; 
	case "pistol" : {
		if !(_item in (handgunItems player)) then {
			player addHandgunItem _item;
			_return = true;
		} else {
			_return = [_item] call NikkoClient_script_addItemToInventory;
		};
	}; 
	case "launcher" : {
		if !(_item in (secondaryWeaponItems player)) then {
			player addSecondaryWeaponItem _item;
			_return = true;
		} else {
			_return = [_item] call NikkoClient_script_addItemToInventory;
		};
	};
	default {_return = [_item] call NikkoClient_script_addItemToInventory}; 
};

_return