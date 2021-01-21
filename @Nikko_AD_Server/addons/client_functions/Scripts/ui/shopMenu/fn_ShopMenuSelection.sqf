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

private _shop = (if(missionNamespace getVariable ["NikkoClient_var_isAttacking",false])then{"Atackers"}else{"Defenders"});
private _item = _control lbData _index;

private _itemInfo = [];
private _itemsInfo = [];
private _infoDesc = "";

private _price = -1;
private _priceTemp = 0;

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) in [0,1])then{
	_itemInfo = [_item] call NikkoClient_script_itemDetails;
	[_item,_itemInfo#4] spawn NikkoClient_script_shopBoxDisplay;
	if((_itemInfo#3) != "")then{
		_infoDesc = format ["<br/><br/>%1",_itemInfo#3];
	};
}else{
	_infoDesc = "<br/><br/> ";
	private _loadouts = _item;
	if(typeName _loadouts == "STRING")then{
		_loadouts = call compile _loadouts;
	};
	
	{
		private _loadout = _x;
		/*_loadout params [
			["_helmets",[],[[]]],
			["_googels",[],[[]]],
			["_uniforms",[],[[]]],
			["_weaponRifles",[],[[]]],
			["_weaponLaunchers",[],[[]]],
			["_weaponPistols",[],[[]]],
			["_items",[],[[]]]
		];*/
		{  
			private _loadoutItem = _x; 
			{if ((_x#0) == _loadoutItem) exitWith {
				_priceTemp = _priceTemp + (_x#1);
				_infoDesc = _infoDesc + (_x#0) + "<br/>";
			}} foreach ([missionConfigFile >> "NikkoClient_CFG_Shops" >> _shop, "items" , []] call BIS_fnc_returnConfigEntry);
		}forEach _loadout;
	} foreach _loadouts;
	//[_item,_itemInfo#4] spawn NikkoClient_script_shopBoxDisplay;
};

if(_itemInfo isEqualTo [] AND _itemsInfo isEqualTo []) exitWith {};

if(_priceTemp != 0)then{
	_price = _priceTemp;
};

switch (uiNamespace getVariable["Weapon_Shop_Filter",0]) do {
	case 0: {//shop inv
		//Get Buy Price
		{if ((_x#0) == _item) exitWith {_price = (_x#1);}} foreach ([missionConfigFile >> "NikkoClient_CFG_Shops" >> _shop, "items" , []] call BIS_fnc_returnConfigEntry);

		//Update UI
		if (_price > (player getVariable ["NikkoClient_var_warpoints",0])) then {
			//lacking
			_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%4'>Price: <t color='#ff0000'>%1 Warpoints</t><br/>Lacking: <t color='#3f6b00'>%2 Warpoints</t>%3</t>",[_price] call NikkoClient_script_numberSafe,[_price - (player getVariable ["NikkoClient_var_warpoints",0])] call NikkoClient_script_numberSafe,_infoDesc,(profileNamespace getVariable ['NikkoClient_UI_TXT_HTML','#000000'])];
		} else{
			//cost
			_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%3'>Price: <t color='#3f6b00'>%1 Warpoints</t>%2</t>",[_price] call NikkoClient_script_numberSafe,_infoDesc,(profileNamespace getVariable ['NikkoClient_UI_TXT_HTML','#000000'])];
		};

		//Mags
		if (count (_itemInfo#7) > 0) then {
			//Update UI
			_magsList ctrlShow true;
			_magsCount ctrlShow true;
			_magsButton ctrlShow true;
			_magsBG ctrlShow true;
			lbClear _magsList;
			{
				private _magPrice = 100;//Still to be added
				if (_magPrice > 0) then {
					private _magInfo = [_x] call NikkoClient_script_itemDetails;
					_magsList lbAdd format["%1",_magInfo select 1];
					_magsList lbSetTextRight [(lbSize _magsList)-1, format["  %1 warpoints", [_magPrice] call NikkoClient_script_numberSafe]];
					_magsList lbSetData[(lbSize _magsList)-1,_magInfo select 0];
					_magsList lbSetValue[(lbSize _magsList)-1,_magPrice];
					_magsList lbSetPicture[(lbSize _magsList)-1,_magInfo select 2];
				};
			} forEach (_itemInfo select 7);
		};
	};
	case 1: {//player inv
		//Get Sell Price
		{if ((_x#0) == _item) exitWith {_price = (_x#2);}} foreach ([missionConfigFile >> "NikkoClient_CFG_Shops" >> _shop, "items" , []] call BIS_fnc_returnConfigEntry);
		//Update UI
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%3'>Price: <t color='#3f6b00'>%1 Warpoints</t>%2</t>",_price,_infoDesc,(profileNamespace getVariable ['NikkoClient_UI_TXT_HTML','#000000'])];
	};
	case 2: {//previous inv 
		//Update UI
		if (_price > (player getVariable ["NikkoClient_var_warpoints",0])) then {
			//lacking
			_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%4'>Price: <t color='#ff0000'>%1 Warpoints</t><br/>Lacking: <t color='#3f6b00'>%2 Warpoints</t>%3</t>",[_price] call NikkoClient_script_numberSafe,[_price - (player getVariable ["NikkoClient_var_warpoints",0])] call NikkoClient_script_numberSafe,_infoDesc,(profileNamespace getVariable ['NikkoClient_UI_TXT_HTML','#000000'])];
		} else{
			//cost
			_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%3'>Price: <t color='#3f6b00'>%1 Warpoints</t>%2</t>",[_price] call NikkoClient_script_numberSafe,_infoDesc,(profileNamespace getVariable ['NikkoClient_UI_TXT_HTML','#000000'])];
		};
	};
};
 