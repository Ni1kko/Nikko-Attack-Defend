/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
private ["_newPlugs"];

//Disables keybind hint
if(player getVariable ["NikkoClient_var_earplugsScrollMsg",false])then{
	player setVariable ["NikkoClient_var_earplugsScrollMsg",false,true];
};

//Adjust earplugs value
if(_this > 0) then {
	_newPlugs = parseNumber (((player getVariable ["NikkoClient_var_earplugsAmount",1]) + 0.05) toFixed 2);
	if(_newPlugs > 1) then {_newPlugs = 1;};
}else{
	_newPlugs = parseNumber (((player getVariable ["NikkoClient_var_earplugsAmount",1]) - 0.05) toFixed 2);
	if(_newPlugs <= 0) then {_newPlugs = 0.05;};
};

//Update earplugs value
player setVariable ["NikkoClient_var_earplugsAmount", _newPlugs];
1 fadeSound _newPlugs;
hint format["Sound: %1%2",_newPlugs * 100,"%"];