/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

private _value = _this#0;
 

private _return = true;
private _valid = toArray "0123456789";

{
	if !(_x in _valid)exitWith{
		_return = false;
	};
} foreach (toArray _value);

_return;