{
    var c, t;
    t = argument0;
    if (t <= 0) t = 1;
    if (global._transmod_current != -1) {
        c = global._transmod_current;        
    } else {
        c = 0;
    }
    // not enough transformations
    if (c < t) return false;
    // top t transformations
    t = c - t;
    if (global._transmod_array[t,21]) {
        for (k=0; k<12; k+=1) {
            global._transmod_array[c,k] = global._transmod_array[t,k];
        }
        global._transmod_array[c,21] = global._transmod_array[t,21];
        global._transmod_array[c,22] = global._transmod_array[t,22];
    } else {
        for (k=0; k<23; k+=1) {
           global._transmod_array[c,k] = global._transmod_array[t,k];
        }
    }
    global._transmod_current = c;
    return true;        
}
