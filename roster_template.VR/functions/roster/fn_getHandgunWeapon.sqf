/*
 *	Author: D.Anderson
 *	Gets hangun weapon and any attachment of unit, gets its name and image and crates string with HTML image compatible with diary records
 *	
 *	Arguments:
 *	0: The Unit <OBJECT>
 *	
 *	Return Value:
 *	String - can be direcly inserted into diary, empty if not weaponAccessories
 *	
 *	Example:
 *	[player] call dAn_fnc_getHandgunWeapon
 *	
 * 	Public: No
 */
 
params ["_unit"];

//forEach handgun Weapon + attachments
private _handgunWeaponText = "";
if (handgunWeapon _unit != "") then {
	private _handgunWeaponArr = [];
	private _arr = [];
	_arr pushBack handgunWeapon _unit;
	_arr append (handgunItems  _unit - [""]);

	_handgunWeaponArr pushBack ([
		'<font color="#757575" face="RobotoCondensed">',
		'Handgun Weapon: ',
		'</font>',
		getText(configFile >> "CfgWeapons" >> handgunWeapon _unit >> "displayName"),
		'<br/>'
	] joinString "");
	{
		private _displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
		private _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");

		private _str = ['<img title="', _displayName, '" src="', _picture, '" height="32"/>  '] joinString "";
		_handgunWeaponArr pushBack _str;
	} forEach _arr;

	_handgunWeaponArr pushBack '<br/>';
	_handgunWeaponText = _handgunWeaponArr joinString "";
};

// return
_handgunWeaponText;