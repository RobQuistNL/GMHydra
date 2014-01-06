{
    var k, c; 
    if (global._transmod_current != -1) {
        c = global._transmod_current;
        if (global._transmod_array[c,21]) {
            if (global._transmod_array[c,22]) {
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
            } else {
                // linear part of transformation is orthogonal
                // copy the matrix
                for (k=0; k<9; k+=1) 
                    global._transmod_array[c,k+12] = 
                            global._transmod_array[c,k];
            }                            
            global._transmod_array[c,21] = 0;
        }
    } else {
        global._transmod_current = 0;    
        for (k=0; k<23; k+=1) {
            global._transmod_array[0,k] = !(k & 3);
        }
    }
    d3d_model_primitive_begin (argument0, argument1);
}        
