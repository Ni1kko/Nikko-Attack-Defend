/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
private _shop = (if(missionNamespace getVariable ["NikkoClient_var_isAttacking",false])then{"Atackers"}else{"Defenders"});

private _loadout = [];

//Add players current gear to loadout
//_loadout pushBack []

//save loadout
profileNamespace setVariable [format["NikkoClient_var_previous%1Inv",_shop],_loadout];