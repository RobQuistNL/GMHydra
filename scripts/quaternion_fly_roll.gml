/** \def quaternion_fly_roll(angle)
 * quaternion_fly_roll(angle)
 *
 * roll manouver script for aircraft-like movement
 *
 * causes an object to roll by an amount angle
 *
 * using multiply_quaternion_right causes the rotation to be carried out 
 * in the object's reference frame instead of the room's frame
 */
/* this is old code left in for reference
ang=degtorad(argument0)/2;
vx=1;
vy=0;
vz=0;
t0=cos(ang);
t1=vx*sin(ang);
t2=vy*sin(ang);
t3=vz*sin(ang);
multiply_quaternion_right(t0,t1,t2,t3);
*/
var ang;
ang=degtorad(argument0)/2;
multiply_quaternion_right(cos(ang),sin(ang),0,0);
