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

_unit createDiarySubject ["roster", "Wyposażenie"];

private _arr = units (group _unit);
private _units = [];
private _unitsRecords = [];

// loop for Group
{
	if(isPlayer _x) then {
		_eq = [_x, False] call dAn_fnc_createEquipment;
		_units pushBack _eq;
	};
} forEach _arr;

// loop for individual 
for "_i" from ((count _arr)-1) to 0 step -1 do {
	if(isPlayer (_arr select _i)) then {
		// systemChat str name _arr select _i;
		private _eq = [_arr select _i, True] call dAn_fnc_createEquipment;
		//systemChat (name (_arr select _i));
		_var = _unit createDiaryRecord ["roster", [["Wyposażenie", (name (_arr select _i))] joinString " ", _eq, ""]];
		_unitsRecords pushBack _var;
	};
};

_units = _units joinString "";
_orbat = [_unit] call dAn_fnc_createORBAT;

_diaryGroup = _unit createDiaryRecord ["roster", ["Wyposażenie grupy", _units, ""]];
_diaryORBAT = _unit createDiaryRecord ["roster", ["ORBAT", _orbat, ""]];

_unit setVariable ["dAn_dairyGroup", _diaryGroup];
_unit setVariable ["dAn_dairyORBAT", _diaryORBAT];
_unit setVariable ["dAn_dairyRecords", _unitsRecords];

// setup update approx. every 1 sec.
[
    {
		[] call dAn_fnc_updateRoster;
		systemChat format ['Upd: %1', time];	
	},
    0.95,
    [_unit],
    {
		//systemChat format ["start!"];
		_test = 127;
	},
    { 
		// systemChat format ["end!"]
	},
    {true},
    {
		missionNamespace getVariable["dAn_brefingMode", false] || time > (15 * 60); 
	},
    "_test"
] call CBA_fnc_createPerFrameHandlerObject;

// return ?
true;