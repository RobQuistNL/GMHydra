/*
**  Usage:
**      d3d_transmod_disc(ind, x1,y1,z1, x2,y2,z2, hrep,vrep, steps,
**                     hoffset,voffset, nscale)
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
    var ind, x1, y1, z1, x2, y2, z2, hrep, vrep, steps, hoffset, voffset, ns;
    ind = argument0;
    x1 = argument1;
    y1 = argument2;
    z1 = argument3;
    x2 = argument4;
    y2 = argument5;
    z2 = argument6;
    hrep = argument7;
    vrep = argument8;
    steps = argument9;
    hoffset = argument10;
    voffset = argument11;
    ns = argument12;    
    if (ns == 0) ns = 1;
    var xc, yc, xr, yr, h, s;
    xc = (x2 + x1)/2;
    yc = (y2 + y1)/2;
    xr = (x2 - x1)/2;
    yr = (y2 - y1)/2;
    h = z2 - z1;
    if (yr == 0) s = -sign (xr);
    else if (xr == 0) s = -sign (yr);
    else s = -sign (xr * yr);
    var a, ca, sa, i, j, xt, yt, xn, yn, zn, xtex1, ytex1, xtex2, ytex2;
    xtex1 = hoffset + 0.5 * hrep;
    ytex1 = voffset + 0.5 * vrep;
    d3d_transmod_primitive_begin (ind, pr_trianglefan);
    d3d_transmod_vertex_normal_texture (ind, xc, yc, z2, 
                            0, 0, s, xtex1, ytex1, ns);                
    for (j=steps; j>=0; j-=1)
    {
        a = 2*pi * j / steps;
        sa = sin (a);
        ca = cos (a);
        xt = xc + ca * xr;
        yt = yc + sa * yr;
        xn = s * (xt - xc) * sqr(yr) * h;
        yn = s * (yt - yc) * sqr(xr) * h;
        zn = s * sqr(xr) * sqr(yr);
        n = 1 / sqrt (sqr(xn) + sqr(yn) + sqr(zn));
        xn *= n;
        yn *= n;
        zn *= n;
        xtex2 = xtex1 + 0.5 * ca * hrep;
        ytex2 = ytex1 + 0.5 * sa * vrep;
        d3d_transmod_vertex_normal_texture (ind, xt, yt, z1,
                                xn, yn, zn, xtex2, ytex2, ns);
    }
    d3d_transmod_primitive_end (ind);                    
} 
