/** \def quaternion_rotate_vector(x,y,z)
 * quaternion_rotate_vector(x,y,z)
 *
 * script to rotate a vector by an object's quaternion
 *
 * arguments are the x,y,z components of the vector
 * the result is put into variables vx,vy,vz
 *
 * this can be called with (1,0,0) to obtain a vector
 * pointing the way the object is facing. Use (-1,0,0)
 * if you are using the _neg functions
 */
var qq0,qq1,qq2,qq3;
qq0=q0;
qq1=q1;
qq2=q2;
qq3=q3;
multiply_quaternion_right(0,argument0,argument1,argument2);
multiply_quaternion_right(qq0,-qq1,-qq2,-qq3);
vx=q1;
vy=q2;
vz=q3;
q0=qq0;
q1=qq1;
q2=qq2;
q3=qq3;
