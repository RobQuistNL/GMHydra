/*
**  Usage:
**      d3d_transmod_floor(ind, x1,y1,z1, x2,y2,z2, hrep,vrep,
**                             hoffset,voffset, nscale)
**
**  Arguments:
**      ind:                the index of the model     
**      x1,y1,z1,x2,y2,z2:  coordinates
**      hrep,vrep:          how often the texture is repeated hor./vert.
**      steps:              the number of steps                          
**      hoffset,voffset:    the offset of the texture coordinates
**                          this can be used to select a part of a texture: 
**                          see below
**      nscale:             to scale the normals, default is 1, flip is -1
**      
**  Returns:
**      nothing
**
**  Notes:
**      As opposed to this script, the standard function d3d_model_floor 
**      handles lighting incorrectly.
**      The sloping is in the direction of the y-axis, as opposed to
**      d3d_model_floor. Use d3d_transmod_ceiling for sloping in the
**      direction of the x-axis.
**      The part of the texture that is drawn is given by the following
**      texture coordinates: 
**          (hoffset     ,voffset     ),    (hoffset+hrep,voffset     ),
**          (hoffset     ,voffset+vrep),    (hoffset+hrep,voffset+vrep)
**      The texture is repeated when the model is drawn after a call
**      texture_set_repeat(true).
**
**  brac37
*/
{
    var ind, x1, y1, z1, x2, y2, z2, hrep, vrep, hoffset, voffset, n, ns;
    ind = argument0;
    x1 = argument1;
    y1 = argument2;
    z1 = argument3;
    x2 = argument4;
    y2 = argument5;
    z2 = argument6;
    hrep = argument7;
    vrep = argument8;
    hoffset = argument9;
    voffset = argument10;
    ns = argument11;
    if (ns == 0) ns = 1;
    var ny, nz;
    ny = (z2 - z1) * (x2 - x1);
    nz = (x1 - x2) * (y2 - y1);
    n = 1 / sqrt (sqr(ny) + sqr(nz));
    ny *= n;
    nz *= n;
    d3d_transmod_primitive_begin (ind, pr_trianglefan);
    d3d_transmod_vertex_normal_texture (ind, x1, y1, z1, 0, ny, nz,
                                        hoffset, voffset, ns);
    d3d_transmod_vertex_normal_texture (ind, x1, y2, z2, 0, ny, nz,
                                        hoffset, voffset + vrep, ns);
    d3d_transmod_vertex_normal_texture (ind, x2, y2, z2, 0, ny, nz, 
                                        hoffset + hrep, voffset + vrep, ns);
    d3d_transmod_vertex_normal_texture (ind, x2, y1, z1, 0, ny, nz, 
                                        hoffset + hrep, voffset, ns);
    d3d_transmod_primitive_end (ind);
}
