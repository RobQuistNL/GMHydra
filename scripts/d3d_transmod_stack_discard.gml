{
    var c, d, r;
    d = argument0;
    if (d <= 0) d = 1;
    if (global._transmod_current != -1) {
        c = global._transmod_current;        
    } else {
        c = 0;
    }
    // no transformations
    if (c <= 0) return false;
    r = true;    
    if (c < d) {
        // not enough transformations to discard
        r = false;
        d = c;
    }     
    // discard d transformations
    d = c - d;
    if (global._transmod_array[c,21]) {
        for (k=0; k<12; k+=1) {
            global._transmod_array[d,k] = global._transmod_array[c,k];
        }
        global._transmod_array[d,21] = global._transmod_array[c,21];
        global._transmod_array[d,22] = global._transmod_array[c,22];
    } else {
        for (k=0; k<23; k+=1) {
           global._transmod_array[d,k] = global._transmod_array[c,k];
        }
    }
    global._transmod_current = d;
    return r;        
}
