/*
	Nikko Renolds & Bryan Boardwine
	Attack & Defend
	Ni1kko@outlook.com
*/

private _string = [_this,0,"",[""]] call BIS_fnc_param;
private _filter = "'/\`:|;,{}-""<>";

_string = toArray _string; //Blow it up to an array
_filter = toArray _filter; //Blow it up to an array

{
    if (_x in _filter) then {
        _string deleteAt _forEachIndex;
    };
} forEach _string;

toString _string;
