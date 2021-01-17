/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

//
//--- All Stands
//
{
	_x allowDamage false;
	_x enableSimulation true;
	_x setObjectTexture[0,"textures\infostands\Infostand.paa"];
} forEach [
	EastInfoStand,
	WestInfoStand
];

//
//--- EAST
//
EastInfoStand addAction ["East Menu",{hint str playerside}];


//
//--- WEST
//
WestInfoStand addAction ["West Menu",{hint str playerside}];