{
    var c, k;
    if (global._transmod_current == -1){
        d3d_transmod_set_identity ();
    }    
    c = global._transmod_current;
    for (k=0; k<3; k+=1) {
        global._transmod_array[c,k+9] += 
            global._transmod_array[c,k+0] * argument0 +
            global._transmod_array[c,k+3] * argument1 +
            global._transmod_array[c,k+6] * argument2;
    }        
}            
