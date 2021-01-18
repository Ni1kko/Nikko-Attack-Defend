/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

NikkoClient_KeyDown_Functions = compileFinal str ([
	//["NikkoClient_script_function", [dik,shift,ctrl,alt]]
	["NikkoClient_script_keyDownTest",[35,true,false,false]] // H + Shift  
]);

(findDisplay 46) displaySetEventHandler ["KeyDown","
	private _handled = false;
	private _code = ({ nil; if (_x#1 isEqualTo (_this select [1, 4])) exitWith {missionNamespace getvariable [_x#0,scriptNull]} } forEach (call NikkoClient_KeyDown_Functions));
	if !(isNil '_code')then {
		_nul = [] call _code; 
		_handled = true;
	};  
	_handled
"]; 

nil