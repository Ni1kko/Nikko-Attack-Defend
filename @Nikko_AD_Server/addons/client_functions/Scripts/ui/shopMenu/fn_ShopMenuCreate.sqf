/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

disableSerialization;
if !(createDialog "NikkoClient_RSC_ShopMenu") exitwith {};

//Tilte
private _shop = (if(missionNamespace getVariable ["NikkoClient_var_isAttacking",false])then{"Atackers"}else{"Defenders"});
ctrlSetText[38401,([missionConfigFile >> "NikkoClient_CFG_Shops" >> _shop, "displayName", ""] call BIS_fnc_returnConfigEntry)];

//Balance
ctrlSetText[601,format["Available Warpoints: %1       ",[(player getVariable ["NikkoClient_var_warpoints",0])] call NikkoClient_script_numberSafe]];

//Filters
private _filters = ((findDisplay 38400) displayCtrl 38402);

lbClear _filters;
_filters lbAdd "Shop Inventory";
_filters lbAdd "Your Inventory";
_filters lbAdd "Previous Inventory";
_filters lbSetCurSel 0;

if(count(profileNamespace getVariable [format["NikkoClient_var_previous%1Inv",_shop],[]]) > 0) then{
	_filters lbSetCurSel 2;
};

[] call NikkoClient_script_shopBoxCreate;

[] spawn {
	while {true} do {
		if (isNull (findDisplay 38400)) exitWith {
			//[] call NikkoClient_script_saveGear;
			[] call NikkoClient_script_shopBoxDestroy;
		};
		uiSleep 0.3;
	};
};