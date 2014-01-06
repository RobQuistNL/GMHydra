/*
**  Usage:
**      d3d_transmod_vertex_normal (ind, x,y,z, nx,ny,nz, nscale);
**
**  Arguments:
**      The first 7:    same as d3d_model_vertex_normal ()       
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
    var vx, vy, vz, nx, ny, nz, n;
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
    nx = global._transmod_array[global._transmod_current,12] * argument4 +
         global._transmod_array[global._transmod_current,15] * argument5 +
         global._transmod_array[global._transmod_current,18] * argument6;
    ny = global._transmod_array[global._transmod_current,13] * argument4 +
         global._transmod_array[global._transmod_current,16] * argument5 +
         global._transmod_array[global._transmod_current,19] * argument6;
    nz = global._transmod_array[global._transmod_current,14] * argument4 +
         global._transmod_array[global._transmod_current,17] * argument5 +
         global._transmod_array[global._transmod_current,20] * argument6;
    n = argument7;
    if (n == 0) n = 1;
    n /= sqrt (sqr(nx) + sqr(ny) + sqr(nz));
    d3d_model_vertex_normal (argument0, vx, vy, vz, 
                             n*nx, n*ny, n*nz);         
}
