/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

if(isNil "NikkoClient_var_GroupHexegonToggle") then {
	NikkoClient_var_GroupHexegonToggle = true;
}else{
	NikkoClient_var_GroupHexegonToggle = (!NikkoClient_var_GroupHexegonToggle);
};

if(NikkoClient_var_GroupHexegonToggle)then{
	["NikkoClient_var_GroupHexegon", "onEachFrame",{
		{
			private _unit = (vehicle _x);
			private _player = (vehicle player);
			private _distance = _player distance2D _unit;
			private _metres = _player distance2D _unit;
			
			if ((group _x) == (group player) AND (alive _x) AND (_distance < 2500)) then {
				private _pos = (_unit modelToWorldVisual (_unit selectionPosition "pelvis"));
				_pos set [2, (_pos select 2) + 0.2];
				drawIcon3D [format ["mpmissions\%1.%2\textures\icons\GroupHexegon.paa", missionName, worldName],[1,1,1,1],_pos,1,1,0,format ['%1 | %2m', name _unit, (_metres - (_metres % 1))],2,0.03,"PuristaBold"];
			};
		} count allUnits - [player];
	}] call BIS_fnc_addStackedEventHandler;
	Hint "Group Hexegons On!"
}else{
	["NikkoClient_var_GroupHexegon", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	Hint "Group Hexegons Off!"
};