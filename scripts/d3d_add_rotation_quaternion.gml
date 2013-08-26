/** \def d3d_add_rotation_quaternion(q0,q1,q2,q3)
 * d3d_add_rotation_quaternion(q0,q1,q2,q3)
 *
 * Function to apply quaternion q0,q1,q2,q3 to the current drawing state
 * using a rotation about an axis.
 * The function uses d3d_transform_add_rotation_axis
 *
 * note that although I do not have mathematical proof it appears
 * as though any orientation may be expressed as a single rotation about
 * an axis, and therefore that any combination of rotations about multiple
 * axes may be combined into one rotation about new axis
 */
// The commented version is the code written out in full for clarity
//var q0,q1,q2,q3,mag,theta;
//q0=argument0;
//q1=argument1;
//q2=argument2;
//q3=argument3;
//mag=sqrt(sqr(q1)+sqr(q2)+sqr(q3));
//theta=radtodeg(arctan2(mag,q0))*2;
//d3d_transform_add_rotation_axis(q1,q2,q3,theta); 
d3d_transform_add_rotation_axis(argument1,argument2,argument3,-radtodeg(arctan2(sqrt(sqr(argument1)+sqr(argument2)+sqr(argument3)),argument0))*2); 
