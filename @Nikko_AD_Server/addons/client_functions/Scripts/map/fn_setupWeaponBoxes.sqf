/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

//Init loadout classes
//[] call NikkoClient_script_setupLoadouts;

//
//--- EAST
//
{
	(_x#0) allowDamage false;
	(_x#0) enableSimulation true;
	clearWeaponCargoGlobal (_x#0);
	clearMagazineCargoGlobal (_x#0);
	clearItemCargoGlobal (_x#0);
	clearBackPackCargoGlobal (_x#0);
	(_x#0) addAction (_x#1);
} forEach [
	[ EastWeaponCreate_Left, ["Open Shop", NikkoClient_script_ShopMenuCreate, [], 4] ],
	[ EastWeaponCreate_Right, ["Open Shop", NikkoClient_script_ShopMenuCreate, [], 4] ]
];


//
//--- WEST
//
{
	(_x#0) allowDamage false;
	(_x#0) enableSimulation true;
	clearWeaponCargoGlobal (_x#0);
	clearMagazineCargoGlobal (_x#0);
	clearItemCargoGlobal (_x#0);
	clearBackPackCargoGlobal (_x#0);
	(_x#0) addAction (_x#1);
} forEach [
	[ WestWeaponCreate_Left, ["Open Shop", NikkoClient_script_ShopMenuCreate, [], 4] ],
	[ WestWeaponCreate_Right, ["Open Shop", NikkoClient_script_ShopMenuCreate, [], 4] ]
];