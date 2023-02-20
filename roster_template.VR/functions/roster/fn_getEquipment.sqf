/*
 *	Author: D.Anderson
 *	Gets uniform, vest, backpack and stuff, gets its name and image and crates string with HTML image compatible with diary records
 *	
 *	Arguments:
 *	0: The Unit <OBJECT>
 *	
 *	Return Value:
 *	String - can be direcly inserted into diary, empty if not weaponAccessories
 *	
 *	Example:
 *	[player] call dAn_fnc_getEquipment
 *	
 * 	Public: No
 */

 params["_unit"];
 
//forEach eq
private _equipmentText = "";
private _equipmentArr = [];
private _equipmentArr pushBack ([
	'<font color="#757575" face="RobotoCondensed">',
	'Equipment: ',
	'</font>',
	'<br/>'
] joinString "");

private  _arr = [uniform _unit, vest _unit, backpack _unit, headgear _unit, hmd _unit, binocular _unit] - [""];
// TODO: compat TFAR/ACRE...
_arr append ([] call acre_api_fnc_getMultiPushToTalkAssignment); 
{
	private _displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
	private _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");
	if (_displayName == "" || _picture == "") then {
		_displayName = getText(configFile >> "cfgVehicles" >> _x >> "displayName");
		_picture = getText(configFile >> "cfgVehicles" >> _x >> "picture");
	};
	private  _condition = count(_picture splitString "."); // if has .paa then array will have 2 elements, if don't means it dosen't
	_picture = if(_condition > 1)then[{_picture}, {[_picture, ".paa"] joinString ""}];

	_str = ['<img title="', _displayName, '" src="', _picture, '" height="32"/>  '] joinString "";
	_equipmentArr pushBack _str;
} forEach _arr;

_equipmentText = _equipmentArr joinString "";

// return 
_equipmentText;