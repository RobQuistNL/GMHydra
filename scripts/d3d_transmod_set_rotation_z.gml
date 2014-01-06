{
    var a, c, s;
    a = degtorad (argument0);
    c = cos (a);
    s = sin (a);
    d3d_transmod_set_matrix (c,-s,0, s,c,0, 0,0,1,
                             argument1, argument2, argument3, 1);
}
