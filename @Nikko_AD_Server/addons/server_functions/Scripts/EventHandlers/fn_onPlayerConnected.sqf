/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

params [
	['_uid','',['']],
	['_name','',['']],
	['_jip',false,[false]],
	['_owner',2,[0]],
    ["_clientData",[[],false],[[]]],
	['_isLiveServer',true,[false]]
];

//Players only
if (_owner < ([3,2] select is3DENMultiplayer)) exitWith {false};

//Send preinit
[_this, {
	params [
		['_uid',""],
		['_name',""],
		['_jip',false],
		['_owner',2],
		["_clientData",[[],false]],
		['_isLiveServer',true]
	];
	
	_clientData params[
		["_functions",[],[[]]],
		["_compileFinal",true,[false]]
	];
 
	//initFunctions
	{
		private _code = preprocessFile (_x#1); 
		//store time in local var
		private _systemTimeUTC = systemTimeUTC;
		//select just the hrs and mins from the time array and format in too a comment
		private _compileTime = ("comment 'Auto Compiled @"+(format["%1:%2%3",_systemTimeUTC#3,if((_systemTimeUTC#4) < 10)then{format["0%1",_systemTimeUTC#4]}else{_systemTimeUTC#4},if((_systemTimeUTC#3) > 11) then {"PM"}else{"AM"}])+"';");
		//add compileTime comment to script
		_code = (_compileTime + (toString [13, 10]) + _code);
		//
		missionNamespace setVariable [_x#0, ([compile _code,compileFinal _code] select _compileFinal)];
		waitUntil{!isNil {missionNamespace getVariable (_x#0)}};
	} forEach _functions;

	//initClient
	[player] spawn NikkoClient_script_initclient;
}] remoteExec ["spawn",_owner];

//Return
true
