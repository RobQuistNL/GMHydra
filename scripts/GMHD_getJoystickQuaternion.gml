if (GMHD_checkDllLoaded() == false) {return false;}

//The DLL has the quaternion values swapped (W, Z, Y X instead of W, X, Y, Z) - we swap them here.
/*
switch(argument1) {
    case 0:
        q = 0;
        break;
    case 1:
        q = 3;
        break;
    case 2:
        q = 2;
        break;
    case 3:
        q = 1;
        break;
}
*/
q = argument1;
return external_call(global._GMHD_getJoystickQuaternion, argument0, q);
