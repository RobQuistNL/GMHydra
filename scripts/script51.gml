// GM:    Hydra:
// X      X
// Y      Z
// Z      Y

// Controller should be calibrated first, ofcourse!
//arg0 = controller id

minimum = 0;
maximum = 290; // In CM.

normalized_z =  ((maximum - minimum) * (GMHD_getJoystickZ(argument0) - global._GMH_zMin[argument0]))/(global._GMH_zMax[argument0] - global._GMH_zMin[argument0]) + minimum

return normalized_z;
