/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

params [["_weapon", "", [""]], ["_typefilter", nil, ["", 0]]];

if (_weapon == "") exitWith {[]};
  
private _compatibleItems = missionNamespace getVariable _weapon;

if (isNil "_compatibleItems") then {
    _compatibleItems = [];
    private _cfgWeapons = configFile >> "CfgWeapons";
    private _weaponConfig = _cfgWeapons >> _weapon;

    if (isClass _weaponConfig) then {
        {
            private _cfgCompatibleItems = _x >> "compatibleItems";

            if (isArray _cfgCompatibleItems) then {
                {
                    _compatibleItems pushBackUnique _x;
                } forEach getArray _cfgCompatibleItems;
            } else {
                if (isClass _cfgCompatibleItems) then {
                    {
                        if (getNumber _x > 0) then {
                            _compatibleItems pushBackUnique configName _x;
                        };
                    } forEach configProperties [_cfgCompatibleItems, "isNumber _x"];
                };
            };
        } forEach configProperties [_weaponConfig >> "WeaponSlotsInfo", "isClass _x"];

        // Ensure item class names are in config case
        _compatibleItems = _compatibleItems apply {configName (_cfgWeapons >> _x)};

       missionNamespace setVariable [_weapon, _compatibleItems]; // save entry in cache
    } else {
        ["'%1' not found in CfgWeapons", _weapon] call BIS_fnc_error;
    };
};

if (isNil "_typefilter") then { //return
    + _compatibleItems
} else {
    if (_typefilter isEqualType "") then {
        _typefilter = [-1, 101, 201, 301, 302] param [["", "muzzle", "optic", "pointer", "bipod"] find _typefilter, -1];
    };

    _compatibleItems select {_typefilter == getNumber (configFile >> "CfgWeapons" >> _x >> "itemInfo" >> "type")}
};