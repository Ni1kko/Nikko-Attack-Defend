/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
params [
	["_loadout",[],[[]]]
];

//
//--- Gear
//
player addWeapon "ItemMap";
player addWeapon "ItemCompass";
player addWeapon "ItemWatch";
player addWeapon "ItemGPS";
player addWeapon "ItemMap";
player addWeapon "Rangefinder";
player addWeapon "NVGoggles_OPFOR";

//
//--- Uniform
//
if ((_loadout#1) != "") then
{
	player forceAddUniform (_loadout#1);
};

//
//--- vests
//
if ((_loadout#2) != "") then
{
	player addVest (_loadout#2);
};

//
//--- backpack
//
if ((_loadout#3) != "") then
{
	player addBackpack (_loadout#3);
};

//
//--- headgear
//
if ((_loadout#4) != "") then
{
	player addHeadgear (_loadout#4);
};

//
//--- glasses
//
if ((_loadout#5) != "") then
{
	player linkItem (_loadout#5);
};

//
//--- Add 1st magazine (Must be added before weapon as arma is retarded)
//
{
	if ((_x#1) > 0) then
	{
		player addMagazine (_x#0);
	};
} forEach (_loadout#7);

//
//--- Add weapon
//
if ((_loadout#6) != "") then
{
	player addWeapon (_loadout#6);
};

//
//--- Add rest of magazines (as arma is retarded)
//
{
	private _magCount = (_x#1) - 1;
	if (_magCount > 0) then
	{
		player addMagazines [_x#0, _magCount];
	};
} forEach (_loadout#7);

//
//--- Select primaryWeapon
//
private _primaryWeapon = primaryWeapon player;
if (_primaryWeapon != "") then
{
	player selectWeapon _primaryWeapon;
	player selectWeapon ((getArray(configFile>>"cfgWeapons" >> _primaryWeapon >> "muzzles"))#0);
};

//
//--- add primary gun attacments
//
{
	if (_x != "") then
	{
		player addPrimaryWeaponItem _x;
	};
} forEach (_loadout#9);

//
//--- add secondary gun attacments
//
{
	if (_x != "") then
	{
		player addSecondaryWeaponItem _x;
	};
} forEach (_loadout#10);

//
//--- add hand gun attacments
//
{
	player addHandgunItem _x;
} forEach (_loadout#11);

//
//--- Add items
//
{
	for "_i" from 1 to (_x#1) do
	{
		player addItem (_x#0);
	};
} forEach (_loadout#8);
