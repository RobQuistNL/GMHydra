{
    var k, l, m, c, d;
    if (global._transmod_current != -1){
        c = global._transmod_current;
        if (global._transmod_array[c,22]) {
            if (global._transmod_array[c,21]) {
                // linear part of transformation might be not orthogonal
                // compute the cofactor matrix for the normals
                global._transmod_array[c,12] = 
                        global._transmod_array[c,4] *
                        global._transmod_array[c,8] -
                        global._transmod_array[c,5] *
                        global._transmod_array[c,7];
                global._transmod_array[c,13] = 
                        global._transmod_array[c,5] *
                        global._transmod_array[c,6] -
                        global._transmod_array[c,3] *
                        global._transmod_array[c,8];
                global._transmod_array[c,14] = 
                        global._transmod_array[c,3] *
                        global._transmod_array[c,7] -
                        global._transmod_array[c,4] *
                        global._transmod_array[c,6];
                global._transmod_array[c,15] = 
                        global._transmod_array[c,7] *
                        global._transmod_array[c,2] -
                        global._transmod_array[c,8] *
                        global._transmod_array[c,1];
                global._transmod_array[c,16] = 
                        global._transmod_array[c,8] *
                        global._transmod_array[c,0] -
                        global._transmod_array[c,6] *
                        global._transmod_array[c,2];
                global._transmod_array[c,17] = 
                        global._transmod_array[c,6] *
                        global._transmod_array[c,1] -
                        global._transmod_array[c,7] *
                        global._transmod_array[c,0];
                global._transmod_array[c,18] = 
                        global._transmod_array[c,1] *
                        global._transmod_array[c,5] -
                        global._transmod_array[c,2] *
                        global._transmod_array[c,4];
                global._transmod_array[c,19] = 
                        global._transmod_array[c,2] *
                        global._transmod_array[c,3] -
                        global._transmod_array[c,0] *
                        global._transmod_array[c,5];
                global._transmod_array[c,20] = 
                        global._transmod_array[c,0] *
                        global._transmod_array[c,4] -
                        global._transmod_array[c,1] *
                        global._transmod_array[c,3];
            }
            // invert matrix 
            d = 1/(global._transmod_array[c,0] *
                   global._transmod_array[c,12] +
                   global._transmod_array[c,1] *
                   global._transmod_array[c,13] +
                   global._transmod_array[c,2] *
                   global._transmod_array[c,14]);
            for (k=0; k<3; k+=1) {
                for (l=0; l<3; l+=1) {
                    m = d * global._transmod_array[c,12+k+3*l];
                    global._transmod_array[c,12+k+3*l] =
                        d * global._transmod_array[c,3*k+l];
                    global._transmod_array[c,3*k+l] = m;                        
                }
            }
            global._transmod_array[c,21] = 0;
        } else {
            // transpose matrix
            for (k=0; k<3; k+=1) {
                for (l=0; l<3; l+=1) {
                    global._transmod_array[c,12+k+3*l] =
                        global._transmod_array[c,3*k+l];
                }
            }
            for (k=0; k<9; k+=1) {
                    global._transmod_array[c,k] =
                        global._transmod_array[c,12+k];
            }
            global._transmod_array[c,21] = 0;
        }
        // invert translation
        for (k=0; k<3; k+=1) {
            l[k] = global._transmod_array[c,k+0] * 
                   global._transmod_array[c,9] +
                   global._transmod_array[c,k+3] * 
                   global._transmod_array[c,10] +
                   global._transmod_array[c,k+6] * 
                   global._transmod_array[c,11];
        }        
        for (k=0; k<3; k+=1) {
            global._transmod_array[c,k+9] = -l[k];
        }        
    }    
}        
