/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

private _value = _this#0;

if(typeName _value != "STRING")then{
	_value = str _value;
};

private _return = true;
private _valid = ["48","49","50","51","52","53","54","55","56","57"];

{
	if !((str _x) in _valid)exitWith{
		_return = false;
	};
} foreach (toArray _value);

_return;