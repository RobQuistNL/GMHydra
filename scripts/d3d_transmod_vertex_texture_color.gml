/*
**  Usage:
**      d3d_transmod_vertex_normal_texture_color(ind, x,y,z, nx,ny,nz, 
**                                      xtex,ytex, col,alpha, nscale);
**
**  Arguments:
**      The first 11:   same as d3d_model_vertex_normal_texture_color ()       
**      nscale:         to scale the normals, default is 1, flip is -1
**
**  Returns:
**      nothing
**
**  Notes:
**      This script normalizes the normal vector for you.
**
**  brac37
*/
{
    var vx, vy, vz;
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
    d3d_model_vertex_texture_color (argument0, vx, vy, vz, 
                                    argument4, argument5, 
                                    argument6, argument7);         
}
