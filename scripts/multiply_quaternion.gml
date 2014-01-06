/** \def multiply_quaternion(r0,r1,r2,r3,s0,s1,s2,s3)
 * multiply_quaternion(r0,r1,r2,r3,s0,s1,s2,s3)
 *
 * multiply two quaternions r and s
 * arguments are real,i,j,k,real2,i2,j2,k2
 * result is returned in variables q0,q1,q2,q3
 *
 * note that the order of the two quaternions is very
 * important. multiply_quaternion(s,r) is not the same as
 * multiply_quaternion(r,s)
 */
q0=argument0*argument4-argument1*argument5-argument2*argument6-argument3*argument7;
q1=argument0*argument5+argument1*argument4+argument2*argument7-argument3*argument6;
q2=argument0*argument6+argument2*argument4+argument3*argument5-argument1*argument7;
q3=argument0*argument7+argument3*argument4+argument1*argument6-argument2*argument5;
