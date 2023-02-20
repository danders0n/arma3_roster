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
 *	[player] call dAn_fnc_updateRoster
 *	
 * 	Public: No
 */

params[["_unit", player]];

_group = [_unit] call dAn_fnc_createGroup;
_orbat = [_unit] call dAn_fnc_createORBAT;

_diaryGroup = _unit getVariable "dAn_dairyGroup";
_diaryORBAT = _unit getVariable "dAn_dairyORBAT";

_unit setDiaryRecordText [["roster", _diaryGroup], ["Group", _group, ""]];
_unit setDiaryRecordText [["roster", _diaryORBAT], ["ORBAT", _orbat, ""]];

// return ?
true;