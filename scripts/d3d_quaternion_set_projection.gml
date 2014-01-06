/** \def d3d_quaternion_set_projection(x,y,z,q0,q1,q2,q3)
 * d3d_quaternion_set_projection(x,y,z,q0,q1,q2,q3)
 *
 * Set a camera orientation from a quaternion 
 * This script treats +x as the base direction, eg looking RIGHT on the map,
 * to be consistant with the rest of Gamemaker 
 *
 * 
 */
//Optimised vectorisation for camera?
//Formulae obtained by expanding out q.v.q* formula to give formulae
//for the object's x and z vectors
//precalculate common expressions
var t1,t2;
t1=sqr(argument3)-sqr(argument5)
t2=sqr(argument4)-sqr(argument6)
d3d_set_projection(argument0,argument1,argument2,argument0+(t1+t2),argument1+2*(argument4*argument5+argument3*argument6),argument2+2*(argument4*argument6-argument3*argument5),2*(argument4*argument6+argument3*argument5),2*(argument5*argument6-argument3*argument4),t1-t2);
