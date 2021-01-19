/*
	Nikko Renolds
	Attack & Defend
	Ni1kko@outlook.com
*/
 
class NikkoClient_CFG_Shops {

	class Atackers {
		displayName = "Atackers Shop";
		items[] = {
			{ "hgun_Rook40_F", 1},
			{ "hgun_P07_F", 10},
			{ "hgun_PDW2000_F", 100},
			{ "SMG_02_F", 21},
			{ "hgun_mas_bhp_F", 41},
			{ "hgun_mas_m9_F", 51},
			{ "hgun_mas_glock_F", 61},
			{ "hgun_mas_mak_F", 71},
			{ "hgun_mas_uzi_F", 16},
			{ "hgun_Pistol_heavy_02_F", 51},
			{ "hgun_Pistol_heavy_01_F", 175},
			{ "hgun_mas_mp7_F", 153},
			{ "hgun_mas_mp7p_F", 165},
			{ "SMG_01_F", 153},
			{ "arifle_TRG21_F", 154},
			{ "arifle_Mk20_plain_F", 145},
			{ "arifle_mas_mp5_d", 133},
			{ "arifle_mas_m1014", 132},
			{ "arifle_mas_m4vlt", 11},
			{ "acc_flashlight", 1114}
		};
	};

	class Defenders {
		displayName = "Defenders Shop";
		items[] = {
			{ "hgun_Rook40_F", 1},
			{ "hgun_P07_F", 10},
			{ "hgun_PDW2000_F", 100},
			{ "SMG_02_F", 21},
			{ "hgun_mas_bhp_F", 41},
			{ "hgun_mas_m9_F", 51},
			{ "hgun_mas_glock_F", 61},
			{ "hgun_mas_mak_F", 71},
			{ "hgun_mas_uzi_F", 16},
			{ "hgun_Pistol_heavy_02_F", 51},
			{ "hgun_Pistol_heavy_01_F", 175},
			{ "hgun_mas_mp7_F", 153},
			{ "hgun_mas_mp7p_F", 165},
			{ "SMG_01_F", 153},
			{ "arifle_TRG21_F", 154},
			{ "arifle_Mk20_plain_F", 145},
			{ "arifle_mas_mp5_d", 133},
			{ "arifle_mas_m1014", 132},
			{ "arifle_mas_m4vlt", 11},
			{ "acc_flashlight", 1114}
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