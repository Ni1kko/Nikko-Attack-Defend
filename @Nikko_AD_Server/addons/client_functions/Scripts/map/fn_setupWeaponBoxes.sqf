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
	(_x#0) addAction (_x#1);
} forEach [
	[EastWeaponCreate_Left, ["Test East WeaponCreate Left",{hint str playerside},[],4] ],
	[EastWeaponCreate_Right, ["Test East WeaponCreate Right",{hint str playerside},[],4] ]
];


//
//--- WEST
//
{
	(_x#0) allowDamage false;
	(_x#0) enableSimulation true;
	(_x#0) addAction (_x#1);
} forEach [
	[WestWeaponCreate_Left, ["Test West WeaponCreate Left",{hint str playerside},[],4] ],
	[WestWeaponCreate_Right, ["Test West WeaponCreate Right",{hint str playerside},[],4] ]
];