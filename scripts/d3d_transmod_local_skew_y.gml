/*
**  Usage:
**      d3d_transmod_local_skew_y(x,z)
**
**  Arguments:
**      x, z: coordinates       
**
**  Returns:
**      nothing
**
**  Notes:
**      The y-axis is made skew: points (0,t,0) are draw at (t*x,t,t*z). 
**      The x-axis (points (t,0,0)) and the z-axis (points (0,0,t)) stay 
**      the same. 
**      The skew transformation is added locally to the current 
**      transformation.
**
**  brac37
*/
{
    d3d_transmod_local_matrix (1,0,0, argument0,1,argument1, 0,0,1,
                               argument2, argument3, argument4);
}
