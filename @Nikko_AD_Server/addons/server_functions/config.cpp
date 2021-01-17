#include "macros.hpp"

class CfgPatches
{
	class server_functions
	{
		name = "server_functions";
		author[] = {"Nikko"};
		requiredVersion = 2.00;
		requiredAddons[] = {"client_functions"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
    class AutoCompile
	{
		class CfgBootstrap 
		{
			tag = "Nikko";//Nikko_script_example
			file = "\a3\functions_f\server_functions";//should match $PREFIX$ file in root directory with a "\" at the begining
			fileClient = "\a3\functions_f\client_functions";//should match $PREFIX$ file in root directory with a "\" at the begining
			dontCompile[] = {};//array of any files that you don't want too auto compile (if files is "fn_example.sqf" you would add "example" to the array | dontCompile[] = {"example"})
			compileFinal = true;//compileFinal = true | compile = false, can be useful for debuging

			///////////////////////////////////////////////////////////////////////////////////
			class preInit {preInit = true;};// Don't edit this loads the auto compile system //
			///////////////////////////////////////////////////////////////////////////////////
    	};
	};
};