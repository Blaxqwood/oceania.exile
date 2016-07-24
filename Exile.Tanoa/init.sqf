execVM "custom\acd_TB\run.sqf";
#define DEBUG false

[DEBUG] call compile preprocessFileLineNumbers "badmin\globalCompile.sqf";

if (!isDedicated) then
{
	if (hasInterface) then // Normal player
	{
		execVM "badmin\client\init.sqf";
		execVM "custom\toast.sqf";
		execVM "addons\statusBar\statusBar.sqf";
	}
};

if (isServer) then
{
	diag_log "bAdmin - Initializing";
	[] execVM "badmin\server\init.sqf";
	[] execVM "MostWanted_Client\MostWanted_Init.sqf";
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
