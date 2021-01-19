
/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

params ["_item","_stack"];

private _return = -1;

{
	if (_item in _x) exitWith {
		_return = _forEachIndex;
	};
} foreach _stack;

_return;