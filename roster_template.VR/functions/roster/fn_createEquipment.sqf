/*
 *	Author: D.Anderson
 *	Creates Group in Roster Subject
 *	
 *	Arguments:
 *	0: The Unit <OBJECT>
 *	
 *	Return Value:
 *	String
 *	
 *	Example:
 *	[player] call dAn_fnc_createGroup
 *	
 * 	Public: No
 */

params["_unit", '_details'];

private _grpArr = []; 

private _grpStr = [
	'<font face="RobotoCondensedBold" size="18">',
	groupId group _unit,
	'</font>',
	'<br/>'
] joinString "";

_grpArr pushBack _grpStr;

if (isPlayer _unit) then {
	private _unitIdentity = [_unit] call dAn_fnc_getIdentity;
	private _primaryWeaponText = [_unit] call dAn_fnc_getPrimaryWeapon;
	private _secondaryWeaponText = [_unit] call dAn_fnc_getSecondaryWeapon;
	private _handgunWeaponText = [_unit] call dAn_fnc_getHandgunWeapon;
	private _equipmentText = [_unit, _details] call dAn_fnc_getEquipment;

	private _grpText = [
		'<img title="', _unitIdentity select 0, '" src="', _unitIdentity select 1, '" height="16"/>',
		'<font color="#cba030" size="17" face="RobotoCondensed">', _unitIdentity select 2, '</font>',
		'<font color="#757575" size="17" face="RobotoCondensed">', _unitIdentity select 3,'</font>',
		'<font color="#757575" size="16" face="RobotoCondensed"> - W: </font>',
		'<font  size="16" face="RobotoCondensed">', _unitIdentity select 4,'</font>',
		'<br/>',
		_primaryWeaponText,
		_secondaryWeaponText,
		_handgunWeaponText,
		_equipmentText,
		'<br/>',
		'.................................................................................................................',
		'<br/>'
	] joinString "";
	_grpArr pushBack _grpText;
};

private _group = _grpArr joinString "";

// return 
_group;