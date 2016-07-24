/*
    File: fn_toastIntro.sqf
	Editor: Salutesh aka Steve
	Original script by: Valthos
	Edits by: GR8
    Description: Toast notifications for spawning players.
*/

if(isDedicated) exitWith {};
_displayCount 		= 3;	// How many times the toasts gets repeated after given time (unlimited default).
_n					= 300;	// After witch time toasts get repeated (10 seconds default).

_toastType			= "InfoTitleAndText";	// Type of the toast where ErrorTitleAndText is red, SuccessTitleAndText is green and InfoTitleAndText is light blue.

_Delay              = 30;	// Wait in seconds before the toasting starts after player is ingame.
_FadeIn             = 10;	//how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role

// First
_title             	= "Oceania.Network Exile Tanoa";										// Title of the toast
_shorttext         	= "Welcome to Oceania.Networks Exile Tanoa Server.";	// Text of the toast

// Second
_title2         	= "Need Help/Support?";
_shorttext2    		= "Join our TeamSpeak3: ts3.oceania.network";

// Third
_title3            	= "Donate Today!";
_shorttext3     	= "Help keep our community alive! all donations go towards building our network!";

// Fourth
_title4         	= "Oceania.Network Forums";
_shorttext4     	= "Sign up on our forums and get involved with the community!";

// Fifth
_title5         	= "TeamSpeak3";
_shorttext5     	= "Public and Private Channels Available. ts3.oceania.network.";

// Sixth
_title6         	= "More Servers!";
_shorttext6     	= "www.oceania.network for a full listing of our servers.";

/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/*                                        /!\ DO NOT EDIT BELOW THIS LINE /!\
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
while {(_displayCount) < (_n)} do {
	_ms = [];
	for "_i" from 1 to 50 do
	{
		_t = if (_i!=1) then { format ["_title%1",_i] } else { "_title" };
		_s = if (_i!=1) then { format ["_shorttext%1",_i] } else { "_shorttext" };
		if (!isNil _t or !isNil _s) then
		{
			_at = if (!isNil _t) then { call compile _t } else { "" };
			_as = if (!isNil _s) then { call compile _s } else { "" };
			_ms = _ms + [[_at,_as]];
		}
	};
	waitUntil{sleep 1; ExileClientPlayerIsSpawned};
	waitUntil{player == player};
	sleep _Delay;
	player enableSimulation true;
	{
		_t = _x select 0;
		_s = _x select 1;
		_tt = _t;
		_tm = _s;
		_tmc = round (count toArray (_t+_s) / 6 / 2) + 3;
		[_toastType, [_tt, _tm]] call ExileClient_gui_toaster_addTemplateToast;
	sleep (_tmc+_FadeIn+4);
	} forEach _ms;
};
