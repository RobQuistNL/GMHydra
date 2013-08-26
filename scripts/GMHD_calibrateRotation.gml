// Make sure the controllers are facing towards the screen, completely flat, next to each other.
// arg0 = joystick
if (GMHD_checkDllLoaded() == false) {return false;}

global._GMH_q0Offset[argument0] = -GMHD_getJoystickQuaternion(argument0,0);
global._GMH_q1Offset[argument0] = -GMHD_getJoystickQuaternion(argument0,1);
global._GMH_q2Offset[argument0] = -GMHD_getJoystickQuaternion(argument0,2);
global._GMH_q3Offset[argument0] = -GMHD_getJoystickQuaternion(argument0,3);
