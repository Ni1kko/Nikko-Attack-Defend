/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

private _index = param [1,-1,[0]];
if (_index == -1) exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.

private _shop = (if(missionNamespace getVariable ["NikkoClient_var_isAttacking",false])then{"Atackers"}else{"Defenders"});
if !(isClass(missionConfigFile >> "NikkoClient_CFG_Shops" >> _shop)) exitWith {systemChat "Bad Data Filter"; closeDialog 0;};

uiNamespace setVariable ["Weapon_Shop_Filter",_index];

private _itemList = ((findDisplay 38400) displayCtrl 38403);
lbClear _itemList;

((findDisplay 38400) displayCtrl 38406) ctrlShow (_index in [0,1]);
((findDisplay 38400) displayCtrl 38407) ctrlShow false;
((findDisplay 38400) displayCtrl 38408) ctrlShow false;
((findDisplay 38400) displayCtrl 38409) ctrlShow false;
((findDisplay 38400) displayCtrl 38410) ctrlShow false;
((findDisplay 38400) displayCtrl 38404) ctrlSetStructuredText parseText "";

private ["_price","_itemInfo"];
switch (_index) do {
	case 0: {//shop inv
		{
			//is an item? 
			if ((_x#1) > 0) then {
				//get item info
				_itemInfo = [_x#0] call NikkoClient_script_itemDetails;

				//any info?
				if(count _itemInfo > 0)then{
					_itemList lbAdd format["%1",_itemInfo select 1];
					_itemList lbSetTextRight [(lbSize _itemList)-1, format["  %1 Warpoints", [_x#1] call NikkoClient_script_numberSafe]];
					_itemList lbSetValue[(lbSize _itemList)-1,_x select 1];
					_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
					_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
				}; 
			};
		} foreach ([missionConfigFile >> "NikkoClient_CFG_Shops" >> _shop, "items" , []] call BIS_fnc_returnConfigEntry);

		((findDisplay 38400) displayCtrl 38405) ctrlSetText "Purchase";
	};

	case 1: {//player inv
		private _config = [];
		private _listedItems = [];

		if (primaryWeapon player != "") then {_config pushBack primaryWeapon player};
		if (secondaryWeapon player != "") then {_config pushBack secondaryWeapon player};
		if (handgunWeapon player != "") then {_config pushBack handgunWeapon player};

		_config = _config + primaryWeaponItems player;
		_config = _config + (assignedItems player);
		_config = _config + (uniformItems player);
		_config = _config + (vestItems player);
		_config = _config + (backPackItems player);
		
		((findDisplay 38400) displayCtrl 38405) ctrlSetText "Sell";
		{
			if ((!(_x in _listedItems)) && (_x != "")) then { //No duplicates or emptys

				//get item info
				_itemInfo = [_x] call NikkoClient_script_itemDetails;

				//No duplicates		
				_listedItems pushBack _x;

				//any info?
				if(count _itemInfo > 0)then{
					_itemCount = { _x == (_itemInfo select 0)} count _config;
					if (_itemCount > 1) then {
						_itemList lbAdd format["[%2] %1",_itemInfo select 1,_itemCount];
					} else {
						_itemList lbAdd format["%1",_itemInfo select 1];
					};
					_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
					_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
				};
			};
		} foreach _config;//all player items
	};

	case 2: {//previous inv
		private _listedLoadouts = [];
		((findDisplay 38400) displayCtrl 38405) ctrlSetText "Purchase Again";
		{ 
			private _loadout = _x; 
			if !(_loadout in _listedLoadouts) then { //No duplicates or emptys
				//No duplicates		
				_listedLoadouts pushBack _loadout;

				private _price = 0;
				{ 
					private _loadoutItems = _x; 
					{
						private _loadoutItem = _x; 
						{if ((_x#0) == _loadoutItem) exitWith {_price = _price + (_x#1);}} foreach ([missionConfigFile >> "NikkoClient_CFG_Shops" >> _shop, "items" , []] call BIS_fnc_returnConfigEntry);
					} forEach _loadoutItems;
				} forEach _loadout;
				
				if(_price > 0)then {
					_itemList lbAdd format["Previous loadout %1",(_forEachIndex + 1)];
					_itemList lbSetData[(lbSize _itemList)-1,str _loadout];
					_itemList lbSetTextRight [(lbSize _itemList)-1, format["  %1 Warpoints", [_price] call NikkoClient_script_numberSafe]];
					_itemList lbSetValue[(lbSize _itemList)-1,_price];
					//_itemList lbSetPicture[(lbSize _itemList)-1,"textures\previousloadout.paa"];		
				};
			};
		} foreach (profileNamespace getVariable [format["NikkoClient_var_previous%1Inv",_shop],[]]);
	};
};

if (isNil {_this select 0}) then {_itemList lbSetCurSel 0};
 