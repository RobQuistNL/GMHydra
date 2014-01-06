{
    var c, k, e1, e2, e3;
    if (global._transmod_current == -1){
        d3d_transmod_set_identity ();
    }    
    c = global._transmod_current;
    for (k=0; k<3; k+=1) {
        e1 = global._transmod_array[c,k+0] * argument0 +
             global._transmod_array[c,k+3] * argument1 +
             global._transmod_array[c,k+6] * argument2;
        e2 = global._transmod_array[c,k+0] * argument3 +
             global._transmod_array[c,k+3] * argument4 +
             global._transmod_array[c,k+6] * argument5;
        e3 = global._transmod_array[c,k+0] * argument6 +
             global._transmod_array[c,k+3] * argument7 +
             global._transmod_array[c,k+6] * argument8;
        global._transmod_array[c,k+9] +=
             global._transmod_array[c,k+0] * argument9 +
             global._transmod_array[c,k+3] * argument10 +
             global._transmod_array[c,k+6] * argument11;
        global._transmod_array[c,k+0] = e1;
        global._transmod_array[c,k+3] = e2;
        global._transmod_array[c,k+6] = e3;
    }
    global._transmod_array[c,21] = 1;
    global._transmod_array[c,22] |= !argument12;
    d3d_transmod_local_translation (-argument9, -argument10, -argument11);
}            
