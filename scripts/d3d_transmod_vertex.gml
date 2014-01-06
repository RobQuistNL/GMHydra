/*
**  Usage:
**      d3d_transmod_vertex (ind, x,y,z);
**
**  Arguments:
**      same as d3d_model_vertex ()       
**
**  Returns:
**      nothing
**
**  brac37
*/
{
    var vx, vy, vz, nx;
    vx = global._transmod_array[global._transmod_current,0] * argument1 +
         global._transmod_array[global._transmod_current,3] * argument2 +
         global._transmod_array[global._transmod_current,6] * argument3 +
         global._transmod_array[global._transmod_current,9];
    vy = global._transmod_array[global._transmod_current,1] * argument1 +
         global._transmod_array[global._transmod_current,4] * argument2 +
         global._transmod_array[global._transmod_current,7] * argument3 +
         global._transmod_array[global._transmod_current,10];
    vz = global._transmod_array[global._transmod_current,2] * argument1 +
         global._transmod_array[global._transmod_current,5] * argument2 +
         global._transmod_array[global._transmod_current,8] * argument3 +
         global._transmod_array[global._transmod_current,11];
    d3d_model_vertex (argument0, vx, vy, vz);         
}