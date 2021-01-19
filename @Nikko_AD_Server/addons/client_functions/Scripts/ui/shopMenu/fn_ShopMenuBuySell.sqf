/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
disableSerialization;
if ((lbCurSel 38403) == -1) exitWith {titleText ["You need to select an item to buy/sell.","PLAIN"]};

//Get amount of item they want to sell
private _numberOfItems = ctrlText 38406;
if !([_numberOfItems] call NikkoClient_script_isnumber) exitWith {titleText ["Indicate the quantity in digital format, not symbolic","PLAIN"]};
_numberOfItems = parseNumber(_numberOfItems);
if (_numberOfItems <= 0) exitWith {};

//Get item witch they like to sell
private _item = lbData[38403,lbCurSel 38403];
private _itemInfo = [_item] call NikkoClient_script_itemDetails;
if (_itemInfo isEqualTo []) exitWith {};

if (uiNamespace getVariable["Weapon_Shop_Filter",0] == 1) then {
	private _playerItems = [] call NikkoClient_script_getPlayerItems;
	private _indexP = [_item,_playerItems] call NikkoClient_script_index;
	if (_numberOfItems > ((_playerItems select _indexP) select 1)) exitWith {titleText ["You do not have so many items in your inventory","PLAIN"]};

	private _warpointsCount = 0;
	private _sellCount = 0;
	for "_x" from 1 to _numberOfItems do {
		if ([_item] call NikkoClient_script_removeItem) then {
			_warpointsCount = _warpointsCount + 0;//still to be added
			_sellCount = _sellCount + 1;
		};
	};
	if (_sellCount > 0) then {
		player setVariable ["NikkoClient_var_warpoints",((player getVariable ["NikkoClient_var_warpoints",0]) + _warpointsCount)];
		//player say3D "caching";

		titleText [format["You sold a %1 (%3/%4) for %2Warpoints",_itemInfo select 1,[_warpointsCount] call NikkoClient_script_numberSafe,_sellCount,_numberOfItems],"PLAIN"];
		[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call NikkoClient_script_weaponShopFilter; //Update the menu.
	} else {
		titleText ["Failed to sell","PLAIN"]
	};
} else {
	private _price = lbValue[38403,lbCurSel 38403];
	if ((_price * _numberOfItems) > (player getVariable ["NikkoClient_var_warpoints",0])) exitWith {titleText ["You don't have that much warpoints!","PLAIN"]};

	private _buyCount = 0;
	private _warpointsCount = 0;
	for "_x" from 1 to _numberOfItems do {
		if ([_item] call NikkoClient_script_addItem) then {
			_buyCount = _buyCount + 1;
			_warpointsCount = _warpointsCount + _price;
		};
	};

	if (_buyCount > 0) then {
		player setVariable ["NikkoClient_var_warpoints",((player getVariable ["NikkoClient_var_warpoints",0]) - _warpointsCount)];
		//player say3D "caching";
		titleText [format["You bought a %1 (%3/%4) for %2Warpoints",_itemInfo select 1,[_warpointsCount] call NikkoClient_script_numberSafe,_buyCount,_numberOfItems],"PLAIN"];
	} else {
		titleText ["Failed to buy","PLAIN"]
	};
};

ctrlSetText[601,format["Availabile: %1Warpoints       ",[(player getVariable ["NikkoClient_var_warpoints",0])] call NikkoClient_script_numberSafe]];

true