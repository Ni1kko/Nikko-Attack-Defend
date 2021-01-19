/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"

NikkoClient_mouseScroll_Functions = compileFinal str ([
	//["NikkoClient_script_function", "condition"
	["NikkoClient_script_mouseScrollEarPlugs","(player getVariable ['NikkoClient_var_earplugsScroll',false])"]
]);

(findDisplay 46) displayAddEventHandler ["MouseZChanged","
    private _handled = false;
    private _condition = true;
	private _code = ({ nil; if((_x#1) != '')then{_condition = call compile (_x#1)}; if _condition exitWith {missionNamespace getvariable [_x#0,scriptNull]} } forEach (call NikkoClient_mouseScroll_Functions));
	if !(isNil '_code')then {
		_nul = (_this#1) call _code; 
		_handled = true;
	};
	_handled
"];

nil