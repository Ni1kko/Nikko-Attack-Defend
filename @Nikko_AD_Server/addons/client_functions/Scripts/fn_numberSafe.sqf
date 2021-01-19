/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

private _number = [_this,0,0,[0]] call bis_fnc_param;
private _mod = [_this,1,3,[0]] call bis_fnc_param;

private _digits = _number call bis_fnc_numberDigits;
private _digitsCount = count _digits - 1;

private _modBase = _digitsCount % _mod;
private _numberText = "";
{
	_numberText = _numberText + str _x;
	if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + ",";};
} foreach _digits;
_numberText