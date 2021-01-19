/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
params [
    ["_player",player,[objNull]]
];

waitUntil {!isNull(uiNamespace getVariable "RscDisplayMission") && {getclientstatenumber >= 10}};

//set player vars
_player enableFatigue false;
_player enableStamina false;
_player setVariable ["playerSteamID",getPlayerUID _player];

//Setup Map Object
[] call NikkoClient_script_setupBillboards;
[] call NikkoClient_script_setupInfoStands;
[] spawn NikkoClient_script_setupWeaponBoxes;

//Key handlers
[] call NikkoClient_script_keyDownHandler;
[] call NikkoClient_script_keyUpHandler;

//Mouse handlers
[] call NikkoClient_script_mouseScrollHandler;

//Enable player
[_player,true] remoteExecCall ["enableDynamicSimulation",2];
[_player,true] remoteExecCall ["enableSimulationGlobal",2];
[_player,false] remoteExecCall ["hideObjectGlobal",2];
_player allowDamage true;
_player enableStamina true;

//ALL DONE
systemChat "Client Loaded";
diag_log "Client started";