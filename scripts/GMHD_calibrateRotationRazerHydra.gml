if (GMHD_checkDllLoaded() == false) {return false;}

global._GMH_q0Offset[0] = -GMHD_getJoystickQuaternion(0,0);
global._GMH_q1Offset[0] = -GMHD_getJoystickQuaternion(0,1);
global._GMH_q2Offset[0] = -GMHD_getJoystickQuaternion(0,2);
global._GMH_q3Offset[0] = -GMHD_getJoystickQuaternion(0,3);

global._GMH_q0Offset[1] = -GMHD_getJoystickQuaternion(1,0);
global._GMH_q1Offset[1] = -GMHD_getJoystickQuaternion(1,1);
global._GMH_q2Offset[1] = -GMHD_getJoystickQuaternion(1,2);
global._GMH_q3Offset[1] = -GMHD_getJoystickQuaternion(1,3);
