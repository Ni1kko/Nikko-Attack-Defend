/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"

NikkoClient_KeyDown_Functions = compileFinal str ([
	//["NikkoClient_script_function", [dik,shift,ctrl,alt]]
	["NikkoClient_script_keyDownEarPlugs",[DIK_O,true,false,false]],//Also Defined in fn_keyUpHandler.sqf
	["NikkoClient_script_keyDownGrassToggle",[DIK_T,true,false,false]],
	["NikkoClient_script_keyDownJump",[DIK_V,true,false,false]],
	["NikkoClient_script_keyDownTeamHex",[DIK_GRAVE,false,false,false]]
]);

(uiNamespace getVariable "RscDisplayMission") displaySetEventHandler ["KeyDown","
	private _handled = false;
	private _code = ({ nil; if (_x#1 isEqualTo (_this select [1, 4])) exitWith {missionNamespace getvariable [_x#0,scriptNull]} } forEach (call NikkoClient_KeyDown_Functions));
	if !(isNil '_code')then {
		_nul = [] call _code; 
		_handled = true;
	};  
	_handled
"];

nil