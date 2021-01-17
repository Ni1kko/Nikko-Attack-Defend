/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

params [
	["_type", "", [""]],
	["_query", [], [[]]],
	["_key", 0, [0]]
];

//["SELECT",["id","players",format["steamid='%1'",getPlayerUID player]],uiNamespace getVariable ["NikkoServer_var_DBKey",0]] call NikkoServer_script_callDatabase;
//["UPDATE",["players",formatText["name='%1'",name player],formatText["steamid='%1'",getPlayerUID player]],uiNamespace getVariable ["NikkoServer_var_DBKey",0]] call NikkoServer_script_callDatabase;
switch (_type) do {
	case "UPDATE": {
		_query params [
			["_table", "", [""]],
			["_data", nil, [nil,formatText[""]]],
			["_conditions", nil, [nil,formatText[""]]]
		];
		if!(isNil "_conditions") then {
			_conditions = formatText["WHERE %1",_conditions];
		};
		_query = formatText["UPDATE %1 SET %2 %3",_table,_data,_conditions];
		"extDB3" callExtension format["1:%1:%2",_key,_query];
	};
	case "INSERT": {
		//_query = ["players","steamid",formatText["'%1','%2'",str(_uid),str(_name)]];
		_query params [
			["_table", "", [""]],
			["_columns", "", [""]],
			["_values", nil, [nil,formatText[""]]]
		];
		_query = formatText["INSERT INTO %1 (%2) VALUES (%3)",_table,_columns,_values];
		"extDB3" callExtension format["1:%1:%2",_key,_query];

	};
	case "SELECT": {
		//_query = ["id,steamid","players",formatText["steamid='%1'",str(_uid)]];
		_query params [
			["_columns", "", [""]],
			["_table", "", [""]],
			["_conditions", nil, [nil,formatText[""]]]
		];
		if!(isNil "_conditions") then {
			_conditions = formatText["WHERE %1",_conditions];
		};  
		_query = formatText["SELECT %1 FROM %2 %3",_columns,_table,_conditions];
		_return = "extDB3" callExtension format["0:%1:%2",_key,_query];
		
		//Fail safe
		if( not(_return isEqualTo ""))then{
			_return = (call compile _return)#1;
		}else{
			diag_log "Temp DB Output: FAILURE!";
		};

		//Return
		_return;
	};
};