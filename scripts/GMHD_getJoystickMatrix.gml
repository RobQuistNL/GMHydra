///Get a value from the rotation matrix
//argument0 = controller_id
//argument1 = row
//argument2 = column
if (GMHD_checkDllLoaded() == false) {return false;}
return external_call(global._GMHD_getJoystickMatrix, argument0, argument1, argument2);
