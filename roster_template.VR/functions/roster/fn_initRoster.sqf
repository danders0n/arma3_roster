/*
 *	Author: D.Anderson
 *	Lorem
 *	
 *	Arguments:
 *	0: The Unit <OBJECT>
 *	
 *	Return Value:
 *	Bool
 *	
 *	Example:
 *	[player] call dAn_fnc_initRoster
 *	
 * 	Public: No
 */

params["_unit"];

_group = [_unit] call dAn_fnc_createGroup;
_orbat = [_unit] call dAn_fnc_createORBAT;

_unit createDiarySubject ["roster", "Roster"];
_diaryGroup = _unit createDiaryRecord ["roster", ["Group", _group, ""]];
_diaryORBAT = _unit createDiaryRecord ["roster", ["ORBAT", _orbat, ""]];

_unit setVariable ["dAn_dairyGroup", _diaryGroup];
_unit setVariable ["dAn_dairyORBAT", _diaryORBAT];

// return ?
true;