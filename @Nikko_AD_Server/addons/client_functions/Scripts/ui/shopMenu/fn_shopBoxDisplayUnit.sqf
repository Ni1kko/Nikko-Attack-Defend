/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
params [
	["_loadout",[],[[]]]
];

if (!isNull ShopBoxWeapHolder) then {deleteVehicle ShopBoxWeapHolder};
if (!isNull ShopBoxWeapTurnItem) then {deleteVehicle ShopBoxWeapTurnItem};

//Create a local unit in shop view
//ShopBoxWeapTurnItem = "c_man" createVehicleLocal getPosASL ShopBoxTable;

//Add each loadout item to the loacl created unit
{

}forEach _loadout;