{
    var c;
    if (global._transmod_current == -1){
        d3d_transmod_set_identity ();
    }    
    c = global._transmod_current;
    global._transmod_array[c,9]  += argument0;
    global._transmod_array[c,10] += argument1;
    global._transmod_array[c,11] += argument2;
}            
