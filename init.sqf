// bAdmin Exile by Biabock
execVM "custom\acd_TB\run.sqf";
[] call rg_exile_fnc_initCore;
#define DEBUG false

[DEBUG] call compile preprocessFileLineNumbers "badmin\globalCompile.sqf";

if (!isDedicated) then
{
	if (hasInterface) then // Normal player
	{
		execVM "badmin\client\init.sqf";
	}
};

if (hasInterface) then
{
	execVM "addons/notificaions.sqf";
};

OPEN_bADMIN_FNC = {
	switch (_this) do {
		//Key U
		case 22: {
			nul = [] execVM "badmin\client\systems\adminPanel\checkAdmin.sqf";
		};
	};
};

waituntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call OPEN_bADMIN_FNC;false;"];
