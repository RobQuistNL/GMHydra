/** \def sinc(x)
 * sinc(x) 
 *
 * This function is defined as sin(x)/x
 * It is used by the quaternion_roll function as part of the
 * formula for converting a vector into a rotation axis 
 * because it is valid for x=0 and so it won't cause
 * divide by zero errors
 * 
 * note that for very small x sinc(x) is close to 1-sqr(x)/6
 */
if abs(argument0)>0.0000001
{
  return sin(argument0)/argument0;
};
return 1-sqr(argument0)*0.16666666666666666666666666666667;
