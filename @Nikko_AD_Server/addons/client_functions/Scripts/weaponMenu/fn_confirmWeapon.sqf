/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
NikkoClient_var_SelectedWeaponPurchase params [
	["_loadout",[],[[]]]
];

private _isOkay = false;

//Deduct warpoints
if (!(isNil 'warpoints_isReady')) then {
	private _cost = [_loadout,14,0,[0]] call BIS_fnc_param;
	private _warpointsBalanceID = format["NikkoClient_var_%1_WarpointsBalance",(getPlayerUID player)];
	private _warpoints = (missionNamespace getVariable [_warpointsBalanceID,0]);

	if(_cost <= _warpoints)then{ 
		_isOkay = true;
		_warpoints = _warpoints - _cost;
		missionNamespace setVariable [_warpointsBalanceID,_warpoints];
	};
};

//Succses Give Them The Class
if (_isOkay || isNil 'warpoints_isReady') then {
	[_loadout] spawn NikkoClient_script_assignLoadout;
};