{
    var a, c, s;
    a = degtorad (argument0);
    c = cos (a);
    s = sin (a);
    d3d_transmod_add_matrix (1,0,0, 0,c,-s, 0,s,c,
                             argument1, argument2, argument3, 1);
}
