/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"

NikkoClient_KeyUp_Functions = compileFinal str ([
	//["NikkoClient_script_function", [dik,shift,ctrl,alt]]
	["NikkoClient_script_keyUpEarPlugs",[DIK_O,true,false,false]]//Also Defined in fn_keyDownHandler.sqf
]);

(uiNamespace getVariable "RscDisplayMission") displaySetEventHandler ["KeyUp","
	private _handled = false;
	private _code = ({ nil; if (_x#1 isEqualTo (_this select [1, 4])) exitWith {missionNamespace getvariable [_x#0,scriptNull]} } forEach (call NikkoClient_KeyUp_Functions));
	if !(isNil '_code')then {
		_nul = [] call _code; 
		_handled = true;
	};  
	_handled
"];

nil