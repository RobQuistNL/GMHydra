/** \def multiply_quaternion_left(l0,l1,l2,l3)
 * multiply_quaternion_left(l0,l1,l2,l3)
 *
 * multiply two quaternions l (from arguments) and q (from object)
 * arguments are real,i,j,k parts of quaternion
 *
 * note that the order of the two quaternions is very
 * important. multiply_quaternion_left will apply a rotation in the
 * room's reference frame not the object's frame.
 */
var qq0,qq1,qq2,qq3;
qq0=q0;
qq1=q1;
qq2=q2;
qq3=q3;
q0=argument0*qq0-argument1*qq1-argument2*qq2-argument3*qq3;
q1=argument0*qq1+argument1*qq0+argument2*qq3-argument3*qq2;
q2=argument0*qq2+argument2*qq0+argument3*qq1-argument1*qq3;
q3=argument0*qq3+argument3*qq0+argument1*qq2-argument2*qq1;
