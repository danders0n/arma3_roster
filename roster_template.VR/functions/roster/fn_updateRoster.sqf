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

private _arr = units (group _unit);
private _units = [];

_diaryGroup = _unit getVariable "dAn_dairyGroup";
_diaryORBAT = _unit getVariable "dAn_dairyORBAT";
_unitsRecords = _unit getVariable "dAn_dairyRecords";

// this loop for Group
{
	if(isPlayer _x) then {
		_eq = [_x, False] call dAn_fnc_createEquipment;
		_units pushBack _eq;
	};
} forEach _arr;

// this loop for individual
for "_i" from ((count _arr)-1) to 0 step -1 do {
	if(isPlayer (_arr select _i)) then {
		// systemChat str name _arr select _i;
		private _eq = [_arr select _i, True] call dAn_fnc_createEquipment;
		//systemChat (name (_arr select _i));
		_var = _unit setDiaryRecordText [["roster", _unitsRecords select _i ], [["Wyposażenie", (name (_arr select _i))] joinString " ", _eq, ""]];
	};
};

_group = _units joinString "";
_orbat = [_unit] call dAn_fnc_createORBAT;

_unit setDiaryRecordText [["roster", _diaryGroup], ["Wyposażenie grupy", _group, ""]];
_unit setDiaryRecordText [["roster", _diaryORBAT], ["ORBAT", _orbat, ""]];

// return ?
true