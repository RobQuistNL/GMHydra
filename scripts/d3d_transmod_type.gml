{
    var t, k, l, m;
    if (global._transmod_current == -1){
        return 1;
    }
    c = global._transmod_current; 
    if (not global._transmod_array[c,22]) {
        m = 2;
    } else {
        m = 4;
    }        
    t = argument0;
    if (t <= 0) return m;
    var xfront, yfront, zfront, xright, yright, zright, xup, yup, zup;
    xfront = global._transmod_array[c,0];
    yfront = global._transmod_array[c,1];
    zfront = global._transmod_array[c,2];
    xright = global._transmod_array[c,3];
    yright = global._transmod_array[c,4];
    zright = global._transmod_array[c,5];
    xup = global._transmod_array[c,6];
    yup = global._transmod_array[c,7];
    zup = global._transmod_array[c,8];
    if (m == 4) {
        if (abs (xfront*xright + yfront*yright + zfront*zright) <= t and
            abs (xfront*xup + yfront*yup + zfront*zup) <= t and
            abs (xright*xup + yright*yup + zright*zup) <= t) m = 3;
    }            
    if (m == 3) {
        if (abs (sqr(xfront) + sqr(yfront) + sqr(zfront) - 1) <= t and
            abs (sqr(xright) + sqr(yright) + sqr(zright) - 1) <= t and
            abs (sqr(xup) + sqr(yup) + sqr(zup) - 1) <= t) m = 2;
    }             
    if (m == 2) {
        if ((xfront*yright - yfront*xright) * zup +
            (yfront*zright - zfront*yright) * xup +
            (zfront*xright - xfront*zright) * yup > 0) return 1;    
    }
    return m;
}
