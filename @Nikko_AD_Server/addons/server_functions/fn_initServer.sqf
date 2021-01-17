/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
params[
    ["_clientData",[[],false],[[]]],
    ["_serverCommandPass","",[""]],
	["_isLiveServer",true,[false]]
];

//Add Connection Event Handlers
NikkoServer_var_ClientConnected = call compile ("addMissionEventHandler ['PlayerConnected', {[_this#1,_this#2,_this#3,_this#4,"+str(_clientData)+","+str(_isLiveServer)+"] spawn NikkoServer_script_onplayerconnected}]");
NikkoServer_var_ClientDisconnected = call compile ("addMissionEventHandler ['PlayerDisconnected', {[_this#1,_this#2,_this#3,_this#4] spawn NikkoServer_script_onplayerdisconnected}]");

if ((is3DEN || is3DENMultiplayer) AND !isMultiplayer) then {
    ["3DEN",profileName,true,2,_clientData,_isLiveServer] spawn NikkoServer_script_onplayerconnected;
};

[]spawn{
    private _players = [];
    while {1==1} do {
        waitUntil{ uiSleep 0.1; (count allPlayers > 0) };
        {
            if(!(_x in _players))then{
                [[],{
                    systemChat "Server Loaded";
                }]remoteExec ["call",owner _x];
                _players pushBackUnique _x;
            };
            uiSleep 0.1;
        } forEach allPlayers;
        uiSleep 0.3;
    };
};

diag_log "Server started";

//Server Ready => UNLOCK
_serverCommandPass serverCommand "#unlock";