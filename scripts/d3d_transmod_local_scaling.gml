{
    var xs, ys, zs, o;
    xs = argument0;
    ys = argument1;
    zs = argument2;
    o = ((abs(xs) == 1) and (abs (ys) == 1) and (abs (zs) == 1));
    d3d_transmod_local_matrix (xs,0,0, 0,ys,0, 0,0,zs,
                               argument3, argument4, argument5, o);
}
