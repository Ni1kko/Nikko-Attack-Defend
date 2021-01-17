/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

//
//--- EAST
//
{
	(_x#0) allowDamage false;
	(_x#0) enableSimulation true;
	(_x#0) setObjectTexture[0,_x#1];
} forEach [
	[EastBillboard_Middle,""],
	[EastBillboard_Right,""]
];


//
//--- WEST
//
{
	(_x#0) allowDamage false;
	(_x#0) enableSimulation true;
	(_x#0) setObjectTexture[0,_x#1];
} forEach [
	[WestBillboard_Middle,""],
	[WestBillboard_Right,""]
];