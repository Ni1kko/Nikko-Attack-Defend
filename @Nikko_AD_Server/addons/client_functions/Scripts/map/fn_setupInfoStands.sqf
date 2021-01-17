/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

//
//--- All Stand
//
{
	_x allowDamage false;
	_x enableSimulation true;
	_x setObjectTexture[0,""];
} forEach [
	EastInfoStand,
	WestInfoStand
];

//
//--- EAST
//
EastInfoStand addAction ["Test East",{hint str playerside}];


//
//--- WEST
//
WestInfoStand addAction ["Test West",{hint str playerside}];