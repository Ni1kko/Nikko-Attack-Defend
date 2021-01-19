/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

ShopBoxCamera cameraEffect ["terminate", "back"];
camDestroy ShopBoxCamera;

if (!isNil "ShopBoxTable" && {!isNull ShopBoxTable}) then {deleteVehicle ShopBoxTable};
if (!isNil "ShopBoxVehicle" && {!isNull ShopBoxVehicle}) then {deleteVehicle ShopBoxVehicle};
if (!isNil "ShopBoxBackgroundObject" && {!isNull ShopBoxBackgroundObject}) then {deleteVehicle ShopBoxBackgroundObject};
if (!isNil "ShopBoxLightSource" && {!isNull ShopBoxLightSource}) then {deleteVehicle ShopBoxLightSource};
if (!isNil "ShopBoxWeapHolder" && {!isNull ShopBoxWeapHolder}) then {deleteVehicle ShopBoxWeapHolder};
if (!isNil "ShopBoxWeapTurnItem" && {!isNull ShopBoxWeapTurnItem}) then {deleteVehicle ShopBoxWeapTurnItem};

showChat true;