/** \def quaternion_fly_yaw(angle)
 * quaternion_fly_yaw(angle)
 *
 * yaw manouver script for aircraft-like movement
 *
 * causes an object to yaw by an amount angle
 *
 * see quaternion_fly_roll for details 
 */
var ang;
ang=degtorad(argument0)/2;
multiply_quaternion_right(cos(ang),0,0,sin(ang));
