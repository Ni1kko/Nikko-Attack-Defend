/*
	Nikko Renolds & Bryan Boardwine
	Attack & Defend
	Ni1kko@outlook.com
*/

private _bool = [_this,0,0,[false,0]] call BIS_fnc_param;

switch ([_this,1,0,[0]] call BIS_fnc_param) do {
    case 0: {
        if (_bool isEqualType 0) exitWith {0};
        if (_bool) then {1} else {0};
    };

    case 1: {
        if (!(_bool isEqualType 0)) exitWith {false};
        switch (_bool) do {
            case 0: {false};
            case 1: {true};
        };
    };
};
