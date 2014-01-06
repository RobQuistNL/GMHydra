{
    var xa, ya, za, n, a, c, s, t;
    xa = argument0;
    ya = argument1;
    za = argument2;
    // normalize axis
    n = 1 / sqrt(xa*xa + ya*ya + za*za);
    xa *= n;
    ya *= n;
    za *= n;
    a = degtorad (argument3);
    c = cos (a);
    s = sin (a);
    // steal formula from internet
    t = 1 - c;
    d3d_transmod_add_matrix (t*xa*xa + c, t*xa*ya - s*za, t*xa*za + s*ya,
                             t*xa*ya + s*za, t*ya*ya + c, t*ya*za - s*xa,
                             t*xa*za - s*ya, t*ya*za + s*xa, t*za*za + c,
                             argument4, argument5, argument6, 1);
}
