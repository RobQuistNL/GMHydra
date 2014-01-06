{
    var a, c, s;
    a = degtorad (argument0);
    c = cos (a);
    s = sin (a);
    d3d_transmod_add_matrix (c,0,s, 0,1,0, -s,0,c,
                             argument1, argument2, argument3, 1);
}
