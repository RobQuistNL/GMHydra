/*
**  Usage:
**      d3d_transmod_set_skew_z(x,y)
**
**  Arguments:
**      x, y: coordinates       
**
**  Returns:
**      nothing
**
**  Notes:
**      The z-axis is made skew: points (0,0,t) are draw at (t*x,t*y,t). 
**      The x-axis (points (t,0,0)) and the y-axis (points (0,t,0)) stay 
**      the same.
**
**  brac37
*/
{
    d3d_transmod_set_matrix (1,0,0, 0,1,0, argument0,argument1,1,
                             argument2, argument3, argument4);
}
