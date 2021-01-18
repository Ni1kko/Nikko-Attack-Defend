/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

//Already started
if!(isNil {uiNamespace getVariable "NikkoServer_var_DBKey"}) exitWith {diag_log "DB: DB already started."};

//Random key
uiNamespace setVariable ["NikkoServer_var_DBKey",([] call NikkoServer_script_getDatabaseSessionID)];

//Add [Database] config option from extDB3 cofig
private _output = "extDB3" callExtension "9:ADD_DATABASE:Database";
if !(_output isEqualTo "[1]") exitWith {
	diag_log "DB: Database could not be connected.";
};

//Add SQL protocol with randomized key
_output = "extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:Database:SQL:%1:TEXT2",(uiNamespace getVariable ["NikkoServer_var_DBKey",""])];
if !(_output isEqualTo "[1]") exitWith {
	diag_log format["DB: Unexpected result from protocol select - %1",_output];
};

//Lock extDB3 from another protocol being opened
_output = "extDB3" callExtension "9:LOCK";
if !(_output isEqualTo "[1]") exitWith {
	diag_log format["DB: Unexpected result from DB Lock command. - %1",_output];
};	

//Check lock status
_output = "extDB3" callExtension "9:LOCK_STATUS";
if !(_output isEqualTo "[1]") exitWith {
	diag_log format["DB: Unexpected result from DB lock test - %1",_output];
};

//Finished DB Ready
uiNamespace setVariable ["NikkoServer_var_DBOnline",compileFinal str(true)];