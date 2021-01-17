/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/

//Remove old loadout
[player] call NikkoClient_script_removeLoadout;

// Guns
private _RynMXM = "arifle_MXM_Black_F";
private _RynMXSW = "arifle_MX_SW_Black_F";
private _RynType115 = "arifle_ARX_blk_F";
private _RynSpar = "arifle_SPAR_03_blk_F";
private _RynMK1 = "srifle_DMR_03_F";
private _RynMK18 = "srifle_EBR_F";
private _RynMK14 = "srifle_DMR_06_olive_F";
private _RynMK200 = "LMG_Mk200_F";
private _RynZafir = "LMG_Zafir_F";

// Attatchments
private _RynMXMAttatch = ["optic_Arco_blk_F", "acc_flashlight", "muzzle_snds_H", "bipod_01_F_blk"]; 
private _Ryn762Attatch = ["optic_Arco_blk_F", "acc_flashlight", "bipod_01_F_blk"];
private _RynType115Attach = ["optic_Arco_blk_F", "acc_flashlight", "muzzle_snds_65_TI_blk_F", "bipod_01_F_blk"];
private _RynMXSWAttatch = ["optic_Arco_blk_F", "acc_flashlight", "muzzle_snds_H"];
private _RynLMGAttach = ["optic_Arco_blk_F"];

// Mags
private _RynAK12Mags = "30Rnd_762x39_Mag_F";
private _Ryn65Mag = "30Rnd_65x39_caseless_mag";
private _Ryn762Mag = "20Rnd_762x51_Mag";
private _RynCaselessMags = "30Rnd_65x39_caseless_green";
private _RynMK200Mags = "200Rnd_65x39_cased_Box";
private _RynZafirMags = "150Rnd_762x54_Box";

// Spare Scopes
private _RynSpare1 = "optic_Hamr";
private _RynSpare2 = "optic_MRCO";

//
//--- Attacker Uniform
//
//Default and CTSFO
private _attackerHelmRyn = "H_HelmetSpecB_blk";
private _attackerUniformRyn = "U_B_CTRG_Soldier_F";
private _attackerVestRyn = "V_PlateCarrier2_blk";
private _attackerGlassesRyn = "G_Balaclava_TI_G_blk_F";
private _attackerBackpackRyn = "";

//NCA
private _attackerHelmRynNCA = "H_Cap_police";
private _attackerUniformRynNCA = "U_B_CTRG_1";
private _attackerGlassesRynNCA = "G_Bandanna_aviator";

//Police
private _attackerHelmRynPOLICE = "H_Beret_blk";
private _attackerUniformRynPOLICE = "U_B_GEN_Commander_F";
private _attackerGlassesRynPOLICE = "G_Aviator";

// Defender Uniform 
private _defenderHelmRyn = "H_Bandanna_gry";
private _defenderUniformRyn = "U_B_CombatUniform_mcam_tshirt";
private _defenderVestRyn = "V_PlateCarrier2_blk";
private _defenderGlassesRyn = "G_Bandanna_blk";
private _defenderBackpackRyn = "";

//
//--- Attackers
//
attackerLoadout =
[

	[
		localize "STR_MK18",
		_attackerUniformRyn,
		_attackerVestRyn,
		_attackerBackpackRyn,
		_attackerHelmRyn,
		_attackerGlassesRyn,
		_RynMK18,
		[[_Ryn762Mag, 20]],
		[[_RynSpare1, 1], [_RynSpare2, 1]],
		_Ryn762Attatch,
		[],
		[],
		{},
		"true",
		0,//Warpoints need to unlock class
		"Some desctiption"
	],
	
	[
		localize "STR_MK14",
		_attackerUniformRyn,
		_attackerVestRyn,
		_attackerBackpackRyn,
		_attackerHelmRyn,
		_attackerGlassesRyn,
		_RynMK14,
		[[_Ryn762Mag, 20]],
		[[_RynSpare1, 1], [_RynSpare2, 1]],
		_Ryn762Attatch,
		[],
		[],
		{},
		"true",
		0,//Warpoints need to unlock class
		"Some desctiption"
	]
];
attackerLoadout = compileFinal str(attackerLoadout);

//
//--- Defenders
//
defenderLoadout =
[

	[
		localize "STR_MK18",
		_defenderUniformRyn,
		_defenderVestRyn,
		_defenderBackpackRyn,
		_defenderHelmRyn,
		_defenderGlassesRyn,
		_RynMK18,
		[[_Ryn762Mag, 20]],
		[[_RynSpare1, 1], [_RynSpare2, 1]],
		_Ryn762Attatch,
		[],
		[],
		{},
		"true",
		0,//Warpoints need to unlock class
		"Some desctiption"
	],
	
	[
		localize "STR_MK14",
		_defenderUniformRyn,
		_defenderVestRyn,
		_defenderBackpackRyn,
		_defenderHelmRyn,
		_defenderGlassesRyn,
		_RynMK14,
		[[_Ryn762Mag, 20]],
		[[_RynSpare1, 1], [_RynSpare2, 1]],
		_Ryn762Attatch,
		[],
		[],
		{},
		"true",
		0,//Warpoints need to unlock class
		"Some desctiption"
	]
	
];
defenderLoadout = compileFinal str(defenderLoadout);