/** \def init_quaternion_random()
 * init_quaternion_random()
 *
 * Sets the variables q0,q1,q2,q3 to a random orientation
 * quaternion. This is done by generating random angles
 * and converting the result to a quaternion
 * note the special distribution of "theta" needed to
 * prevent bias towards certain orientations
 *
 * Picture a globe, phi is longitude, theta is latitude and psi is which way
 * you are facing. Phi and Psi can be simply random but if theta is a simple
 * random number then if you are near the poles the lines of longitude are 
 * closer together. This skews things
 * 
 * Starting from the equator on a radius 1 globe the area of the northen 
 * hemisphere is 2*pi and the length of a line of latitude is 2*pi*cos(theta).
 * The area between the equator is 2*pi*sin(theta) (basic integral, only works 
 * in radians otherwise it gets ugly) and from this I infer that sin(theta) 
 * should have a flat distribution and so if theta=arcsin(random) then 
 * sin(theta)=sin(arcsin(random)) so sin(theta)=random (provided random lies 
 * in the range -1 to +1.
 * 25/10/11 Important note: The version of this function previously available 
 * has a typo:
 * multiply_quaternion_right(cos(psi/2),0,0,sin(psi/2)); //<==typo, psi NOT phi
 * Please correct or substitute a newer version
 */
var phi,theta,psi;
phi=pi*(random(2)-1);
theta=arcsin(random(2)-1);
psi=pi*(random(2)-1);
//it should give an even spread and not favour the "poles"
//as a flat spread of angles would
multiply_quaternion(cos(phi/2),sin(phi/2),0,0,cos(theta/2),0,sin(theta/2),0);
multiply_quaternion_right(cos(psi/2),0,0,sin(psi/2));
