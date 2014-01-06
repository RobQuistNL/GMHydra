/*
**  Usage:
**      d3d_transmod_local_skew_x(y,z)
**
**  Arguments:
**      y, z: coordinates       
**
**  Returns:
**      nothing
**
**  Notes:
**      The x-axis is made skew: points (t,0,0) are draw at (t,t*y,t*z). 
**      The y-axis (points (0,t,0)) and the z-axis (points (0,0,t)) stay 
**      the same. 
**      The skew transformation is added locally to the current 
**      transformation.
**
**  brac37
*/
{
    d3d_transmod_local_matrix (1,argument0,argument1, 0,1,0, 0,0,1,
                               argument2, argument3, argument4);
}
