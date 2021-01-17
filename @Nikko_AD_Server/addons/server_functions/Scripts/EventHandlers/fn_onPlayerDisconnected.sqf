/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
params [
	['_uid','',['']], 
	['_name','',['']], 
	['_jip',false,[false]], 
	['_owner',2,[0]]
];

//Players only
if (_owner < 3) exitWith {false};
 
//Serverside player cleanup
{
	if((_x getVariable ["playerSteamID",""]) == _uid) exitWith {
        _corpse = _x;
        deleteVehicle _corpse; //Get rid of the corpse
    };
} foreach allDeadMen;

//Return
true