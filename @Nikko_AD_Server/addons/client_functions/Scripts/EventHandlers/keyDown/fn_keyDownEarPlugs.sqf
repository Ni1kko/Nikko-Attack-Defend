/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

// Enables player too use mouse scroll to adjust earplugs
player setVariable ["NikkoClient_var_earplugsScroll",true,true];

// Show a hint until player starts to scroll
if (player getVariable ["NikkoClient_var_earplugsScrollMsg",false]) then {
	hint "Keep Holding (SHIFT + O) & use mouse wheel to adjust volume!";
};
