/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

 params[
	['_type','',['']],
	['_queryStmt','',['']],
	['_multiarr',false,[false]]
];  

_type = toLower(_type);  
if(_type isEqualTo 'insert')then{
	_queryStmt = ((toUpper(_type)) + (toString([32])) + ('INTO') + (toString([32])) + (_queryStmt));
}else{
	_queryStmt = ((toUpper(_type)) + (toString([32])) + (_queryStmt));
};

private _key = ('extDB3' callExtension (format['%1:'+(uiNamespace getVariable ['NikkoServer_var_DBKey',''])+':%2',(if(_type isEqualTo 'select')then{2}else{1}),_queryStmt]));  
if !(_type isEqualTo 'select') exitWith {true};
_key = call compile format ['%1',_key];
_key = (_key select 1);
_queryResult =  ('extDB3' callExtension (format['4:%1', _key]));  

if (_queryResult isEqualTo '[3]') then {
	for '_i' from 0 to 1 step 0 do {
		if (!(_queryResult isEqualTo '[3]')) exitWith {};
		_queryResult =  ('extDB3' callExtension (format ['4:%1', _key]));
	};
};

if (_queryResult isEqualTo '[5]') then {
	_loop = true;
	for '_i' from 0 to 1 step 0 do {  
		_queryResult = '';
		for '_i' from 0 to 1 step 0 do {
			_pipe =  ('extDB3' callExtension (format ['5:%1', _key]));
			if (_pipe isEqualTo '') exitWith {_loop = false};
			_queryResult = _queryResult + _pipe;
		};
	if (!_loop) exitWith {};
	};
};

_queryResult = call compile _queryResult;
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ['extDB3: Protocol Error: %1', _queryResult]; []};

_return = (_queryResult select 1);

if (!_multiarr && count _return > 0) then {
	_return = (_return select 0);
};

_return;