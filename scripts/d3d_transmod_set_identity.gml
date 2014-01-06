{
    var c, k;
    if (global._transmod_current == -1){
        global._transmod_current = 0;
    } 
    c = global._transmod_current;
    for (k=0; k<23; k+=1) {
        global._transmod_array[c,k] = !(k & 3);
    }    
}            
