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

private _playerQueryStatment = format ["steamid, name, aliases FROM players WHERE steamid='%1'",_uid];
private _playerQuery = ["SELECT",_playerQueryStatment] call NikkoServer_script_callDatabase;

if(count _playerQuery <= 0)then{
	private _playerInsertStatment = format ["players (steamid, name, aliases) VALUES('%1', '%2', '%3')",_uid,_name,([[_name]] call NikkoServer_script_DBHelper_mresArray)];
	["INSERT",_playerInsertStatment] call NikkoServer_script_callDatabase;
	_playerQuery = ["SELECT",_playerQueryStatment] call NikkoServer_script_callDatabase;
}else{
	_playerQuery params [
		"_dbsteamid",
		"_dbname",
		"_dbaliases"
	];

	private _aliases = [_dbaliases] call NikkoServer_script_DBHelper_mresToArray;

	if(!(_name in _aliases) || _dbname != _name)then{
		_aliases pushBack _name;
		private _playerUpdateStatment = format ["players SET name='%1', aliases='%2' WHERE steamid='%3'",_name,([_aliases] call NikkoServer_script_DBHelper_mresArray),_uid];
		["UPDATE",_playerUpdateStatment] call NikkoServer_script_callDatabase;
		_playerQuery = ["SELECT",_playerQueryStatment] call NikkoServer_script_callDatabase;
	};
};

if(count _playerQuery <= 0)exitWith{
	//Kick bad data
};

private _databaseData = [
	_playerQuery
];

//Send preinit
[(_this + _databaseData), {
	params [
		['_uid',""],
		['_name',""],
		['_jip',false],
		['_owner',2],
		["_clientData",[[],false]],
		['_isLiveServer',true],
		["_databaseData",[
			[/*_playerQuery*/]
		]]
	];
	
	_clientData params[
		["_functions",[],[[]]],
		["_compileFinal",true,[false]]
	];

	_databaseData params[
		["_playerQuery",[]]
	];
 
	//initFunctions
	{
		//store time in local var
		private _systemTimeUTC = systemTimeUTC;
		//select just the hrs and mins from the time array and format in too a comment
		private _compileTime = ("comment 'Auto Compiled @"+(format["%1:%2%3",_systemTimeUTC#3,if((_systemTimeUTC#4) < 10)then{format["0%1",_systemTimeUTC#4]}else{_systemTimeUTC#4},if((_systemTimeUTC#3) > 11) then {"PM"}else{"AM"}])+"';");
		//add compileTime comment to script
		private _code = (_compileTime + (toString [13, 10]) + (_x#1));
		//
		missionNamespace setVariable [_x#0, ([compile _code,compileFinal _code] select _compileFinal)];
		waitUntil{!isNil {missionNamespace getVariable (_x#0)}};
	} forEach _functions;

	//initClient
	[player] spawn NikkoClient_script_initclient;
}] remoteExec ["spawn",_owner];

//Return
true
