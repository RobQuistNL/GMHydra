{
    var c, p, r;
    p = argument0;
    if (p <= 0) p = 1;
    if (global._transmod_current != -1) {
        c = global._transmod_current;
    } else {
        c = 0;
    }
    // no transformations
    if (c <= 0) return false;
    r = true;    
    if (c < p) {
        // not enough transformations to discard
        r = false;
        p = c;
    }     
    // pop p transformations
    global._transmod_current -= p;
    return r;
}    
