/*
	Nikko Renolds & Bryan Boardwine
	Attack & Defend
	Ni1kko@outlook.com
*/

private _array = [_this,0,[],[[]]] call BIS_fnc_param;
_array = str _array;
_array = toArray(_array);

for "_i" from 0 to (count _array)-1 do
{
    _sel = _array select _i;
    if (!(_i isEqualTo 0) && !(_i isEqualTo ((count _array)-1))) then
    {
        if (_sel isEqualTo 34) then
        {
            _array set[_i,96];
        };
    };
};

str(toString(_array));
