/*
**  Usage:
**      d3d_transmod_cylinder(ind, x1,y1,z1, x2,y2,z2, hrep,vrep, 
**                                closed, steps, conformal
**                                hoffset,voffset, nscale)
**
**  Arguments:
**      ind:                the index of the model     
**      x1,y1,z1,x2,y2,z2:  coordinates
**      hrep,vrep:          how often the texture is repeated hor./vert.
**      closed:             if set to true, the bottom is closed
**      steps:              the number of steps in horizontal direction                     
**      conformal:          if set to true, the texture is mapped conformal
**                          on an elliptic cylinder (a circular cylinder is 
**                          always conformal)
**      hoffset,voffset:    the offset of the texture coordinates
**                          this can be used to select a part of a texture: 
**                          see below
**      nscale:             to scale the normals, default is 1, flip is -1
**      
**  Returns:
**      nothing
**
**  Notes:
**      As opposed to this script, the function d3d_model_cylinder 
**      handles lighting incorrectly.
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
    var ind, x1, y1, z1, x2, y2, z2, hrep, vrep, closed;
    ind = argument0;
    x1 = argument1;
    y1 = argument2;
    z1 = argument3;
    x2 = argument4;
    y2 = argument5;
    z2 = argument6;
    hrep = argument7;
    vrep = argument8;
    closed = argument9;
    var  steps, fractal, hoffset, voffset, ns;
    steps = argument10;
    fractal = argument11
    hoffset = argument12;
    voffset = argument13;
    ns = argument14;
    if (ns == 0) ns = 1; 
    var xc, yc, zc, xr, yr, h, s;
    xc = (x2 + x1)/2;
    yc = (y2 + y1)/2;
    xr = (x2 - x1)/2;
    yr = (y2 - y1)/2;
    h = z2 - z1;
    var a, ca, sa, j, xt, yt, xn, yn, n, xtex, ytex;
    xn = xc + xr;
    yn = yc;
    xtex[0] = 0;
    for (j=1; j<=steps; j+=1)
    {
        xtex[j] = j;
        if (fractal) 
        {
            xt = xc + xr * cos (2*pi * j / steps);
            yt = yc - yr * sin (2*pi * j / steps);
            xtex[j] = xtex[j-1] + point_distance (xn, yn, xt, yt);
            xn = xt;
            yn = yt;
        }
    }    
    for (j=0; j<=steps; j+=1)
    {
        xtex[j] = hoffset + xtex[j] * hrep / xtex[steps];
    }
    d3d_transmod_primitive_begin (ind, pr_trianglestrip);
    for (j=0; j<=steps; j+=1) {
        a = 2*pi * j /steps;
        ca = cos (a);
        sa = sin (a);
        xt = xc + ca * xr;
        yt = yc + sa * yr;
        xn = ca * yr * h;
        yn = sa * xr * h;
        n = 1 / sqrt (sqr(xn) + sqr(yn));
        xn *= n;
        yn *= n;
        ytex = voffset + vrep;
        d3d_transmod_vertex_normal_texture (ind, xt, yt, z2, 
                                xn, yn, 0, xtex[j], ytex, ns);
        d3d_transmod_vertex_normal_texture (ind, xt, yt, z1, 
                                xn, yn, 0, xtex[j], voffset, ns);
    }
    d3d_transmod_primitive_end (ind);
    if (closed) 
    {
        d3d_transmod_disc (ind,x1,y1,z1,x2,y2,z1,0,0,steps,0,0,ns);
        d3d_transmod_disc (ind,x1,y2,z2,x2,y1,z2,0,0,steps,0,0,ns);
    }    
}                        
