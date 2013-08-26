/** \def normalise_quaternion()
 * normalise_quaternion()
 *
 * Normalises (q0,q1,q2,q3)
 * Ensures that math errors have not shifted the absolute value
 * away from 1. Note that this function uses slow math functions
 * but the optimised math form uses more code and so would
 * run slower in Gamemaker.
 */
var temp;
temp=1/sqrt(sqr(q0)+sqr(q1)+sqr(q2)+sqr(q3));
q0*=temp;
q1*=temp;
q2*=temp;
q3*=temp;
