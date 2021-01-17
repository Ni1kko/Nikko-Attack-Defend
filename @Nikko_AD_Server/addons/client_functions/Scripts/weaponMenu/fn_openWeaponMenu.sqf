/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
disableSerialization;

//Create our menu
createDialog "RscDisplayChooseEditorLayout";

//Setup Menu Title
((findDisplay 164) displayctrl 1000) ctrlSetText format ["%1 Weapon Menu", missionName];

//Setup Purchase Button
((findDisplay 164) displayctrl 1) ctrlSetText "Purchase";
((findDisplay 164) displayctrl 1) buttonSetAction '(findDisplay 164) closeDisplay 0; [] call NikkoClient_script_confirmWeapon;';
((findDisplay 164) displayctrl 1) ctrlCommit 0;

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
			((findDisplay 164) displayctrl 101) lbAdd _displayName;

			//Store data for each weapon in control
			((findDisplay 164) displayctrl 101) lbSetData [(lbSize ((findDisplay 164) displayctrl 101))-1,str _x];
			
			if(_ForEachIndex == 0)then{
				//set first array result at default
				NikkoClient_var_SelectedWeaponPurchase = [_x];
		
				private _picture = [configFile >> "CfgWeapons" >> (_x#6), "picture", ""] call BIS_fnc_returnConfigEntry;

				//set weapon view
				((findDisplay 164) displayctrl (getNumber(configFile >> "RscDisplayChooseEditorLayout" >> "controls" >>  "LayoutPicture" >> "idc"))) ctrlSetText _picture;
				((findDisplay 164) displayctrl (getNumber(configFile >> "RscDisplayChooseEditorLayout" >> "controls" >>  "LayoutPicture" >> "idc"))) ctrlCommit 0;

				//set desctiption
				private _desctiption = (_x#15);
				if(_desctiption == "")then{
					_desctiption = "No Info Specifed";
				};
				((findDisplay 164) displayctrl 1100) ctrlSetStructuredText parseText format["<t size='0.8'>%1</t>",_desctiption];
				((findDisplay 164) displayctrl 1100) ctrlCommit 0;
			};
		};
	};
} forEach (switch (playerSide) do {
	case WEST: {call attackerLoadout};
	case EAST: {call defenderLoadout};
	default {[]};
});

//changed/selected
((findDisplay 164) displayctrl 101) ctrlRemoveAllEventHandlers "LbSelChanged";
((findDisplay 164) displayctrl 101) ctrlAddEventHandler ["LbSelChanged",{
	disableSerialization;
	private _SelectedWeaponPurchase = lbData[101,_this#1];
	NikkoClient_var_SelectedWeaponPurchase = [(if(typeName _SelectedWeaponPurchase == "STRING")then{call compile _SelectedWeaponPurchase}else{[]})];

	private _picture = [configFile >> "CfgWeapons" >> (NikkoClient_var_SelectedWeaponPurchase#0#6), "picture", ""] call BIS_fnc_returnConfigEntry;

	//update weapon picture
	((findDisplay 164) displayctrl (getNumber(configFile >> "RscDisplayChooseEditorLayout" >> "controls" >>  "LayoutPicture" >> "idc"))) ctrlSetText _picture;
	((findDisplay 164) displayctrl (getNumber(configFile >> "RscDisplayChooseEditorLayout" >> "controls" >>  "LayoutPicture" >> "idc"))) ctrlCommit 0;

	//update weapon desctiption
	private _desctiption = (NikkoClient_var_SelectedWeaponPurchase#0#15);
	if(_desctiption == "")then{
		_desctiption = "No Info Specifed";
	};
	((findDisplay 164) displayctrl 1100) ctrlSetStructuredText parseText format["<t size='0.8'>%1</t>",_desctiption];
	((findDisplay 164) displayctrl 1100) ctrlCommit 0;
}];

((findDisplay 164) displayctrl 101) ctrlCommit 0;