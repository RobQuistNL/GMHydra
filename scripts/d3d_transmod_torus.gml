/*
**  Usage:
**      d3d_transmod_torus(ind, x1,y1,z1, x2,y2,z2, hrep,vrep, hsteps,vsteps, 
**                      conformal, hoffset,voffset, nscale)
**
**  Arguments:
**      ind:                the index of the model     
**      x1,y1,z1,x2,y2,z2:  coordinates
**      hrep,vrep:          how often the texture is repeated hor./vert.
**      hsteps,vsteps:      the number of steps in hor./vert. direction
**      conformal:          if set to true, the texture is mapped conformal
**                          on an elliptic torus (a circular torus is 
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
    var ind, x1, y1, z1, x2, y2, z2, xc, yc, zc, xR, xr, yR, yr, zr;
    var hrep, vrep, hsteps, vsteps, fractal, hoffset, voffset, ns;
    ind = argument0;
    x1 = argument1;
    y1 = argument2;
    z1 = argument3;
    x2 = argument4;
    y2 = argument5;
    z2 = argument6;
    xc = 0.5 * (x1 + x2);
    yc = 0.5 * (y1 + y2);
    zc = 0.5 * (z1 + z2);
    xr = 0.5 * abs (z2 - z1) * sign (x2 - x1);
    yr = 0.5 * abs (z2 - z1) * sign (y2 - y1);
    zr = 0.5 * (z2 - z1);
    xR = 0.5 * (x2 - x1) - xr;
    yR = 0.5 * (y2 - y1) - yr;
    hrep = argument7; 
    vrep = argument8; 
    hsteps = argument9; 
    vsteps = argument10;
    fractal = argument11;
    hoffset = argument12;
    voffset = argument13;
    ns = argument14; 
    if (ns == 0) ns = 1;
    if (zr < 0) ns = -ns;
    var xc1, yc1, xc2, yc2, xt, yt, zt, cR1, sR1, cR2, sR2, cr, sr, i, j, t;
    var xtex, ytex1, ytex2;
    cR1 = 1;
    sR1 = 0;
    xc1 = xR;
    yc1 = 0;
    xtex[0] = 0;
    for (j=1; j<=hsteps; j+=1)
    {
        xtex[j] = j;
        if (fractal) 
        {
            xc2 = xR * cos (2*pi * j / hsteps);
            yc2 = -yR * sin (2*pi * j / hsteps);
            xtex[j] = xtex[j-1] + point_distance (xc1, yc1, xc2, yc2);
            xc1 = xc2;
            yc1 = yc2;
        }
    }    
    for (j=0; j<=hsteps; j+=1)
    {
        xtex[j] = hoffset + xtex[j] * hrep / xtex[hsteps];
    }
    xc1 += xc;
    yc1 += yc;
    for (j=1; j<=hsteps; j+=1)
    { 
        cR2 = cos (2*pi * j / hsteps);
        sR2 = sin (2*pi * j / hsteps);
        xc2 = xc + xR * cR2;
        yc2 = yc - yR * sR2;
        cR2 /= xR;
        sR2 /= yR;
        t = 1 / sqrt (sqr(cR2) + sqr(sR2));
        cR2 *= t;
        sR2 *= t;
        d3d_transmod_primitive_begin (ind, pr_trianglestrip);
        for (i=0; i<=vsteps; i+=1)
        {
            ytex = voffset + i * vrep / vsteps;
            cr = cos (2*pi * i/vsteps);
            sr = sin (2*pi * i/vsteps);
            xt = xc1 + xr * cR1 * sr; 
            yt = yc1 - yr * sR1 * sr; 
            zt = zc + zr * cr;
            n = 1 / sqrt (sqr (xt - xc1) + sqr (yt - yc1) + sqr (zt - zc)); 
            d3d_transmod_vertex_normal_texture (ind, xt, yt, zt, 
                n * (xt - xc1), n * (yt - yc1), n * (zt - zc), 
                xtex[j-1], ytex, ns);
            xt = xc2 + xr * cR2 * sr; 
            yt = yc2 - yr * sR2 * sr;
            zt = zc + zr * cr;
            n = 1 / sqrt (sqr (xt - xc2) + sqr (yt - yc2) + sqr (zt - zc)); 
            d3d_transmod_vertex_normal_texture (ind, xt, yt, zt, 
                n * (xt - xc2), n * (yt - yc2), n * (zt - zc), 
                xtex[j], ytex, ns);
        }
        d3d_transmod_primitive_end (ind);
        cR1 = cR2;
        sR1 = sR2;
        xc1 = xc2;
        yc1 = yc2;
    }
}  
