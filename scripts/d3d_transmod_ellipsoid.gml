/*
**  Usage:
**      d3d_transmod_ellipsiod(ind, x1,y1,z1, x2,y2,z2, hrep,vrep,
**                                 hsteps,vsteps, fractal, poles,
**                                 hoffset,voffset, nscale)
**
**  Arguments:
**      ind:                the index of the model     
**      x1,y1,z1,x2,y2,z2:  coordinates
**      hrep,vrep:          how often the texture is repeated hor./vert.
**      hsteps,vsteps:      the number of steps in hor./vert. direction
**      fractal:            if set to true, the texture is mapped conformal
**                          the result is that the texture is repeated 
**                          infinitely in vertical direction
**                          the parameter vrep (still) influences the aspect
**      poles:              if set to true, the poles are drawn with more
**                          precision, which can be desirable if fractal is 
**                          set to true                           
**      hoffset,voffset:    the offset of the texture coordinates
**                          this can be used to select a part of a texture: 
**                          see below
**      nscale:             to scale the normals, default is 1, flip is -1
**      
**  Returns:
**      nothing
**
**  Notes:
**      As opposed to this script, the function d3d_model_ellipsiod 
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
    var ind, x1, y1, z1, x2, y2, z2, xc, yc, zc, xr, yr, zr, s;
    ind = argument0;
    x1 = argument1;
    y1 = argument2;
    z1 = argument3;
    x2 = argument4;
    y2 = argument5;
    z2 = argument6;
    xc = (x1 + x2)/2;
    yc = (y1 + y2)/2;
    zc = (z1 + z2)/2;
    xr = (x2 - x1)/2;
    yr = (y2 - y1)/2;
    zr = (z2 - z1)/2;
    if (zr == 0)
    {
        if (yr == 0) s = sign (xr);
        else if (xr == 0) s = sign (yr);
        else s = sign (xr) * sign (yr);
    }
    else
    {  
        if (yr == 0) s = sign (xr) * sign (zr);
        else if (xr == 0) s = sign (yr) * sign (zr);
        else s = sign (xr) * sign (yr) * sign (zr);
    }
    var hrep, vrep, hsteps, vsteps, fractal, poles, hoffset, voffset, ns;
    hrep = argument7;
    vrep = argument8;
    hsteps = max (argument9, 3); 
    vsteps = argument10; 
    fractal = argument11;
    poles = argument12;
    hoffset = argument13;
    voffset = argument14;
    if (vsteps < 2) 
    {
        if (poles) vsteps = hsteps;
        else vsteps = ceil(0.5*hsteps); 
    }
    ns = argument15;
    if (ns == 0) ns = 1;
    ns *= s;
    var xt, yt, zt, xn, yn, zn, c, s, t, i, j, n, xtex, ytex;    
    for (i=floor(0.5*vsteps); i>=0; i-=1)
    {
        if (poles) t[i] = pi * (2 * sqr (i / vsteps) - 0.5);
        else t[i] = pi * (i / vsteps - 0.5);
        s[i] = sin(t[i]);
        c[i] = cos(t[i]);
        s[vsteps-i] = -s[i];
        c[vsteps-i] = c[i];
        if (fractal)
        {
            if (i == 0) ytex[i] = ytex[1] - vrep / pi;
            else ytex[i] = voffset + vrep * (0.5 +
                            ln (1/cos(t[i]) + tan(-t[i])) / pi);
        }
        else  
        {
            ytex[i] = voffset + vrep * (1 - i / vsteps);
        }  
        ytex[vsteps-i] = 2 * voffset + vrep - ytex[i];
    }     
    xn = xc + xr;
    yn = yc;
    xtex[0] = 0;
    for (j=1; j<=hsteps; j+=1)
    {
        xtex[j] = j;
        if (fractal) 
        {
            xt = xc + xr * cos (2*pi * j / hsteps);
            yt = yc - yr * sin (2*pi * j / hsteps);
            xtex[j] = xtex[j-1] + point_distance (xn, yn, xt, yt);
            xn = xt;
            yn = yt;
        }
    }    
    for (j=0; j<=hsteps; j+=1)
    {
        xtex[j] = hoffset + xtex[j] * hrep / xtex[hsteps];
    }
    for (j=0; j<hsteps; j+=1)
    {
        d3d_transmod_primitive_begin (ind, pr_trianglestrip);
        d3d_transmod_vertex_normal_texture (ind, xc, yc, z1, 
            0, 0, sign (z1 - zc), xtex[j], ytex[0], ns);
        for (i=1; i<vsteps; i+=1)
        {
            xt = xc + c[i] * xr * cos (2*pi * (j+1) / hsteps);
            yt = yc + c[i] * yr * sin (2*pi * (j+1) / hsteps);
            zt = zc + s[i] * zr;
            xn = (xt - xc) * sqr(yr) * sqr(zr);
            yn = (yt - yc) * sqr(xr) * sqr(zr);
            zn = (zt - zc) * sqr(xr) * sqr(yr);
            n = 1 / sqrt (sqr(xn) + sqr(yn) + sqr(zn));
            xn *= n;
            yn *= n;
            zn *= n;
            d3d_transmod_vertex_normal_texture (ind, xt, yt, zt, 
                                    xn, yn, zn, xtex[j+1], ytex[i], ns);
            xt = xc + c[i] * xr * cos (2*pi * j / hsteps);
            yt = yc + c[i] * yr * sin (2*pi * j / hsteps);
            zt = zc + s[i] * zr;                
            xn = (xt - xc) * sqr(yr) * sqr(zr);
            yn = (yt - yc) * sqr(xr) * sqr(zr);
            zn = (zt - zc) * sqr(xr) * sqr(yr);
            n = 1 / sqrt (sqr(xn) + sqr(yn) + sqr(zn));
            xn *= n;
            yn *= n;
            zn *= n;
            d3d_transmod_vertex_normal_texture (ind, xt, yt, zt, 
                                    xn, yn, zn, xtex[j], ytex[i], ns);
        }  
        d3d_transmod_vertex_normal_texture (ind, xc, yc, z2, 
            0, 0, sign (z2 - zc), xtex[j+1], ytex[vsteps], ns);
        d3d_transmod_primitive_end (ind);
    }
}
