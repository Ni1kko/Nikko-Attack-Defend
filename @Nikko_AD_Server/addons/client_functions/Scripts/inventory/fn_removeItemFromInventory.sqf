/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
private _item = param [0,"",[""]];
if (_item == "") exitWith {false};

private _return = false;

switch (true) do {
	case (_item in (uniformItems player)): {
		private _oldCount = count (uniformItems player);
		player removeItemFromUniform _item;
		_return = if (count (uniformItems player) < _oldCount) then {true};		 
	};
	case (_item in (vestItems player)): {
		private _oldCount = count (vestItems player);
		player removeItemFromVest _item;
		_return = if (count (vestItems player) < _oldCount) then {true};
	};
	case (_item in (backpackItems player)) : {
		private _oldCount = count (backpackItems player);
		player removeItemFromBackpack _item;
		_return = if (count (backpackItems player) < _oldCount) then {true};
	};
	case (_item in (assignedItems player)): {
		private _oldCount = count (assignedItems player);
		player unlinkItem _item;
		_return = if (count (assignedItems player) < _oldCount) then {true};
	};
	default {};
};

_return