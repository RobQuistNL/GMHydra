{
    var c, k, ex, ey, ez;
    if (global._transmod_current == -1){
        d3d_transmod_set_identity ();
    }    
    c = global._transmod_current;
    d3d_transmod_add_translation (-argument9, -argument10, -argument11);
    for (k=0; k<12; k+=3) {
        ex = argument0 * global._transmod_array[c,k+0] +
             argument3 * global._transmod_array[c,k+1] +
             argument6 * global._transmod_array[c,k+2];
        ey = argument1 * global._transmod_array[c,k+0] +
             argument4 * global._transmod_array[c,k+1] +
             argument7 * global._transmod_array[c,k+2];
        ez = argument2 * global._transmod_array[c,k+0] +
             argument5 * global._transmod_array[c,k+1] +
             argument8 * global._transmod_array[c,k+2];
        global._transmod_array[c,k+0] = ex;
        global._transmod_array[c,k+1] = ey;
        global._transmod_array[c,k+2] = ez;
    }
    d3d_transmod_add_translation (argument9, argument10, argument11);
    global._transmod_array[c,21] = 1;
    global._transmod_array[c,22] |= !argument12;
}            
