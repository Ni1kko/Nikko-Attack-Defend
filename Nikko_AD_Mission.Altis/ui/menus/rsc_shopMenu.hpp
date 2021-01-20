/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
 
class NikkoClient_CFG_Shops {

	class Atackers {
		displayName = "Atackers Shop";
		items[] = {
			//
			//GUNS
			//

			//Pistols
			{ "hgun_Rook40_F", 100, 75},
			{ "hgun_P07_F", 115, 80},
			{ "hgun_PDW2000_F", 180, 100},
			{ "hgun_Pistol_heavy_02_F", 100, 70},
			{ "hgun_Pistol_heavy_01_F", 175, 125}, 

			//SMG'S
			{ "SMG_02_F", 200, 120},
			{ "SMG_01_F", 255, 200},

			//Assault rifles
			{ "arifle_TRG21_F", 500, 375},
			{ "arifle_Mk20_plain_F", 800, 425},
			{ "arifle_MXM_Black_F", 1000, 825},
			{ "arifle_MX_SW_Black_F", 1100, 855},
			{ "arifle_ARX_blk_F", 1300, 975},
			{ "arifle_SPAR_03_blk_F", 1500, 1225},

			//LMG'S
			{ "LMG_Mk200_F", 950, 525},
			{ "LMG_Zafir_F", 975, 625},	

			//Sniper-Marksman rifles
			{ "srifle_DMR_03_F", 1800, 1425},
			{ "srifle_EBR_F", 1900, 1500},
			{ "srifle_DMR_06_olive_F", 1950, 1525},
			
			//Attachments
			{ "optic_Arco_blk_F", 150, 115},
			{ "muzzle_snds_H", 65, 35},
			{ "bipod_01_F_blk", 150, 35},
			{ "muzzle_snds_65_TI_blk_F", 65, 45},
			{ "optic_Hamr", 175, 100},
			{ "optic_MRCO", 175, 100},
			{ "acc_flashlight", 50, 35},

  
			//
			//Wearables
			//

			//Helmets
			{ "H_HelmetSpecB_blk", 150, 85},
			{ "H_Beret_blk", 50, 15},
			{ "H_Cap_police", 20, 5},
			{ "H_Bandanna_gry", 20, 5},

			//Goggles
			{ "G_Balaclava_TI_G_blk_F", 50, 25},
			{ "G_Bandanna_aviator", 50, 25},
			{ "G_Aviator", 50, 25},
			{ "G_Bandanna_blk", 50, 25},

			//Uniforms
			{ "U_B_CTRG_Soldier_F", 250, 135},
			{ "U_B_GEN_Commander_F", 250, 135},
			{ "U_B_CTRG_1", 170, 85},
			{ "U_B_CombatUniform_mcam_tshirt", 150, 75},

			//Vests
			{ "V_PlateCarrier2_blk", 750, 350}

			//
			//Items
			//

			//Equipment
			//{ "", 50, 5},

			//AID
			//{ "", 50, 5},
		};
	};

	class Defenders {
		displayName = "Defenders Shop";
		items[] = {
			//
			//GUNS
			//

			//Pistols
			{ "hgun_Rook40_F", 100, 75},
			{ "hgun_P07_F", 115, 80},
			{ "hgun_PDW2000_F", 180, 100},
			{ "hgun_Pistol_heavy_02_F", 100, 70},
			{ "hgun_Pistol_heavy_01_F", 175, 125}, 

			//SMG'S
			{ "SMG_02_F", 200, 120},
			{ "SMG_01_F", 255, 200},

			//Assault rifles
			{ "arifle_TRG21_F", 500, 375},
			{ "arifle_Mk20_plain_F", 800, 425},
			{ "arifle_MXM_Black_F", 1000, 825},
			{ "arifle_MX_SW_Black_F", 1100, 855},
			{ "arifle_ARX_blk_F", 1300, 975},
			{ "arifle_SPAR_03_blk_F", 1500, 1225},

			//LMG'S
			{ "LMG_Mk200_F", 950, 525},
			{ "LMG_Zafir_F", 975, 625},	

			//Sniper-Marksman rifles
			{ "srifle_DMR_03_F", 1800, 1425},
			{ "srifle_EBR_F", 1900, 1500},
			{ "srifle_DMR_06_olive_F", 1950, 1525},
			
			//Attachments
			{ "optic_Arco_blk_F", 150, 115},
			{ "muzzle_snds_H", 65, 35},
			{ "bipod_01_F_blk", 150, 35},
			{ "muzzle_snds_65_TI_blk_F", 65, 45},
			{ "optic_Hamr", 175, 100},
			{ "optic_MRCO", 175, 100},
			{ "acc_flashlight", 50, 35},

  
			//
			//Wearables
			//

			//Helmets
			{ "H_HelmetSpecB_blk", 150, 85},
			{ "H_Beret_blk", 50, 15},
			{ "H_Cap_police", 20, 5},
			{ "H_Bandanna_gry", 20, 5},

			//Goggles
			{ "G_Balaclava_TI_G_blk_F", 50, 25},
			{ "G_Bandanna_aviator", 50, 25},
			{ "G_Aviator", 50, 25},
			{ "G_Bandanna_blk", 50, 25},

			//Uniforms
			{ "U_B_CTRG_Soldier_F", 250, 135},
			{ "U_B_GEN_Commander_F", 250, 135},
			{ "U_B_CTRG_1", 170, 85},
			{ "U_B_CombatUniform_mcam_tshirt", 150, 75},

			//Vests
			{ "V_PlateCarrier2_blk", 750, 350}

			//
			//Items
			//

			//Equipment
			//{ "", 50, 5},

			//AID
			//{ "", 50, 5},
		};
	};
};

class NikkoClient_RSC_ShopMenu {
	idd = 38400;
	name= "NikkoClient_RSC_ShopMenu";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['NikkoClient_RSC_ShopMenu',_this select 0]";
	
	class controlsBackground {
		class bg: NikkoClient_UI_BackGround
		{
			idc = -1;

			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.0492 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.9492 * safezoneH;
		};
	};

	class controls {
		
		class Title : NikkoClient_UI_Title
		{
			idc = 38401;			
			text = "";
			
			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.00440001 * safezoneH + safezoneY;
			w = 0.994876 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class Warpoints : Title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "textures\ui\button_close.paa";
			
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
		
		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class FilterList: NikkoClient_UI_RscCombo {
			idc = 38402;
			onLBSelChanged = "_this call NikkoClient_script_ShopMenuFilter";
			
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.0576 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.028 * safezoneH;
		};	

		class itemList: NikkoClient_UI_RscListBox {
			idc = 38403;
			onLBSelChanged = "_this call NikkoClient_script_ShopMenuSelection";
			
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.2564 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.7028 * safezoneH;
		};

		class itemInfo: NikkoClient_UI_RscStructuredText {
			idc = 38404;
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.0912 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.1596 * safezoneH;	
		};	

		class ButtonBuySell: NikkoClient_UI_ButtonMenu {
			idc = 38405;
			text = "Purchase";
			onButtonClick = "[] call NikkoClient_script_ShopMenuBuySell";
			
			x = 0.0576875 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.126 * safezoneW;
			h = 0.028 * safezoneH;	
		};
	
		class ItemCount: NikkoClient_UI_RscEdit {
			idc = 38406;
			text = "1";
			
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.049875 * safezoneW;
			h = 0.028 * safezoneH;			
		};

		class MagsBg: NikkoClient_UI_BackGround
		{
			idc = 38410;
			x = 0.18894 * safezoneW + safezoneX;
			y = 0.8416 * safezoneH + safezoneY;
			w = 0.182437 * safezoneW;
			h = 0.1568 * safezoneH;			
		};

		class MagsList: NikkoClient_UI_RscListBox {
			idc = 38407;
			
			x = 0.191564 * safezoneW + safezoneX;
			y = 0.8472 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.112 * safezoneH;
		};	

		class MagsCount: NikkoClient_UI_RscEdit {
			idc = 38408;
			text = "1";
			
			x = 0.191563 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.049875 * safezoneW;
			h = 0.028 * safezoneH;		
		};

		class MagsButtonBuy: NikkoClient_UI_ButtonMenu {
			idc = 38409;
			text = "Purchase";
			onButtonClick = "[] call NikkoClient_script_ShopMenuBuyMags";
			
			x = 0.244058 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.124688 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};