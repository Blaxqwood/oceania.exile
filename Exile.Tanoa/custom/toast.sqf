/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/*
/*                                            SCRIPTING BY:        	GR8 [GhostzGamerz.com]
/* 											  EDITED BY:		   	Salutesh
/*                                            VERSION:            	1.0 Toast Edition
/*                                            DATE:            		03 JULY 2016
/*
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/


if(isDedicated) exitWith {};

_toastType			= "SuccessTitleAndText"; // Type of the toast where ErrorTitleAndText is red, SuccessTitleAndText is green and InfoTitleAndText is light blue.

_Delay              = 30; // Wait in seconds before the toasting starts after player is ingame.
_FadeIn             = 5; //how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role

// First example with image
_title             	= format ["Welcome to Exile Tanoa", profileName];				// Title of the Toast
_image				= "<img image='images\noteimg.png' size='24'/>";			// Small image icon that will displayed in toast text
_shorttext         	= format ["Arma 3 Exile by Oceania.Network", _image];	// Text of the Toast

// Second
_title2         	= "Website and Forum";
_shorttext2    		= "www.oceania.network";

// Third
_title3            	= "Teamspeak 3";
_shorttext3     	= "ts3.oceania.network";

// Fourth
_title4         	= "Donate Today!";
_shorttext4     	= "All donations go back into the community to build a better network!";

// Fifth
_title5         	= "Support";
_shorttext5     	= "Visit our Teamspeak3 for support requests.";

// Sixth
_title6         	= "Play Fair And Enjoy";
_shorttext6     	= "Admins are always active in the background.<br />";

/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/*                                        /!\ DO NOT EDIT BELOW THIS LINE /!\
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
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
