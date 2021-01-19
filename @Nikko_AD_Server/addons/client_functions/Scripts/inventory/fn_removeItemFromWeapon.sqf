/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

private _item = param [0,"",[""]];
if (_item == "") exitWith {false};

private _return = false;

switch (true) do {
	case (_item in (primaryWeaponItems player + primaryWeaponMagazine player)): {
		player removePrimaryWeaponItem _item;
		_return = true;
	};
	case (_item in (secondaryWeaponMagazine player + secondaryWeaponItems player)): {
		player removeSecondaryWeaponItem _item;
		_return = true;
	};
	case (_item in (handgunMagazine player + handgunItems player)): {
	 	player removeHandgunItem _item;
		_return = true;
	};
	default {};
};

_return