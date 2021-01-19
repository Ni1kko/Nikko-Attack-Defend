/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
disableSerialization;

//Create our menu
createDialog "RscDisplayChooseEditorLayout";

//Setup Menu Title
((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 1000) ctrlSetText format ["%1 Weapon Menu", missionName];

//Setup Purchase Button
((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 1) ctrlSetText "Purchase";
((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 1) buttonSetAction '(uiNamespace getVariable "RscDisplayChooseEditorLayout") closeDisplay 0; [] call NikkoClient_script_confirmWeapon;';
((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 1) ctrlCommit 0;

//Setup our weapons
{ 
	private _WarpointsBalanceID = format["NikkoClient_var_%1_WarpointsBalance",(getPlayerUID player)];
	private _warpoints = (missionNamespace getVariable [_WarpointsBalanceID,0]);

	if ((isNil 'warpoints_isReady') OR _warpoints >= (_x#14)) then {
		//Set Weapon name 
		private _displayName = (_x#0);
		if(_displayName == "") then {
			_displayName = [configFile >> "CfgWeapons" >> (_x#6), "displayName", ""] call BIS_fnc_returnConfigEntry;
		};

		//Is valid
		if(_displayName != "") then {
			((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 101) lbAdd _displayName;

			//Store data for each weapon in control
			((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 101) lbSetData [(lbSize ((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 101))-1,str _x];
			
			if(_ForEachIndex == 0)then{
				//set first array result at default
				NikkoClient_var_SelectedWeaponPurchase = [_x];
		
				private _picture = [configFile >> "CfgWeapons" >> (_x#6), "picture", ""] call BIS_fnc_returnConfigEntry;

				//set weapon view
				((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl (getNumber(configFile >> "RscDisplayChooseEditorLayout" >> "controls" >>  "LayoutPicture" >> "idc"))) ctrlSetText _picture;
				((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl (getNumber(configFile >> "RscDisplayChooseEditorLayout" >> "controls" >>  "LayoutPicture" >> "idc"))) ctrlCommit 0;

				//set desctiption
				private _desctiption = (_x#15);
				if(_desctiption == "")then{
					_desctiption = "No Info Specifed";
				};
				((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 1100) ctrlSetStructuredText parseText format["<t size='0.8'>%1</t>",_desctiption];
				((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 1100) ctrlCommit 0;
			};
		};
	};
} forEach (switch (playerSide) do {
	case WEST: {call attackerLoadout};
	case EAST: {call defenderLoadout};
	default {[]};
});

//changed/selected
((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 101) ctrlRemoveAllEventHandlers "LbSelChanged";
((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 101) ctrlAddEventHandler ["LbSelChanged",{
	disableSerialization;
	private _SelectedWeaponPurchase = lbData[101,_this#1];
	NikkoClient_var_SelectedWeaponPurchase = [(if(typeName _SelectedWeaponPurchase == "STRING")then{call compile _SelectedWeaponPurchase}else{[]})];

	private _picture = [configFile >> "CfgWeapons" >> (NikkoClient_var_SelectedWeaponPurchase#0#6), "picture", ""] call BIS_fnc_returnConfigEntry;

	//update weapon picture
	((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl (getNumber(configFile >> "RscDisplayChooseEditorLayout" >> "controls" >>  "LayoutPicture" >> "idc"))) ctrlSetText _picture;
	((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl (getNumber(configFile >> "RscDisplayChooseEditorLayout" >> "controls" >>  "LayoutPicture" >> "idc"))) ctrlCommit 0;

	//update weapon desctiption
	private _desctiption = (NikkoClient_var_SelectedWeaponPurchase#0#15);
	if(_desctiption == "")then{
		_desctiption = "No Info Specifed";
	};
	((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 1100) ctrlSetStructuredText parseText format["<t size='0.8'>%1</t>",_desctiption];
	((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 1100) ctrlCommit 0;
}];

((uiNamespace getVariable "RscDisplayChooseEditorLayout") displayctrl 101) ctrlCommit 0;