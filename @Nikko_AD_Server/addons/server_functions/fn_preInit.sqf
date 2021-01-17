/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
if(!canSuspend) exitWith {
	[] spawn (missionNamespace getVariable ["AutoCompile_fnc_preInit",{diag_log "Functions Auto compile: fn_preInit.sqf Not Found!";false}]);
	false
};

//Get config values
private _config = configFile >> "CfgFunctions" >> "AutoCompile" >> "CfgBootstrap";
private _scriptPrefix = [_config, "tag", ""] call BIS_fnc_returnConfigEntry;
private _addonPrefix = [[_config, "file", ""] call BIS_fnc_returnConfigEntry,1] call BIS_fnc_trimString;
private _clientAddonPrefix = [[_config, "fileClient", ""] call BIS_fnc_returnConfigEntry,1] call BIS_fnc_trimString;
private _dontCompile = ([_config, "dontCompile", []] call BIS_fnc_returnConfigEntry) apply {toLower format["%1Server_script_%2",_scriptPrefix,_x]};
private _compileFinal = ([_config, "compileFinal", 1] call BIS_fnc_returnConfigEntry) isEqualTo 1;

//Already compiled as 'AutoCompile_fnc_preinit' & 'AutoCompile_fnc_postinit'
{_dontCompile pushBackUnique tolower format["%1Server_script_%2",_scriptPrefix,_x]} forEach ["preinit","postinit"];

private _isLiveServer = (!("Test" in servername) || !_compileFinal);
private _serverCommandPass = "kp9N^n>xU(BBBCG&";

try {
	//Lock server at start 
	if (_isLiveServer AND !(_serverCommandPass serverCommand "#lock")) throw "Error: Server Command Password INCORECT!";

	private _clientFunctions = []; 

	//Prepare (SERVER)
	{
		if(["\fn_",_x] call BIS_fnc_inString) then {
			private _file = _x select [(_x find "fn_")];
			private _function = format["%1Server_script_%2",_scriptPrefix,_file select [3,(_file find ".sqf") - 3]];
			if( not(toLower _function in _dontCompile) AND not(isFinal _function))then{
				private _code = preprocessFile _x; 
				//store time in local var
				private _systemTimeUTC = systemTimeUTC;
				//select just the hrs and mins from the time array and format in too a comment 
				private _compileTime = ("comment 'Auto Compiled @"+(format["%1:%2%3",_systemTimeUTC#3,if((_systemTimeUTC#4) < 10)then{format["0%1",_systemTimeUTC#4]}else{_systemTimeUTC#4},if((_systemTimeUTC#3) > 11) then {"PM"}else{"AM"}])+"';");
				//add compileTime comment to script
				_code = (_compileTime + (toString [13, 10]) + _code);
				//
				missionNamespace setVariable [_function, ([compile _code,compileFinal _code] select _compileFinal)];
			};
		};
	} forEach (addonFiles [format["%1\",_addonPrefix], ".sqf"]);
	
	//Prepare (CLIENT)
	{
		if(["\fn_",_x] call BIS_fnc_inString) then {
			private _file = _x select [(_x find "fn_")];
			private _function = format["%1Client_script_%2",_scriptPrefix,_file select [3,(_file find ".sqf") - 3]];
			if( not(toLower _function in _dontCompile) AND not(isFinal _function))then{
				_clientFunctions pushBackUnique [_function,_x];
			};
		};
	} forEach (addonFiles [format["%1\",_clientAddonPrefix], ".sqf"]);

	//Initialize Server
	[[_clientFunctions,_compileFinal],_serverCommandPass,_isLiveServer] spawn (missionNamespace getVariable [format["%1Server_script_initServer",_scriptPrefix],{}]);
} catch {
	diag_log format["!! FATIAL ERROR !! Server Halted!!! Due To (%1)", _exception];//Log exception
	if _isLiveServer then{_serverCommandPass serverCommand "#shutdown"};//Server shutdown
};

true