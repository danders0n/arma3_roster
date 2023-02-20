/*
 *	Author: D.Anderson
 *	Gets primary weapon and any attachment of unit, gets its name and image and crates string with HTML image compatible with diary records
 *	
 *	Arguments:
 *	0: The Unit <OBJECT>
 *	
 *	Return Value:
 *	String - can be direcly inserted into diary, empty if not weaponAccessories
 *	
 *	Example:
 *	[player] call dAn_fnc_getPrimaryWeapon
 *	
 * 	Public: No
 */

params["_unit"];

// forEach primary Weapon + attachments
private _primaryWeaponText = "";
if (primaryWeapon _unit != "") then {
	private _primaryWeaponArr = [];
	private _arr = [];
	_arr pushBack primaryWeapon _unit;
	_arr append (primaryWeaponItems _unit - [""]);

	_primaryWeaponArr pushBack ([
		'<font color="#757575" face="RobotoCondensed">',
		'Primary Weapon: ',
		'</font>',
		getText(configFile >> "CfgWeapons" >> primaryWeapon _unit >> "displayName"),
		'<br/>'
	] joinString "");

	{
		private _displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
		private _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");

		private _str = ['<img title="', _displayName, '" src="', _picture, '" height="48"/>  '] joinString "";
		_primaryWeaponArr pushBack _str;
	} forEach _arr;

	_primaryWeaponArr pushBack '<br/>';
	_primaryWeaponText = _primaryWeaponArr joinString "";
};

// return
_primaryWeaponText;