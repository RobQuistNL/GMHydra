// GM:    Hydra:
// X      X
// Y      Z
// Z      Y

// Controller should be calibrated first, ofcourse!
//arg0 = controller id

minimum = -125;
maximum = 125; // In CM. - arm span

normalized_x =  ((maximum - minimum) * (GMHD_getJoystickX(argument0) - global._GMH_xMin[argument0]))/(global._GMH_xMax[argument0] - global._GMH_xMin[argument0]) + minimum

return normalized_x;
