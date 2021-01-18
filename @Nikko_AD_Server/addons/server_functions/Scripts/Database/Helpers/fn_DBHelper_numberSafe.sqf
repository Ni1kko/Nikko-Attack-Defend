/*
	Nikko Renolds & Karel Moricky
	Attack & Defend
	Ni1kko@outlook.com
*/

private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

private _number = [_this,0,0,[0]] call bis_fnc_param;
private _mod = [_this,1,3,[0]] call bis_fnc_param;

private _digits = _number call bis_fnc_numberDigits;
private _digitsCount = count _digits - 1;
 
private _numberText = "";

{
    _numberText = _numberText + str _x;
    if ((_foreachindex - (_digitsCount % _mod)) % (_mod) isEqualTo 0 && !(_foreachindex isEqualTo _digitsCount)) then {_numberText = _numberText + "";};
} forEach _digits;

_numberText

