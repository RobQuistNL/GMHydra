// GM:    Hydra:
// X      X
// Y      Z
// Z      Y

// Controller should be calibrated first, ofcourse!
//arg0 = controller id

minimum = -100;
maximum = 100; // In CM. - arm span

normalized_y =  ((maximum - minimum) * (GMHD_getJoystickY(argument0) - global._GMH_yMin[argument0]))/(global._GMH_yMax[argument0] - global._GMH_yMin[argument0]) + minimum

return normalized_y;
