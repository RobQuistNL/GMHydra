{
    var c, p;
    p = argument0;
    if (p <= 0) p = 1;
    if (global._transmod_current != -1) {
        c = global._transmod_current;        
    } else {
        c = 0;
        for (k=0; k<23; k+=1) {
            global._transmod_array[0,k] = !(k & 3);
        }    
    }
    // push p transformations
    do {
        if (global._transmod_array[c,21]) {
            for (k=0; k<12; k+=1) {
                global._transmod_array[c+1,k] = global._transmod_array[c,k];
            }
            global._transmod_array[c+1,21] = global._transmod_array[c,21];
            global._transmod_array[c+1,22] = global._transmod_array[c,22];
        } else {
            for (k=0; k<23; k+=1) {
                global._transmod_array[c+1,k] = global._transmod_array[c,k];
            }
        }
        c += 1;
        p -= 1;
    } until (p == 0);   
    global._transmod_current = c;
}
