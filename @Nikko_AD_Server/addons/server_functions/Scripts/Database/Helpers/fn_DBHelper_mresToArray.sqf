/*
	Nikko Renolds & Bryan Boardwine
	Attack & Defend
	Ni1kko@outlook.com
*/ 

private _array = [_this,0,"",[""]] call BIS_fnc_param;
if (_array isEqualTo "") exitWith {[]};
_array = toArray(_array);

for "_i" from 0 to (count _array)-1 do
{
    _sel = _array select _i;
    if (_sel == 96) then
    {
        _array set[_i,39];
    };
};

_array = toString(_array);
_array = call compile format ["%1", _array];
_array;