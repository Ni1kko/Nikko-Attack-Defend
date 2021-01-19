/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

//Store Default TerrainGrid
if(isNil "NikkoClient_var_defaultTerrainGrid")then{
	missionNamespace setVariable ["NikkoClient_var_defaultTerrainGrid",getTerrainGrid];
};

//Toggle Between On And Off
if (getTerrainGrid isEqualTo NikkoClient_var_defaultTerrainGrid) then {
	setTerrainGrid 50;
	hint "Low Terrain On";
} else {
	setTerrainGrid NikkoClient_var_defaultTerrainGrid;
	hint "Low Terrain Off";
};