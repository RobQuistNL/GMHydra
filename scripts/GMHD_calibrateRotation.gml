// Make sure the controllers are facing towards the screen, completely flat, next to each other.
// arg0 = controller_id
// arg1 = pitch
// arg2 = yaw
// arg3 = roll

if (GMHD_checkDllLoaded() == false) {return false;}
global._GMH_pitchOffset[argument0] = -argument1;
global._GMH_yawOffset[argument0] = -argument2;
global._GMH_rollOffset[argument0] = -argument3;
