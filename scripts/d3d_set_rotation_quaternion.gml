/** \def d3d_set_rotation_quaternion(q0,q1,q2,q3)
 * d3d_set_rotation_quaternion(q0,q1,q2,q3)
 *
 * Function to apply quaternion q0,q1,q2,q3 to the current drawing state
 * using a rotation about an axis.
 * The function uses d3d_transform_set_rotation_axis
 *
 * Derived from d3d_add_rotation_quaternion() script
 *
 */
d3d_transform_set_rotation_axis(argument1,argument2,argument3,-radtodeg(arctan2(sqrt(sqr(argument1)+sqr(argument2)+sqr(argument3)),argument0))*2); 
