/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

disableSerialization;
if ((lbCurSel 38407) == -1) exitWith {titleText ["You need to select an item to buy/sell.","PLAIN"]};
if !([ctrlText 38408] call NikkoClient_script_isnumber) exitWith {titleText ["Indicate the quantity in digital format, not symbolic","PLAIN"]};

//Get the amount of mags ordered
private _numberofmags = parseNumber(ctrlText 38408);
if (_numberofmags <= 0) exitWith {};

//Do they have the space to buy mags
private _item = lbData[38407,lbCurSel 38407];
if !(player canAdd _item) exitWith {titleText ["You don't have enough room for that item.","PLAIN"]};

//Get cost for single mag
private _price = lbValue[38407,lbCurSel 38407];

//Check they have enough warpoints to purchase the amount they ordered
if ((_price * _numberofmags) > (player getVariable ["NikkoClient_var_warpoints",0])) exitWith {titleText ["You don't have that much warpoints!","PLAIN"]};

//Determinate how much it will cost from how many it can add
private _buyCount = 0;
private _warpointsCount = 0;
for "_x" from 1 to _numberofmags do {
	if ([_item] call NikkoClient_script_addItem) then {
		_buyCount = _buyCount + 1;
		_warpointsCount = _warpointsCount + _price;
	};
};

//Check they bought somthing
if (_buyCount > 0) then {
	player setVariable ["NikkoClient_var_warpoints",((player getVariable ["NikkoClient_var_warpoints",0]) - _warpointsCount)];
	player say3D "caching";
	titleText [format["You bought a %1 (%3/%4) for %2 Warpoints",([_item] call NikkoClient_script_itemDetails) select 1,[_warpointsCount] call NikkoClient_script_numberSafe,_buyCount,_numberofmags],"PLAIN"];
} else {
	titleText ["failed to buy","PLAIN"]
};

//Update balance
ctrlSetText[601,format["Availabile: %1 Warpoints       ",[(player getVariable ["NikkoClient_var_warpoints",0])] call NikkoClient_script_numberSafe]];

true