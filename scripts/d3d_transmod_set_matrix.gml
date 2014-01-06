{
    var c, k;
    if (global._transmod_current == -1){
        d3d_transmod_set_identity ();
    }    
    c = global._transmod_current;
    for (k=0; k<12; k+=1) {
        global._transmod_array[c,k] = argument[k];
    }
    global._transmod_array[c,21] = 1;
    global._transmod_array[c,22] = !argument12;
    d3d_transmod_local_translation (-argument9, -argument10, -argument11);
}            
