/** \def d3d_quaternion_light_direction_neg(ind,q0,q1,q2,q3,color)
 * d3d_quaternion_light_direction_neg(ind,q0,q1,q2,q3,color)
 *
 * Arguments are ind,q0,q1,q2,q3,color
 *
 * Applies a directional light according to a quaternion
 * 
 * Script treats -x as the base direction.
 */
//vectorisation of -x direction
//Formulae obtained by expanding out q.v.q* formula;
d3d_light_define_direction(argument0,-(sqr(argument1)+sqr(argument2)-sqr(argument3)-sqr(argument4)),-2*(argument2*argument3+argument1*argument4),-2*(argument2*argument4-argument1*argument3),argument5);
