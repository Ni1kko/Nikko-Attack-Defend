/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
if (isNull _control OR _index == -1) exitWith {closeDialog 0;}; //Bad data

private _priceTag = ((findDisplay 38400) displayCtrl 38404);
private _magsList = ((findDisplay 38400) displayCtrl 38407);
private _magsCount = ((findDisplay 38400) displayCtrl 38408);
private _magsButton = ((findDisplay 38400) displayCtrl 38409);
private _magsBG = ((findDisplay 38400) displayCtrl 38410);

_magsList ctrlShow false;
_magsCount ctrlShow false;
_magsButton ctrlShow false;
_magsBG ctrlShow false;

private _item = _control lbData _index;
private _itemInfo = [_item] call NikkoClient_script_itemDetails;

//[_item,_itemInfo#4] spawn NikkoClient_script_shopBoxRotate;

private _infoDesc =(if((_itemInfo#3) != "")then{format ["<br/><br/>%1",_itemInfo#3]}else{""});

private _shop = (if(missionNamespace getVariable ["NikkoClient_var_isAttacking",false])then{"Atackers"}else{"Defenders"});

if ((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then {
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%3'>Price: <t color='#3f6b00'>$%1</t>%2</t>",0,_infoDesc,(profileNamespace getVariable ['NikkoClient_UI_TXT_HTML','#000000'])];
} else {
	private _price = -1;
	{ 
		if ((_x#0) == _item) exitWith {
			_price = (_x#1);
		};
	} foreach ([missionConfigFile >> "NikkoClient_CFG_Shops" >> _shop, "items" , []] call BIS_fnc_returnConfigEntry);

	if (_price > (player getVariable ["NikkoClient_var_warpoints",0])) then {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%4'>Price: <t color='#ff0000'>%1Warpoints</t><br/>Lacking: <t color='#3f6b00'>$%2</t>%3</t>",[_price] call NikkoClient_script_numberSafe,[_price - (player getVariable ["NikkoClient_var_warpoints",0])] call NikkoClient_script_numberSafe,_infoDesc,(profileNamespace getVariable ['NikkoClient_UI_TXT_HTML','#000000'])];
	} else{
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%3'>Price: <t color='#3f6b00'>%1Warpoints</t>%2</t>",[_price] call NikkoClient_script_numberSafe,_infoDesc,(profileNamespace getVariable ['NikkoClient_UI_TXT_HTML','#000000'])];
	};

	//Mags
	if (count (_itemInfo#7) > 0) then {
		_magsList ctrlShow true;
		_magsCount ctrlShow true;
		_magsButton ctrlShow true;
		_magsBG ctrlShow true;
		lbClear _magsList;

		private ["_magPrice","_magInfo"];
		{
			_magPrice = 100;
			if (_magPrice > 0) then {
				_magInfo = [_x] call NikkoClient_script_itemDetails;
				_magsList lbAdd format["%1",_magInfo select 1];
				_magsList lbSetTextRight [(lbSize _magsList)-1, format["  %1warpoints", [_magPrice] call NikkoClient_script_numberSafe]];
				_magsList lbSetData[(lbSize _magsList)-1,_magInfo select 0];
				_magsList lbSetValue[(lbSize _magsList)-1,_magPrice];
				_magsList lbSetPicture[(lbSize _magsList)-1,_magInfo select 2];
			};
		} forEach (_itemInfo select 7);
	};
};