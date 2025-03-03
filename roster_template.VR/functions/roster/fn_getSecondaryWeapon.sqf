/*
 *	Author: D.Anderson
 *	Gets secondary weapon and any attachment of unit, gets its name and image and crates string with HTML image compatible with diary records
 *	
 *	Arguments:
 *	0: The Unit <OBJECT>
 *	
 *	Return Value:
 *	String - can be direcly inserted into diary, empty if not weaponAccessories
 *	
 *	Example:
 *	[player] call dAn_fnc_getSecondaryWeapon
 *	
 * 	Public: No
 */

params["_unit"];

// forEach secondary Weapon + attachments
private _secondaryWeaponText = "";
if (secondaryWeapon _unit != "") then {
	private _secondaryWeaponArr = [];
	private _arr = [];
	_arr pushBack secondaryWeapon _unit;
	_arr append (secondaryWeaponItems  _unit - [""]);

	_secondaryWeaponArr pushBack ([
		'<font color="#757575" face="RobotoCondensed">',
		'Broń dodatkowa: ',
		'</font>',
		getText(configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "displayName"),
		'<br/>'
	] joinString "");
	{
		private _displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
		private _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");

		private _str = ['<img title="', _displayName, '" src="', _picture, '" height="64"/>  '] joinString "";
		_secondaryWeaponArr pushBack _str;
	} forEach _arr;

	_secondaryWeaponArr pushBack '<br/>';
	_secondaryWeaponText = _secondaryWeaponArr joinString "";
};

// return
_secondaryWeaponText;