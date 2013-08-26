/** \def quaternion_fly_pitch(angle)
 * quaternion_fly_pitch(angle)
 *
 * pitch manouver script for aircraft-like movement
 *
 * causes an object to pitch by an amount angle
 *
 * see quaternion_fly_roll for details
 */
var ang;
ang=degtorad(argument0)/2;
multiply_quaternion_right(cos(ang),0,sin(ang),0);
