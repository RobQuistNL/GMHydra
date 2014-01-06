{
    var xfront, yfront, zfront, xfront2, yfront2, zfront2;
    var xright, yright, zright, xup, yup, zup, c;
    if (global._transmod_current == -1){
        exit;
    }           
    c = global._transmod_current;
    xfront = global._transmod_array[c,0];
    yfront = global._transmod_array[c,1];
    zfront = global._transmod_array[c,2];
    xright = global._transmod_array[c,3];
    yright = global._transmod_array[c,4];
    zright = global._transmod_array[c,5];
    xup = global._transmod_array[c,6];
    yup = global._transmod_array[c,7];
    zup = global._transmod_array[c,8];
    var m, xa, ya, za, a, cosa, sina; 
    m = argument0;
    if (m < 1) { 
        if (global._transmod_array[c,22] == 0) {
            m = 2;
        } else if (m <= 0) {
            m = 4;
        } else if (abs (xfront*xright + yfront*yright + zfront*zright) <= m and
                   abs (xfront*xup + yfront*yup + zfront*zup) <= m and
                   abs (xright*xup + yright*yup + zright*zup) <= m) {
            if (abs (sqr(xfront) + sqr(yfront) + sqr(zfront) - 1) <= m and
                abs (sqr(xright) + sqr(yright) + sqr(zright) - 1) <= m and
                abs (sqr(xup) + sqr(yup) + sqr(zup) - 1) <= m) {
                m = 2;
            } else {
                m = 3;    
            }
        } else {
            m = 4;
        }        
    }
    if (m >= 4) {
        // Oh no, this is hell, the transformation is not orthogonal.
        xa = sqr(xfront) + sqr(yfront) + sqr(zfront);
        ya = sqr(xright) + sqr(yright) + sqr(zright);
        za = xfront*xright + yfront*yright + zfront*zright;
        xa -= ya;
        ya = sqrt(sqr(xa) + 4*sqr(za));
        a = sign(za) * arctan2 (sqrt(ya-xa),sqrt(ya+xa));
        d3d_transform_add_rotation_z (radtodeg (a));
        cosa = cos (a);
        sina = sin (a);
        xfront2 = cosa*xfront + sina*xright;
        yfront2 = cosa*yfront + sina*yright;
        zfront2 = cosa*zfront + sina*zright;
        xright = cosa*xright - sina*xfront;
        yright = cosa*yright - sina*yfront;
        zright = cosa*zright - sina*zfront;
        xa = sqrt(sqr(xfront2) + sqr(yfront2) + sqr(zfront2));
        ya = sqrt(sqr(xright) + sqr(yright) + sqr(zright));
        za = sqrt(sqr(xup) + sqr(yup) + sqr(zup));
        d3d_transform_add_scaling (xa, ya, za);
        xa = 1/xa;
        ya = 1/ya;
        za = 1/za;
        xfront2 *= xa;
        yfront2 *= xa;
        zfront2 *= xa;
        xright *= ya;
        yright *= ya;
        zright *= ya;
        xup *= za;
        yup *= za;
        zup *= za;
        xa = xright*xup + yright*yup + zright*zup;
        ya = xfront2*xup + yfront2*yup + zfront2*zup;
        a = arctan2 (xa,ya);
        d3d_transform_add_rotation_z (radtodeg (a)); 
        cosa = cos (a);
        sina = sin (a);
        xfront = cosa*xfront2 + sina*xright;
        yfront = cosa*yfront2 + sina*yright;
        zfront = cosa*zfront2 + sina*zright;
        xright = cosa*xright - sina*xfront2;
        yright = cosa*yright - sina*yfront2;
        zright = cosa*zright - sina*zfront2; 
        d3d_transform_add_rotation_y (45);
        xfront2 = xfront - xup;
        yfront2 = yfront - yup;
        zfront2 = zfront - zup;
        xup += xfront;
        yup += yfront;
        zup += zfront;
        xa = sqrt(sqr(xfront2) + sqr(yfront2) + sqr(zfront2));
        za = (xfront2*yright - yfront2*xright) * zup +
             (yfront2*zright - zfront2*yright) * xup +
             (zfront2*xright - xfront2*zright) * yup;
        za /= xa;
        d3d_transform_add_scaling (0.70710678118654752440084436210485*xa, 1,
                                     0.70710678118654752440084436210485*za);
        xa = 1/xa;
        za = 1/za;
        xfront = xfront2 * xa; 
        yfront = yfront2 * xa; 
        zfront = zfront2 * xa; 
        xup *= za;
        yup *= za;
        zup *= za;                
        // The rest of the transformation is special orthogonal.
    } else if (m >= 3) {
        // We assume the transformation has orthogonal columns.
        xa = sqrt(sqr(xfront) + sqr(yfront) + sqr(zfront));
        ya = sqrt(sqr(xright) + sqr(yright) + sqr(zright));
        za = (xfront*yright - yfront*xright) * zup +
             (yfront*zright - zfront*yright) * xup +
             (zfront*xright - xfront*zright) * yup;
        za /= xa*ya;
        d3d_transform_add_scaling (xa, ya, za);
        xa = 1/xa;
        ya = 1/ya;
        za = 1/za;
        xfront *= xa;
        yfront *= xa;
        zfront *= xa;
        xright *= ya;
        yright *= ya;
        zright *= ya;
        xup *= za;
        yup *= za;
        zup *= za;
        // The rest of the transformation is special orthogonal.
    } else if (m >= 2) {
        // We assume the transformation is orthogonal.
        za = (xfront*yright - yfront*xright) * zup +
             (yfront*zright - zfront*yright) * xup +
             (zfront*xright - xfront*zright) * yup;
        if (za < 0) {
            d3d_transform_add_scaling (1,1,-1);
            xup = -xup;
            yup = -yup;
            zup = -zup;
            // The rest of the transformation is special orthogonal.
        }        
    }
    // We assume the transformation is special orthogonal and
    // determine the corresponding rotation_axis transformation.
    // compute the cosine of angle
    cosa = xfront + yright + zup - 1;
    cosa *= 0.5;
    if (cosa > -0.9) {
        // The angle is not close to 180, such that the sine is 
        // either not close to zero, or less close to zero than
        // 1 minus the cosine.
        xa = yup - zright; 
        ya = zfront - xup; 
        za = xright - yfront; 
        sina = 0.5 * sqrt (sqr(xa) + sqr(ya) + sqr(za));            
    } else {
        // The above method is instable, since the sine is close 
        // to zero. 1 mines the cosine is not close to zero.
        xa = xfront; 
        ya = yright; 
        za = zup;
        switch (max(xa,ya,za)) {
          case xa:
            xa -= cosa;
            sina = (yup - zright) * 0.5 * sqrt ((1 - cosa) / xa);         
            xa *= 2;
            ya = xright + yfront; 
            za = zfront + xup;
            break;     
          case ya:
            ya -= cosa;
            sina = (zfront - xup) * 0.5 * sqrt ((1 - cosa) / ya);         
            xa = xright + yfront;
            ya *= 2;
            za = yup + zright;
            break;      
          case za:
            za -= cosa;
            sina = (xright - yfront) * 0.5 * sqrt ((1 - cosa) / za);         
            xa = zfront + xup; 
            ya = yup + zright; 
            za *= 2;
        }
    }
    a = radtodeg (arctan2 (sina,cosa));
    d3d_transform_add_rotation_axis (xa, ya, za, a);
    d3d_transform_add_translation (global._transmod_array[c,9],
                                   global._transmod_array[c,10],
                                   global._transmod_array[c,11]);
}
