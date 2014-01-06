/*
**  Usage:
**      d3d_transmod_cone(ind, x1,y1,z1, x2,y2,z2, hrep,vrep, closed
**                            hsteps,vsteps, fractal, hoffset,voffset, 
**                            nscale)
**
**  Arguments:
**      ind:                the index of the model     
**      x1,y1,z1,x2,y2,z2:  coordinates
**      hrep,vrep:          how often the texture is repeated hor./vert.
**      closed:             if set to true, the bottom is closed
**      hsteps,vsteps:      the number of steps in hor./vert. direction
**      fractal:            if set to true, the texture is mapped conformal
**                          the result is that the texture is repeated 
**                          infinitely in vertical direction
**                          the parameter vrep (still) influences the aspect                          
**      hoffset,voffset:    the offset of the texture coordinates
**                          this can be used to select a part of a texture: 
**                          see below
**      nscale:             to scale the normals, default is 1, flip is -1
**      
**  Returns:
**      nothing
**
**  Notes:
**      As opposed to this script, the standard function d3d_model_cone 
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
    var hsteps, vsteps, fractal, hoffset, voffset, ns;
    hsteps = argument10;
    vsteps = argument11;
    fractal = argument12;
    hoffset = argument13;
    voffset = argument14;
    ns = argument15;
    if (ns == 0) ns = 1;
    var xc, yc, xr, yr, h, s;
    xc = (x1 + x2)/2;
    yc = (y1 + y2)/2;
    xr = (x2 - x1)/2;
    yr = (y2 - y1)/2;
    h = z2 - z1;
    if (yr == 0) s = sign (xr);
    else if (xr == 0) s = sign (yr);
    else s = sign (xr * yr);
    ns *= s;
    var xt1, yt1, zt1, xt2, yt2, zt2, xt3, yt3, zt3, xt4, yt4, zt4;
    var i, j, n, a, t;
    var xn1, yn1, zn1, xn2, yn2, zn2, xtex, ytex;
    xt1 = xc + xr;
    yt1 = yc;
    xn1 = xr * h;
    yn1 = 0;
    zn1 = sqr(xr);
    n = 1 / sqrt (sqr(xn1) + sqr(zn1));
    xn1 *= n;
    zn1 *= n;
    xn2 = xr;
    yn2 = 0;
    xtex[0] = 0;
    for (j=1; j<=hsteps; j+=1)
    {
        xtex[j] = j;
        if (fractal) 
        {
            xt2 = xr * cos (2*pi * j / hsteps);
            yt2 = -yr * sin (2*pi * j / hsteps);
            xtex[j] = xtex[j-1] + point_distance (xn2, yn2, xt2, yt2);
            xn2 = xt2;
            yn2 = yt2;
        }
    }    
    for (j=0; j<=hsteps; j+=1)
    {
        xtex[j] = hoffset + xtex[j] * hrep / xtex[hsteps];
    }
    for (j=1; j<=hsteps; j+=1) {
        a = 2*pi * j / hsteps;
        xt2 = xc + xr * cos (a);
        yt2 = yc + yr * sin (a);
        xn2 = (xt2 - xc) * sqr(yr) * h;
        yn2 = (yt2 - yc) * sqr(xr) * h;
        zn2 = sqr(xr) * sqr(yr);
        n = 1 / sqrt (sqr(xn2) + sqr(yn2) + sqr(zn2));
        xn2 *= n;
        yn2 *= n;
        zn2 *= n;
        d3d_transmod_primitive_begin (ind, pr_trianglestrip)
        d3d_transmod_vertex_normal_texture (ind, xt1, yt1, z1, 
                                xn1, yn1, zn1, xtex[j-1], voffset, ns);
        d3d_transmod_vertex_normal_texture (ind, xt2, yt2, z1, 
                                xn2, yn2, zn2, xtex[j], voffset, ns);
        for (i=1; i<vsteps; i+=1) {
            t = sqr(1 - i / vsteps);
            xt3 = t * xt1 + (1-t) * xc;
            yt3 = t * yt1 + (1-t) * yc;
            zt3 = t * z1 + (1-t) * z2;
            xt4 = t * xt2 + (1-t) * xc;
            yt4 = t * yt2 + (1-t) * yc;
            zt4 = t * z1 + (1-t) * z2;
            if (fractal) ytex = voffset - ln (t) * vrep;
            else ytex = voffset + (1 - t) * vrep;
            d3d_transmod_vertex_normal_texture (ind, xt3, yt3, zt3, 
                                    xn1, yn1, zn1, xtex[j-1], ytex, ns);
            d3d_transmod_vertex_normal_texture (ind, xt4, yt4, zt4, 
                                    xn2, yn2, zn2, xtex[j], ytex, ns);
        }
        if (fractal) ytex += vrep;
        else ytex = voffset + vrep;
        d3d_transmod_vertex_normal_texture (ind, xc, yc, z2, 
                                xn1, yn1, zn1, xtex[j-1], ytex, ns);
        d3d_transmod_primitive_end (ind);
        xt1 = xt2;
        yt1 = yt2;
        xn1 = xn2;
        yn1 = yn2;
        zn1 = zn2;
    }     
    if (closed) d3d_transmod_disc (ind,x1,y1,z1,x2,y2,z1,0,0,hsteps,0,0,ns*s);
}
