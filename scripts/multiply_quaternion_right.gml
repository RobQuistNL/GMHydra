/** \def multiply_quaternion_right(r0,r1,r2,r3)
 * multiply_quaternion_right(r0,r1,r2,r3)
 *
 * multiply two quaternions q (from object) and r (from arguments)
 * arguments are real,i,j,k parts of quaternion
 * result is returned in variables q0,q1,q2,q3
 *
 * note that the order of the two quaternions is very
 * important. multiply_quaternion_right will apply a rotation in the
 * object's reference frame
 *
 */
// multiply q0,q1,q2,q3 by a quaternion argument
// argument is on the right (the order is important with quaternions)
// arguments are real,i,j,k
// multiplies q*argument 
var qq0,qq1,qq2,qq3;
qq0=q0;
qq1=q1;
qq2=q2;
qq3=q3;
q0=qq0*argument0-qq1*argument1-qq2*argument2-qq3*argument3;
q1=qq0*argument1+qq1*argument0+qq2*argument3-qq3*argument2;
q2=qq0*argument2+qq2*argument0+qq3*argument1-qq1*argument3;
q3=qq0*argument3+qq3*argument0+qq1*argument2-qq2*argument1;
